package com.oneorzero.storeOrder.dao.impl;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
@Repository
public class StoreOrderDaoImpl implements IStoreOrderDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store) {
		boolean status = false;
		Session session = factory.getCurrentSession();
		for (Store_OrderSettingBean list : sob) {
			list.setStore(store);
			session.save(list);
		}
		status = true;
		return status;
	}
	
	public Integer getStore_Id(String email) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT store_id FROM StoreBean WHERE email = :email";
		Object store_id = null;
		try {
			store_id = session.createQuery(hql)
					.setParameter("email", email)
					.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return (Integer)store_id;
	}

//	@Override
//	public void verifyAccount(String email) {
//		String hql = "UPDATE StoreBean SET isSuccess='on'  WHERE email = :email";
//		Session session = factory.getCurrentSession();
//		session.createQuery(hql).setParameter("email", email).executeUpdate();
//	}
	
}
