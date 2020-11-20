package com.oneorzero.storeOrder.model;

import java.util.List;

import com.oneorzero.bean.Store_OrderSettingBean;

public class StoreOrderRequest implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	private List<Store_OrderSettingBean> storeOrder;
	
	public StoreOrderRequest() {
	}
	
	public StoreOrderRequest(List<Store_OrderSettingBean> storeOrder) {
		this.storeOrder = storeOrder;
	}

	public List<Store_OrderSettingBean> getStoreOrder() {
		return storeOrder;
	}

	public void setStoreOrder(List<Store_OrderSettingBean> storeOrder) {
		this.storeOrder = storeOrder;
	}
	
	
}
