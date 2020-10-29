package com.oneorzero.showStore.dao.impl;

 import java.util.ArrayList;
 import java.util.List;

 import org.hibernate.Session;
 import org.hibernate.SessionFactory;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Repository;

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
 		String hql = "SELECT count(*) FROM StoreBean";
 		Session session = factory.getCurrentSession();
 		long counts = (long) session.createQuery(hql).getSingleResult();
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
 				.setFirstResult(startNo)
 				.getResultList();
 	}

 }