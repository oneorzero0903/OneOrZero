package com.oneorzero.login.main;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.OrdersBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.login.util.HibernateUtils;

public class InsertOrder {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		MemberBean member = new MemberBean("one@gmail.com", "8888", "one", "1990-9-2", "N", "0922111444");
		StoreBean store = new StoreBean();
		OrdersBean o1 = new OrdersBean("one", "2020-1-1", 200, 3, 3, null, member, store);
		Transaction tx = session.beginTransaction();
		session.persist(o1);
		tx.commit();
		factory.close();
	}

}
