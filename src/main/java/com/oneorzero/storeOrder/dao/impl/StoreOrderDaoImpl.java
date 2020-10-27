package com.oneorzero.storeOrder.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
@Repository
public class StoreOrderDaoImpl implements IStoreOrderDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public boolean signUp(Store_OrderSettingBean sob) {
		boolean status = false;
		Session session = null;
		List<MemberBean> member = new ArrayList<>();
//		String hql = "SELECT email FROM StoreBean WHERE email = :email";
//		session = factory.getCurrentSession();
//		member = session.createQuery(hql)
//				.setParameter("email", sb.getEmail())				
//				.getResultList();
		if (member.size() == 0) {
			session.save(sob);
			status = true;
		}
		return status;
	}

	@Override
	public void verifyAccount(String email) {
		String hql = "UPDATE StoreBean SET isSuccess='on'  WHERE email = :email";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("email", email).executeUpdate();
	}
	
}
