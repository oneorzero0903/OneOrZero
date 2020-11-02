package com.oneorzero.advertising.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.advertising.dao.IAdvertisingDao;
import com.oneorzero.bean.AdvertisingBean;

@Repository
@SuppressWarnings("unchecked")
public class AdvertisingDao implements IAdvertisingDao {

	@Autowired
	SessionFactory factory;
	
	Date date = new Date();
	
	@Override
	public List<AdvertisingBean> showOKAd() {
		Session session = factory.getCurrentSession();
		String hql = "FROM AdvertisingBean where status = 'ok' and adTime >= :timeNow";
		return session.createQuery(hql).setParameter("timeNow", date.getTime() ).getResultList();
	}

	//下架過期廣告
	@Override
	public void deleteExpiredAd() {	
		Session session = factory.getCurrentSession();
		String hql = "DELETE AdvertisingBean where adTime < :time";
		session.createQuery(hql).setParameter("time", date.getTime()).executeUpdate();
	}

}
