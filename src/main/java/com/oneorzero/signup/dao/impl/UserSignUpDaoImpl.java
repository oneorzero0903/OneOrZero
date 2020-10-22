package com.oneorzero.signup.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.signup.dao.IUserSignUpDao;
@Repository
public class UserSignUpDaoImpl implements IUserSignUpDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public boolean signUp(MemberBean mb) {
		boolean status = false;
		Session session = null;
		List<MemberBean> member = new ArrayList<>();
		String hql = "SELECT email FROM MemberBean WHERE email = :email";
		session = factory.getCurrentSession();
		member = session.createQuery(hql)
				.setParameter("email", mb.getEmail())				
				.getResultList();
		if (member.size() == 0) {
			session.save(mb);
			status = true;
		}
		return status;
	}

	@Override
	public void verifyAccount(String email) {
		String hql = "UPDATE MemberBean SET isSuccess='on'  WHERE email = :email";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("email", email).executeUpdate();
	}
	
}
