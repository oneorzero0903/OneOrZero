<<<<<<< HEAD
package com.oneorzero.storeOrder.service;

import java.util.List;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
import com.oneorzero.storeOrder.model.StoreOrderListResponse;

public interface IStoreOrderService {
	public boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store);
	public Integer getStore_Id(String email);
	public Integer checkStoreOrder(StoreBean store);
	public List<Store_OrderSettingBean> findOrder(String store_id);
	public List<String> checkDayToGetSetting(List<Store_OrderSettingBean> orderSetting, 
			BookingTimeRequest date);
	public List<StoreOrderListResponse> getOrdersList(Integer setting_id, String date);
	public boolean checkProgram(Integer store_id, String name);
=======
package com.oneorzero.storeOrder.service;

import java.util.List;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
import com.oneorzero.storeOrder.model.StoreOrderListResponse;

public interface IStoreOrderService {
	public boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store);
	public Integer getStore_Id(String email);
	public Integer checkStoreOrder(StoreBean store);
	public List<Store_OrderSettingBean> findOrder(String store_id);
	public List<String> checkDayToGetSetting(List<Store_OrderSettingBean> orderSetting, 
			BookingTimeRequest date);
	public List<StoreOrderListResponse> getOrdersList(Integer setting_id, String date);
	public boolean checkProgram(Integer store_id, String name);
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
}