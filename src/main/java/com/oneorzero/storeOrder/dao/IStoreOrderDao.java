package com.oneorzero.storeOrder.dao;

import com.oneorzero.bean.Store_OrderSettingBean;

public interface IStoreOrderDao {

	boolean signUp(Store_OrderSettingBean sob);
	
	void verifyAccount(String email);

}