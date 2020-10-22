package com.oneorzero.bean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DiscountBean implements java.io.Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer discount_id;  //折扣方案編號
	
	private String discount_name;  //折扣方案名稱
	private String use_status;  //使用狀態(use:已使用, nouse:未使用)
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));  //建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));  //修改日期
	
	public DiscountBean() {
	}

	public DiscountBean(Integer discount_id, String discount_name, String use_status, String create_dt, String update_dt) {
		String timeStr1 = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.discount_id = discount_id;
		this.discount_name = discount_name;
		this.use_status = use_status;
		this.create_dt = timeStr1;
		this.update_dt = timeStr1;
	}

	public Integer getDiscount_id() {
		return discount_id;
	}

	public void setDiscount_id(Integer discount_id) {
		this.discount_id = discount_id;
	}

	public String getDiscount_name() {
		return discount_name;
	}

	public void setDiscount_name(String discount_name) {
		this.discount_name = discount_name;
	}

	public String getUse_status() {
		return use_status;
	}

	public void setUse_status(String use_status) {
		this.use_status = use_status;
	}

	public String getCreate_dt() {
		return create_dt;
	}

	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}

	public String getUpdate_dt() {
		return update_dt;
	}

	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}

	

}
