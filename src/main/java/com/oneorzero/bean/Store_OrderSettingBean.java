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
	@JoinColumn(name = "store_id")
	private StoreBean store;//商家編號
	
	private String phone;//電話
	private String address;//地址
	private String dateStart;//日期(起) (週一:1, 週二:2, 週三:3, 週四:4, 週五:5, 週六:6, 週日:7)
	private String dateEnd;//日期(迄) (週一:1, 週二:2, 週三:3, 週四:4, 週五:5, 週六:6, 週日:7)
	private String personMin;//最小預約人數
	private String personMax;//最大預約人數
	private String timeStart;//可預約時間(起)
	private String timeEnd;//可預約時間(迄)
	private String space;
	private Integer boothNum;//可預約包廂數量
	
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));//建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));//修改日期
	
	public Store_OrderSettingBean() {
	}

	public Store_OrderSettingBean(Integer setting_id, String phone, String address, String dateStart, String dateEnd, String personMin, String personMax, String timeStart, String timeEnd, String space, Integer boothNum,
			String create_dt, String update_dt) {
		String timeStr1 = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.setting_id = setting_id;
		this.phone = phone;
		this.address = address;
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.personMin = personMin;
		this.personMax = personMax;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
		this.space = space;
		this.boothNum = boothNum;
		this.create_dt = timeStr1;
		this.update_dt = timeStr1;
	}
	
	public String getSpace() {
		return space;
	}

	public void setSpace(String space) {
		this.space = space;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDateEnd() {
		return dateEnd;
	}

	public String getDateStart() {
		return dateStart;
	}

	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}
	
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}

	public String getPersonMin() {
		return personMin;
	}

	public void setPersonMin(String personMin) {
		this.personMin = personMin;
	}

	public String getPersonMax() {
		return personMax;
	}

	public void setPersonMax(String personMax) {
		this.personMax = personMax;
	}

	public StoreBean getStore() {
		return store;
	}

	public void setStore(StoreBean store) {
		this.store = store;
	}

	public Integer getSetting_id() {
		return setting_id;
	}

	public void setSetting_id(Integer setting_id) {
		this.setting_id = setting_id;
	}

	public String getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}

	public String getTimeEnd() {
		return timeEnd;
	}

	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}

	public Integer getBoothNum() {
		return boothNum;
	}

	public void setBoothNum(Integer boothNum) {
		this.boothNum = boothNum;
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
