package com.oneorzero.storeOrder.service;

import java.util.List;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;

public interface IStoreOrderService {
	public boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store);
	public Integer getStore_Id(String email);
}