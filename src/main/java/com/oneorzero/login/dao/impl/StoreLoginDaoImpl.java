package com.oneorzero.login.dao.impl;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.login.dao.IStoreLoginDao;
@Repository
public class StoreLoginDaoImpl implements IStoreLoginDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public StoreBean checkAccountPassword(String account, String password) {
		Session session = null;
		StoreBean member = null;
		String hql = "FROM StoreBean WHERE email = :email and password = :password";
		session = factory.getCurrentSession();
		try {
			member = (StoreBean) session.createQuery(hql)
					.setParameter("email", account)
					.setParameter("password", password)
					.getSingleResult();
		} catch (Exception e) {
			return null;
		}
		
		return member;
	}
}
