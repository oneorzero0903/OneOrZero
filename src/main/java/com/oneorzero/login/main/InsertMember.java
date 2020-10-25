package com.oneorzero.login.main;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.login.util.HibernateUtils;

public class InsertMember {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		StoreBean s1 = new StoreBean("!paSSw0rd", "oneorzerocorp@gmail.com", "oneCafe", null, null, null, null, null,"off", "123", "555", "Jacob", "xxx", "now", "after");
		MemberBean m1 = new MemberBean("oneorzerocorp@gmail.com", "12345", "one", "1990-9-2", "N", "0922111444");
			
		Transaction tx = session.beginTransaction();
		session.save(m1);
		session.save(s1);
		tx.commit();
		factory.close();
	}

}
