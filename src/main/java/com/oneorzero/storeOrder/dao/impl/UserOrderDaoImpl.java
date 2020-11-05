package com.oneorzero.storeOrder.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.OrderDayBean;
import com.oneorzero.bean.OrderTimeBean;
import com.oneorzero.bean.OrdersBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IUserOrderDao;
import com.oneorzero.storeOrder.model.BookingTimeRequest;

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

	@SuppressWarnings({ "unchecked", "null", "unused" })
	@Override
	public List<OrderTimeBean> getOrderTime(List<Store_OrderSettingBean> orderSetting, 
			BookingTimeRequest date) {
		Session session = factory.getCurrentSession();
		String[] dateArr = date.getDate().split("\\-");
		try {
			List<OrderTimeBean> getTimeList = new ArrayList<OrderTimeBean>();
			A:for (int i = 0; i < orderSetting.size(); i++) {
				String hql = "FROM OrderDayBean a "
						+ "INNER JOIN Store_OrderSettingBean b "
						+ "ON a.store_OrderSettingBean = b.setting_id "
						+ "WHERE b.setting_id = :id "
						+ "AND a.days = :days";
				List<OrderDayBean> isExist = (List<OrderDayBean>)session.createQuery(hql)//確定選取日期(星期)有沒有被廠商設定可訂位
						.setParameter("id", orderSetting.get(i).getSetting_id())
						.setParameter("days", getDay(dateArr[1]))
						.getResultList();
				if (isExist.size() > 0) {//再來是確定選取時間可不可以訂位
					String hql2 = "FROM OrderTimeBean WHERE setting_id = :setting_id";
					List<OrderTimeBean> orderTime = (List<OrderTimeBean>)session.createQuery(hql2)
							.setParameter("setting_id", orderSetting.get(i).getSetting_id())
							.getResultList();
					B:for (int j = 0; j < orderTime.size() - 1; j++) {//確定OrdersBean中沒有訂位過該日期
						String hql3 = "FROM OrdersBean a "
								+ "INNER JOIN Store_OrderSettingBean b "
								+ "ON a.store_OrderSettingBean = b.setting_id "
								+ "WHERE b.setting_id = :setting_id "
								+ "AND a.order_date = :order_date "
								+ "AND a.days = :days "
								+ "AND a.times = :times";
						List<OrdersBean> judgeTime = (List<OrdersBean>)session.createQuery(hql3)
								.setParameter("setting_id", orderSetting.get(i).getSetting_id())
								.setParameter("order_date", dateArr[0])
								.setParameter("days", getDay(dateArr[1]))
								.setParameter("times", orderTime.get(j).getTimes())
								.getResultList();
						if(judgeTime.size() > 0) {
							continue B;
						} 
						getTimeList.add(orderTime.get(j));
					}
				} else {
					continue A;
				}
			}
			
			return getTimeList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	private String getDay(String date) {
		switch (date) {
			case "Monday": return "1";
			case "Tuesday": return "2";
			case "Wednesday": return "3";
			case "Thursday": return "4";
			case "Friday": return "5";
			case "Saturday": return "6";
			case "Sunday": return "7";
			default: return "0";
		}
	}

}
