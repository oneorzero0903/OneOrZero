package com.oneorzero.storeOrder.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
import com.oneorzero.storeOrder.service.IStoreOrderService;
@Service
@Transactional
public class StoreOrderService implements IStoreOrderService {
	@Autowired
	IStoreOrderDao dao;
	
	@Override
	public boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store) {
		return dao.insertStoreOrder(sob, store);
	}
	
	public Integer getStore_Id(String email) {
		return dao.getStore_Id(email);
	}

}
