package com.oneorzero.storeOrder.dao.impl;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
@Repository
public class StoreOrderDaoImpl implements IStoreOrderDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean signUp(Store_OrderSettingBean sob) {
		boolean status = false;
		Session session = null;
		session = factory.getCurrentSession();
		session.save(sob);
		status = true;
		return status;
	}

	@Override
	public void verifyAccount(String email) {
		String hql = "UPDATE StoreBean SET isSuccess='on'  WHERE email = :email";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("email", email).executeUpdate();
	}
	
}
