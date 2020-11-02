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
	
	//server啟動時 上架廣告
	@Override
	public List<AdvertisingBean> showOKAd() {
		Session session = factory.getCurrentSession();
		String hql = "FROM AdvertisingBean where status = 'ok' "
				   + "and adStartTime <= :timeNow1 and :timeNow2 <= adEndTime";
		return session.createQuery(hql).setParameter("timeNow1", date.getTime()).setParameter("timeNow2", date.getTime()).getResultList();
	}

	//下架過期廣告
	@Override
	public void deleteExpiredAd() {	
		Session session = factory.getCurrentSession();
		String hql = "DELETE AdvertisingBean where adEndTime < :time";
		session.createQuery(hql).setParameter("time", date.getTime()).executeUpdate();
	}

	//若目前有此店家的廣告正在投放提醒店家 重新選擇區間
	@Override
	public boolean buyAd(AdvertisingBean adBean) {
		Session session = factory.getCurrentSession();
		String hql = "FROM AdvertisingBean where status = 'ok' "
				+ " and adStartTime <= :timeNow1 and :timeNow2 <= adEndTime "
				+ " and store_id = :storeId";
		List<AdvertisingBean> list = session.createQuery(hql)
									 .setParameter("timeNow1", date.getTime())
									 .setParameter("timeNow2", date.getTime())
									 .setParameter("storeId", adBean.getStore().getStore_id())
									 .getResultList();
		if (list == null) {
			session.save(adBean);
			return true;
		} else return false;
		
	}

}
