package com.oneorzero.storeOrder.model;

public class StoreOrderListResponse implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String name;
	private Integer box;
	private String day;
	private String time;
	private String status;
	
	public StoreOrderListResponse(){
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getBox() {
		return box;
	}

	public void setBox(Integer box) {
		this.box = box;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
