package com.oneorzero.storeOrder.model;

public class BookingRequest implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private String day;
	private String setting_id;
	private String times;

	public BookingRequest() {
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getSetting_id() {
		return setting_id;
	}

	public void setSetting_id(String setting_id) {
		this.setting_id = setting_id;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}
	
}
