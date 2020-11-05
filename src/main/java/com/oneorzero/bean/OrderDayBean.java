package com.oneorzero.bean;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderDayBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer day_Id;
	
	private String days;//可預約日期

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "setting_id")
	private Store_OrderSettingBean store_OrderSettingBean;//訂單編號
	
	public OrderDayBean() {
	}

	public OrderDayBean(String days, Store_OrderSettingBean store_OrderSettingBean) {
		super();
		this.days = days;
		this.store_OrderSettingBean = store_OrderSettingBean;
	}

	public Integer getDay_Id() {
		return day_Id;
	}

	public void setDay_Id(Integer day_Id) {
		this.day_Id = day_Id;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public Store_OrderSettingBean getStore_OrderSettingBean() {
		return store_OrderSettingBean;
	}

	public void setStore_OrderSettingBean(Store_OrderSettingBean store_OrderSettingBean) {
		this.store_OrderSettingBean = store_OrderSettingBean;
	}

}
