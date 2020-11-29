package com.oneorzero.collection.model;

public class RemarkUpdateRequest implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String remark;
	private Integer payment_id;
	public RemarkUpdateRequest() {
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(Integer payment_id) {
		this.payment_id = payment_id;
	}
	
}
