package com.oneorzero.storeOrder.service;

import java.util.List;

import com.oneorzero.bean.OrderTimeBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.model.BookingTimeRequest;

public interface IUserOrderService {
	
	List<Store_OrderSettingBean> findOrder(String store_id);
	
	List<OrderTimeBean> getOrderTime(List<Store_OrderSettingBean> orderSetting,
			BookingTimeRequest date);
	
}