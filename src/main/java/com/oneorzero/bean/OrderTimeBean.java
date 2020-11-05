package com.oneorzero.bean;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderTimeBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer time_Id;
	
	private String times;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "setting_id")
	private Store_OrderSettingBean store_OrderSettingBean;//訂單編號
	
	public OrderTimeBean() {
	}
	
	public OrderTimeBean(String times, Store_OrderSettingBean store_OrderSettingBean) {
		super();
		this.times = times;
		this.store_OrderSettingBean = store_OrderSettingBean;
	}



	public Integer getTime_Id() {
		return time_Id;
	}

	public void setTime_Id(Integer time_Id) {
		this.time_Id = time_Id;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public Store_OrderSettingBean getStore_OrderSettingBean() {
		return store_OrderSettingBean;
	}

	public void setStore_OrderSettingBean(Store_OrderSettingBean store_OrderSettingBean) {
		this.store_OrderSettingBean = store_OrderSettingBean;
	}
	
}
