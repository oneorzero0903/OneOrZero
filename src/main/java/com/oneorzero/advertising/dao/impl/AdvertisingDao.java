package com.oneorzero.advertising.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.advertising.dao.IAdvertisingDao;
import com.oneorzero.bean.AdvertisingBean;
import com.oneorzero.bean.StoreBean;

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
		String hql = "UPDATE AdvertisingBean set status = 'off' where adEndTime < :time";
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
									 .setParameter("timeNow1", adBean.getAdStartTime())
									 .setParameter("timeNow2",adBean.getAdStartTime())
									 .setParameter("storeId", adBean.getStore().getStore_id())
									 .getResultList();
		if (list.size() == 0) {
			session.save(adBean);
			return true;
		} else return false;
		
	}

	@Override
	public void updateAdImgPath(AdvertisingBean adBean) {
		Session session = factory.getCurrentSession();
		session.update(adBean);
	}

	@Override
	public AdvertisingBean findByPK(Integer ad_id) {
		Session session = factory.getCurrentSession();
		return session.get(AdvertisingBean.class, ad_id);
	}

	@Override
	public void timeMachine() {
		Session session = factory.getCurrentSession();
		String hql = "FROM AdvertisingBean where adStartTime <= :timeNow1 and :timeNow2 <= adEndTime";
		List<AdvertisingBean> list = session.createQuery(hql)
											.setMaxResults(5)
											.setParameter("timeNow1", date.getTime())
											.setParameter("timeNow2", date.getTime())
											.getResultList();
		for (AdvertisingBean ad : list) {
			ad.setAdEndTime(0L);
			ad.setStatus("off");
			session.update(ad);
		}
	}

	@Override
	public StoreBean getStore(Integer id) {
		Session session = factory.getCurrentSession();
		return session.get(StoreBean.class, id);
	}

}
