package com.oneorzero.product.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.ProductBean;
import com.oneorzero.product.dao.IProductDao;

@Repository
@SuppressWarnings("unchecked")
public class ProductDaoImpl implements IProductDao{
	
	@Autowired
	SessionFactory factory;
	
	private static final int productsPerPage = 6;  //限制一個頁面只顯示6個產品
	
	@Override
	public List<ProductBean> getAllProducts () {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean";  //抓全部部資料包含所有欄位
		List<ProductBean> list = new ArrayList<ProductBean>();
 		list = session.createQuery(hql).getResultList();
 		return list;
	}

	@Override
	public int getTotalPages() {
		Session session = factory.getCurrentSession();
		String hql = "select count(*) FROM ProductBean";  //抓出table中資料總數
		long counts = (long) session.createQuery(hql).getSingleResult();  //必須轉型為long 
		int totalPages = (int) Math.ceil((double) counts / (double) productsPerPage);  //因為Math.ceil只能(浮點數)使用double型態,所以須從int轉型為double
		return totalPages;
	}

	@Override
	public List<ProductBean> getProductsByPageNo(Integer pageNo) {
		Session session = factory.getCurrentSession();
		int starNo = (pageNo - 1) * productsPerPage;  //第一筆資料從0開始算起
		String hql = "FROM ProductBean";
		return session.createQuery(hql)   //把hql指令丟進去,交由hib自動生成sql指令
				.setMaxResults(productsPerPage)  //設定每頁顯示資料數
				.setFirstResult(starNo) 
				.getResultList();
		
	}
	
	@Override
	public ProductBean findByPK(int key) {
		Session session = factory.getCurrentSession();
//		String hql = "FROM ProductBean where id = :key";
//		session.createQuery(hql).setParameter("key", key).getSingleResult();
 		return session.get(ProductBean.class, key);  //與上兩句功能相同
	}

	
	
	//之後觀察是否有重複上架問題
	@Override
	public void insertAddProduct(ProductBean pb) {
		Session session = factory.getCurrentSession();
		session.save(pb);
	}

	//抓屬於此商家產品列表
	@Override
	public List<ProductBean> showMyProduct(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean WHERE store_id = :store_id"; 
		return session.createQuery(hql).setParameter("store_id", id).getResultList();
		
	}

	@Override
	public void dropProduct(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "delete ProductBean WHERE id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
//		session.delete(session.get(ProductBean.class, id));
	}

	@Override
	public void updateProduct(String name, Integer price, Integer stock, String description, Integer id) {
		Session session = factory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, id);
		pb.setName(name);
		pb.setPrice(price);
		pb.setStock(stock);
		pb.setDescription(description);
		session.update(pb);
	}

	@Override
	public List<ProductBean> ambiguousSearch(String searchStr) {
		String[] arr = searchStr.trim().split(" ");
		Session session = factory.getCurrentSession();
		List<ProductBean> allList = session.createQuery("FROM ProductBean where name like :searchName").setParameter("searchName", "%" + arr[0] + "%").getResultList();
		List<ProductBean> resultList = new ArrayList<ProductBean>();
		boolean flag = false;
		for (int i=0; i<allList.size(); i++, flag = false) {
			for (int j=0; j<arr.length; j++) {
				if (allList.get(i).getName().contains(arr[j])) {
					flag = true;
				} else {
					flag = false;
					break;
				}
			}
			if (flag) {
				resultList.add(allList.get(i));
			}
		}
		return resultList;
	}
	
	
}
