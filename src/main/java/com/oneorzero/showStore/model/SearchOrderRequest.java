package com.oneorzero.showStore.model;

public class SearchOrderRequest implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private String store_id;
	
	public SearchOrderRequest() {
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

}
