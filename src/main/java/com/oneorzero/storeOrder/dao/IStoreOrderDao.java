package com.oneorzero.storeOrder.dao;

import java.util.List;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.model.StoreOrderListResponse;

public interface IStoreOrderDao {

	boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store);
	public Integer getStore_Id(String email);
	Integer checkStoreOrder(StoreBean store);
	public List<Store_OrderSettingBean> findOrder(String store_id);
	public boolean checkDayToGetSetting(Integer setting_id, String date);
	List<StoreOrderListResponse> getOrdersList(Integer setting_id, String date);
}