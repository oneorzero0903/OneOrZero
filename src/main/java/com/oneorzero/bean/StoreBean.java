package com.oneorzero.bean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class StoreBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer store_id;//商家編號

	private String password;//商家密碼
	private String email;//Email
	private String store_name;//商家名稱
	private String address_city;//所在地_縣市
	private String address_area;//所在地_區
	private String address_road;//所在地_路名
	private String opentime_start;//營業時間(開始)
	private String opentime_end;//營業時間(結束)
	private String isSuccess = "off";//開通狀態 on:已開通 off:未開通
	private String tel;//公司電話
	private String phone;//行動電話
	private String contact_person;//聯絡人
	private String imgPath;//圖片路徑
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));//建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));//修改日期
	private Integer resetPwd = 0; //需要更新密碼 0:不需要 1:需要
	private Double rating = 0.0;
 	private Integer rateCount = 0;

	public StoreBean() {
	}
	
	public Integer getStore_id() {
 		return store_id;
 	}
	public void setStore_id(Integer store_id) {
		this.store_id = store_id;
	}
	
	public Integer getResetPwd() {
		return resetPwd;
	}
	public void setResetPwd(Integer resetPwd) {
		this.resetPwd = resetPwd;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
 		this.store_name = store_name;
 	}
	public String getAddress_city() {
 		return address_city;
 	}

 	public void setAddress_city(String address_city) {
 		this.address_city = address_city;
 	}

 	public Double getRating() {
 		return rating;
 	}

 	public void setRating(Double rating) {
 		this.rating = rating;
 	}

 	public Integer getRateCount() {
 		return rateCount;
 	}
 	public void setRateCount(Integer rateCount) {
 		this.rateCount = rateCount;
 	}

 	public String getAddress_area() {
		return address_area;
	}
	public void setAddress_area(String address_area) {
		this.address_area = address_area;
	}
	public String getAddress_road() {
		return address_road;
	}
	public void setAddress_road(String address_road) {
		this.address_road = address_road;
	}
	public String getOpentime_start() {
		return opentime_start;
	}
	public void setOpentime_start(String opentime_start) {
		this.opentime_start = opentime_start;
	}
	public String getOpentime_end() {
		return opentime_end;
	}
	public void setOpentime_end(String opentime_end) {
		this.opentime_end = opentime_end;
	}
	public String getIsSuccess() {
		return isSuccess;
	}
	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getContact_person() {
		return contact_person;
	}
	public void setContact_person(String contact_person) {
		this.contact_person = contact_person;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
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
