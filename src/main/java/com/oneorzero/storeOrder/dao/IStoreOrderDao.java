package com.oneorzero.storeOrder.dao;

import java.util.List;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;

public interface IStoreOrderDao {

	boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store);
	public Integer getStore_Id(String email);
}