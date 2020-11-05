package com.oneorzero.showStore.dao.impl;

 import java.util.ArrayList;
<<<<<<< HEAD
 import java.util.List;

 import org.hibernate.Session;
 import org.hibernate.SessionFactory;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Repository;
=======
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
>>>>>>> 6c9a238a7b07c3fd05b84fb5d194541cea0e1194

import com.oneorzero.bean.StoreBean;
import com.oneorzero.showStore.dao.IShowStoreDao;

 @SuppressWarnings("unchecked")
 @Repository
 public class ShowStoreDao implements IShowStoreDao{

 	@Autowired
 	SessionFactory factory;

 	private static final int storesPerPage = 6;

 	@Override
 	public List<StoreBean> showStore() {
 		Session session = factory.getCurrentSession();
 		String hql = "FROM StoreBean";
 		List<StoreBean> list = new ArrayList<StoreBean>();
 		list = session.createQuery(hql).getResultList();
 		return list;
 	}

 	@Override
 	public StoreBean findByPK(int key) {
 		Session session = factory.getCurrentSession();
 		return session.get(StoreBean.class, key);
 	}

 	@Override
 	public int getTotalPages() {
 		Session session = factory.getCurrentSession();
 		String hql = "SELECT count(*) FROM StoreBean";
 		long counts = (long) session.createQuery(hql).getSingleResult();  //必須轉型為long
 		int totalPages = (int) (Math.ceil((double)counts / (double)storesPerPage));
 		return totalPages;
 	}

 	//按照頁面號碼顯示店家
 	@Override
 	public List<StoreBean> showStoresByPageNo(Integer pageNo) { 
 		int startNo = (pageNo - 1) * storesPerPage;
 		String hql = "FROM StoreBean";
 		Session session = factory.getCurrentSession();
 		return session.createQuery(hql)
 				.setMaxResults(storesPerPage)
 				.setFirstResult(startNo)   //第一筆資料是從0開始
 				.getResultList();
 	}

	@Override
	public List<StoreBean> showStoresByArea(Integer pageNo, String area) {
			int startNo = (pageNo - 1) * storesPerPage;
			Session session = factory.getCurrentSession();
			String hql = "FROM StoreBean where address_area = :area";
			if (area.equals("不限") || area.trim().length() == 0) {
				hql = "FROM StoreBean";
				return session.createQuery(hql)
						.setMaxResults(storesPerPage)//最大筆數
						.setFirstResult(startNo)//第一筆資料(從0開始)
						.getResultList();
			} else return session.createQuery(hql)
					.setParameter("area", area)
					.setMaxResults(storesPerPage)//最大筆數
					.setFirstResult(startNo)//第一筆資料(從0開始)
					.getResultList();
	}

	@Override
	public int getTotalAreaPages(String area) {
		String hql = "SELECT count(*) FROM StoreBean where address_area = :area";
		Session session = factory.getCurrentSession();
		long counts;
		int totalPages;
 		if (area.equals("不限") || area.trim().length() == 0) {
 			hql = " SELECT count(*)FROM StoreBean";
 			counts = (long) session.createQuery(hql).getSingleResult();
 	 		totalPages = (int) (Math.ceil((double)counts / (double)storesPerPage));
 	 		return totalPages;
 		} else {
 			counts = (long) session.createQuery(hql).setParameter("area", area).getSingleResult();
 	 		totalPages = (int) (Math.ceil((double)counts / (double)storesPerPage));
 	 		return totalPages;
 		}
	}
	
	@Override
	public boolean existStore_Id(String store_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(store_id) FROM Store_OrderSettingBean WHERE store_id = :store_id";
		try {
			Long count = (Long)session.createQuery(hql)
					.setParameter("store_id", store_id)
					.getSingleResult();
			if (count > 0) {
				System.out.println("count =>" + count);
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

 }