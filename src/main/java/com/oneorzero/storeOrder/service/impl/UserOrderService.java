package com.oneorzero.storeOrder.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.OrderTimeBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IUserOrderDao;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
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
	
	public List<OrderTimeBean> getOrderTime(List<Store_OrderSettingBean> orderSetting,
			BookingTimeRequest date) {
		return dao.getOrderTime(orderSetting, date);
	}
	
}
