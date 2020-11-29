package com.oneorzero.collection.model;

public class GetPaymentDtlRequest implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private String searchVal;
	
	public GetPaymentDtlRequest() {
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	
}
