package com.oneorzero.storeOrder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
import com.oneorzero.storeOrder.service.IStoreOrderService;
@Service
@Transactional
public class StoreOrderService implements IStoreOrderService {
	@Autowired
	IStoreOrderDao dao;
	
	@Override
	public boolean signUp(Store_OrderSettingBean sob) {
		return dao.signUp(sob);
	}

	@Override
	public void verifyAccount(String email) {
		dao.verifyAccount(email);
	}
}
