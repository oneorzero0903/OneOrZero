package com.oneorzero.storeOrder.dao;

import java.util.List;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.model.BookingRequest;

public interface IUserOrderDao {

	List<Store_OrderSettingBean> findOrder(String store_id);

	boolean checkDayToGetSetting(Integer setting_id, String date);
	
	String getPerson(Integer setting_id);
	
	List<String> getTimeCount(Integer setting_id, String date);

	Integer orderInsert(MemberBean member, StoreBean store, BookingRequest booking);

	void deleteOrder(String[] decodeString);
	
}