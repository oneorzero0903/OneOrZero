package com.oneorzero.storeOrder.service;

import java.util.List;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
import com.oneorzero.storeOrder.model.BookingRequest;

public interface IUserOrderService {
	
	List<Store_OrderSettingBean> findOrder(String store_id);
	
	List<String> checkDayToGetSetting(List<Store_OrderSettingBean> orderSetting, 
			BookingTimeRequest date);
	
	String getPerson(Integer setting_id);
	
	List<String> getTimeToBooking(Integer setting_id, String date);

	Integer orderInsert(MemberBean member, StoreBean store, BookingRequest booking);

	void deleteOrder(String[] strings);
	
}