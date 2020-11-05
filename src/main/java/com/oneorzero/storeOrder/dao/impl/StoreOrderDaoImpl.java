package com.oneorzero.storeOrder.dao.impl;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.OrderDayBean;
import com.oneorzero.bean.OrderTimeBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
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
