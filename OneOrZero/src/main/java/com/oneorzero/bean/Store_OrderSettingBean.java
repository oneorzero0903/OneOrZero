package com.oneorzero.bean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Store_OrderSettingBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer setting_id;//商家訂單編號
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn
	private StoreBean store;//商家編號
	
	private String TimeStart;//可預約時間(起)
	private String TimeEnd;//可預約時間(迄)
	private Integer BoothNum;//可預約包廂數量
	private String isBooth;//是否有包廂
	private String phone;//電話
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));//建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));//修改日期
	
	public Store_OrderSettingBean() {
	}

	public Store_OrderSettingBean(Integer setting_id, String timeStart, String timeEnd, Integer boothNum,
			String isBooth, String phone, String create_dt, String update_dt) {
		String timeStr1 = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.setting_id = setting_id;
		this.TimeStart = timeStart;
		this.TimeEnd = timeEnd;
		this.BoothNum = boothNum;
		this.isBooth = isBooth;
		this.phone = phone;
		this.create_dt = timeStr1;
		this.update_dt = timeStr1;
	}

	public Integer getSetting_id() {
		return setting_id;
	}

	public void setSetting_id(Integer setting_id) {
		this.setting_id = setting_id;
	}

	public String getTimeStart() {
		return TimeStart;
	}

	public void setTimeStart(String timeStart) {
		TimeStart = timeStart;
	}

	public String getTimeEnd() {
		return TimeEnd;
	}

	public void setTimeEnd(String timeEnd) {
		TimeEnd = timeEnd;
	}

	public Integer getBoothNum() {
		return BoothNum;
	}

	public void setBoothNum(Integer boothNum) {
		BoothNum = boothNum;
	}

	public String getIsBooth() {
		return isBooth;
	}

	public void setIsBooth(String isBooth) {
		this.isBooth = isBooth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
