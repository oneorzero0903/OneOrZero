package com.oneorzero.storeOrder.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IUserOrderDao;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
import com.oneorzero.storeOrder.model.BookingRequest;
import com.oneorzero.storeOrder.service.IUserOrderService;
@Service
@Transactional
public class UserOrderService implements IUserOrderService {
	@Autowired
	IUserOrderDao dao;
	
	@Override
	public List<Store_OrderSettingBean> findOrder(String store_id) {
		return dao.findOrder(store_id);
	}
	
	@SuppressWarnings("null")
	@Override
	public List<String> checkDayToGetSetting(List<Store_OrderSettingBean> orderSetting, 
			BookingTimeRequest date) {
		
		String[] dateArr = date.getDate().split("\\-");
		List<String> list = new ArrayList<>();
		A:for (int i = 0; i < orderSetting.size(); i++) {
			boolean check = dao.checkDayToGetSetting(orderSetting.get(i).getSetting_id(), getDay(dateArr[1]));
			if (check) {
				list.add(String.valueOf(orderSetting.get(i).getSetting_id()));
			}else {
				continue A;
			}
		}
		return list;
		
	}
	
	@Override
	public String getPerson(Integer setting_id) {
		return dao.getPerson(setting_id);
	}
	
	@Override
	public List<String> getTimeToBooking(Integer setting_id, String date) {
		return dao.getTimeCount(setting_id, date);
	}
	
	@Override
	public Integer orderInsert(MemberBean member, StoreBean store, BookingRequest booking) {
		return dao.orderInsert(member, store, booking);
	}
	
	@Override
	public void deleteOrder(String[] decodeString) {
		dao.deleteOrder(decodeString);
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
