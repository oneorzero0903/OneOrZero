package com.oneorzero.storeOrder.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.OrderDayBean;
import com.oneorzero.bean.OrdersBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IUserOrderDao;
import com.oneorzero.storeOrder.model.BookingRequest;

@Repository
public class UserOrderDaoImpl implements IUserOrderDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Store_OrderSettingBean> findOrder(String store_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Store_OrderSettingBean WHERE store_id = :store_id";
		List<Store_OrderSettingBean> bean = 
				(List<Store_OrderSettingBean>) session.createQuery(hql)
				.setParameter("store_id", store_id).getResultList();
		return bean;
	}


	@SuppressWarnings("unchecked")
	@Override
	public boolean checkDayToGetSetting(Integer setting_id, String date) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM OrderDayBean WHERE setting_id = :setting_id AND days = :days";
			List<OrderDayBean> isExist = (List<OrderDayBean>)session.createQuery(hql)//確定選取日期(星期)有沒有被廠商設定可訂位
					.setParameter("setting_id", setting_id)
					.setParameter("days", date)
					.getResultList();
			if(isExist.size() > 0) {
				return true;
			}else {
				return false;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	@SuppressWarnings({ "unused" })
	@Override
	public String getPerson(Integer setting_id) {
		String person;
		try {
			Session session = factory.getCurrentSession();
			
			String hql = "SELECT person FROM Store_OrderSettingBean WHERE setting_id = :setting_id";
//			SQLQuery person = (SQLQuery) session.createSQLQuery(hql)
//			.addEntity(Store_OrderSettingBean.class)
//			.setParameter("setting_id", Integer.valueOf(setting_id)).getSingleResult();
			person = (String)session.createQuery(hql)
					.setParameter("setting_id", setting_id)
					.getSingleResult();
			return String.valueOf(person);
		} catch (HibernateException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@Override
	public List<String> getTimeCount(Integer setting_id, String date) {//撈出選取日可訂位時間(選定日當天若包廂已滿，該時段不放入list傳回)
		Store_OrderSettingBean store_OrderSettingBean;
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM Store_OrderSettingBean WHERE setting_id = :setting_id";
			store_OrderSettingBean = (Store_OrderSettingBean)session.createQuery(hql)
					.setParameter("setting_id", setting_id)
					.getSingleResult();
			String[] day = date.split("\\-");
			Integer boothNum = store_OrderSettingBean.getBoothNum();
			String[] timeStart = store_OrderSettingBean.getTimeStart().split("\\:");
			String[] timeEnd = store_OrderSettingBean.getTimeEnd().split("\\:");
			String space = store_OrderSettingBean.getSpace();
			List<String> timesList = new ArrayList<>();
			A:for (int i = Integer.parseInt(timeStart[0]); 
					i < Integer.parseInt(timeEnd[0]) ; 
					i += Integer.parseInt(space)) {
				String times = i + ":" + timeStart[1];
				String hql2 = "SELECT count(*) FROM OrdersBean WHERE setting_id = :setting_id AND order_date = :order_date AND times = :times AND isDelete = 1";
				Long countTimes = (Long)session.createQuery(hql2)
						.setParameter("setting_id", setting_id)
						.setParameter("order_date", day[0])
						.setParameter("times", times)
						.getSingleResult();
				if (countTimes >= boothNum) {
					continue A;
				}
				timesList.add(times);
			}
			return timesList;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer orderInsert(MemberBean member, StoreBean store, BookingRequest booking) {
		Session session = factory.getCurrentSession();
		String[] days = booking.getDay().split("\\-");
		String hql = "FROM Store_OrderSettingBean WHERE setting_id = :setting_id";
		Store_OrderSettingBean orderSetting = (Store_OrderSettingBean)session.createQuery(hql)
				.setParameter("setting_id", Integer.parseInt(booking.getSetting_id()))
				.getSingleResult();
		String hql2 = "SELECT count(*) FROM OrdersBean "
				+ "WHERE email = :email "
				+ "AND order_Date = :order_Date "
				+ "AND days = :days "
				+ "AND times = :times "
				+ "AND setting_id = :setting_id ";
		Long ordersCount = (Long)session.createQuery(hql2)
				.setParameter("email", member.getEmail())
				.setParameter("order_Date", days[0])
				.setParameter("days", days[1])
				.setParameter("times", booking.getTimes())
				.setParameter("setting_id", Integer.parseInt(booking.getSetting_id()))
				.getSingleResult();
		Integer box = 1;
		if(ordersCount > 0) {
			String hql3 = "SELECT MAX(box) FROM OrdersBean "
					+ "WHERE email = :email "
					+ "AND order_Date = :order_Date "
					+ "AND days = :days "
					+ "AND times = :times "
					+ "AND setting_id = :setting_id ";
			Integer orders = (Integer)session.createQuery(hql3)
					.setParameter("email", member.getEmail())
					.setParameter("order_Date", days[0])
					.setParameter("days", days[1])
					.setParameter("times", booking.getTimes())
					.setParameter("setting_id", Integer.parseInt(booking.getSetting_id()))
					.getSingleResult();
			box = orders + 1;
		} 
		OrdersBean ordersBean = new OrdersBean(member.getEmail(),days[0],days[1],booking.getTimes(),0
				,Integer.parseInt(orderSetting.getPerson()),box,"",member,orderSetting,store.getStore_id());
		session.save(ordersBean);
		return box;
	}
	
	@Override
	public void deleteOrder(String[] decodeString) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "UPDATE OrdersBean "
					+ "set isDelete = 0"
					+ "WHERE email = :email "
					+ "AND order_Date = :order_Date "
					+ "AND days = :days "
					+ "AND times = :times "
					+ "AND setting_id = :setting_id "
					+ "AND box = :box";
			session.createQuery(hql)
			.setParameter("email", decodeString[0])
			.setParameter("order_Date", decodeString[2])
			.setParameter("days", decodeString[3])
			.setParameter("times", decodeString[5])
			.setParameter("setting_id", decodeString[4])
			.setParameter("box", Integer.valueOf(decodeString[6]))
			.executeUpdate();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}

}
