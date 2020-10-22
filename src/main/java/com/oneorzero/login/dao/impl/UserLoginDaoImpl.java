package com.oneorzero.login.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.login.dao.IUserLoginDao;
@Repository
public class UserLoginDaoImpl implements IUserLoginDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<MemberBean> checkAccountPassword(String account, String password) {
		Session session = null;
		List<MemberBean> member = new ArrayList<>();
		String hql = "FROM MemberBean WHERE email = :email and password = :password";
		session = factory.getCurrentSession();
		member = session.createQuery(hql)
				.setParameter("email", account)
				.setParameter("password", password)
				.getResultList();
		return member;
	}
}
