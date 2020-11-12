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
import com.oneorzero.bean.OrderTimeBean;
import com.oneorzero.bean.OrdersBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
import com.oneorzero.storeOrder.model.StoreOrderListResponse;
@Repository
public class StoreOrderDaoImpl implements IStoreOrderDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store) {
		boolean status = false;
		Session session = factory.getCurrentSession();
		try {
			for (Store_OrderSettingBean list : sob) {
				list.setStore(store);
				session.save(list);
				String[] startTimeArr = list.getTimeStart().split("\\:");
				String[] endTimeArr = list.getTimeEnd().split("\\:");
				for (int i = Integer.parseInt(startTimeArr[0]) ; 
						 i < Integer.parseInt(endTimeArr[0]) ; 
						 i += Integer.parseInt(list.getSpace())) {
					OrderTimeBean Times = 
							new OrderTimeBean(i + ":" + startTimeArr[1], list);
					session.save(Times);
				}
				
				Integer startDay = getDayForDb(list.getDateStart());
				Integer startEnd = getDayForDb(list.getDateEnd());
				if (startEnd > startDay) {
					for (int i = startDay; i <= startEnd; i++){
						OrderDayBean days = 
								new OrderDayBean(Integer.toString(i), list);
						session.save(days);
					}
				} else if (startDay > startEnd) {
					for (int i = startDay; i <= 7; i++) {
						OrderDayBean days = 
								new OrderDayBean(Integer.toString(i), list);
						session.save(days);
					}
					for (int i = 1; i <= startEnd; i++) {
						OrderDayBean days = 
								new OrderDayBean(Integer.toString(i), list);
						session.save(days);
					}
				}
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return false;
		}
		status = true;
		return status;
	}
	
	@Override
	public Integer getStore_Id(String email) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT store_id FROM StoreBean WHERE email = :email";
		Object store_id = null;
		try {
			store_id = session.createQuery(hql)
					.setParameter("email", email)
					.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return (Integer)store_id;
	}
	
	@Override
	public Integer checkStoreOrder(StoreBean store) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "SELECT count(*) FROM Store_OrderSettingBean WHERE store_id = :store_id";
			Long storeOrderCount = (Long)session.createQuery(hql)
					.setParameter("store_id", store.getStore_id())
					.getSingleResult();
			return Integer.valueOf(storeOrderCount.intValue());
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
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
	
	@SuppressWarnings("unchecked")
	@Override
	public List<StoreOrderListResponse> getOrdersList(Integer setting_id, String date) {
		Session session = factory.getCurrentSession();
		String[] days = date.split("\\-");
		String hql = "FROM OrdersBean WHERE setting_id = :setting_id AND order_date = :order_date";
		List<OrdersBean> orderBean = (List<OrdersBean>)session.createQuery(hql)
				.setParameter("setting_id", setting_id)
				.setParameter("order_date", days[0])
				.getResultList();
		List<StoreOrderListResponse> storeOrderListResponse = 
				new ArrayList<>();
		for (int i = 0; i < orderBean.size(); i++) {
			String hql2 = "FROM MemberBean WHERE member_id = :member_id";
			MemberBean memberBean = (MemberBean)session.createQuery(hql2)
					.setParameter("member_id", orderBean.get(i).getMember().getMember_id())
					.getSingleResult();
			StoreOrderListResponse storeOrderList = new StoreOrderListResponse();
			storeOrderList.setName(memberBean.getName());
			storeOrderList.setBox(orderBean.get(i).getBox());
			storeOrderList.setDay(orderBean.get(i).getOrder_date());
			storeOrderList.setTime(orderBean.get(i).getTimes());
			storeOrderList.setStatus(statusChange(orderBean.get(i).getIsDelete()));
			storeOrderListResponse.add(storeOrderList);
		}
		return storeOrderListResponse;
	}
	
	private String statusChange(Integer isDelete) {
		switch (isDelete) {
		case 0:
			return "已取消";
		case 1:
			return "已訂位";
		default:
			return "";
		}
	}
	
	private Integer getDayForDb(String date) {
		switch (date) {
		case "1":
			return 1;
		case "2":
			return 2;
		case "3":
			return 3;
		case "4":
			return 4;
		case "5":
			return 5;
		case "6":
			return 6;
		case "7":
			return 7;
		default:
			return 0;
		}
	}

}
