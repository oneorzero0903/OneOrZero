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
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class AdvertisingBean implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ad_id;  //廣告編號
	
	@OneToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name = "store_id")
	private StoreBean store;  //商家編號
	
	private String title;  //標題
	private String description;  //說明
	private String status; //申請狀態(ing:審核中, ok:已通過, bad:未通過)
	private String imgPath;  //照片路徑
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));  //購買日期
	private Long adStartTime;  //廣告開始播放之日期轉換為毫秒數
	private Long adEndTime;  //廣告停止播放之日期轉換為毫秒數
	
	@JsonIgnore
	@Transient
	private MultipartFile adImage;  //暫存上傳圖片,讀取其資料轉為blob物件
	
	public AdvertisingBean() {
	}

	public Integer getAd_id() {
		return ad_id;
	}

	public void setAd_id(Integer ad_id) {
		this.ad_id = ad_id;
	}

	public StoreBean getStore() {
		return store;
	}

	public void setStore(StoreBean store) {
		this.store = store;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Long getAdStartTime() {
		return adStartTime;
	}

	public void setAdStartTime(Long adStartTime) {
		this.adStartTime = adStartTime;
	}

	public Long getAdEndTime() {
		return adEndTime;
	}

	public void setAdEndTime(Long adEndTime) {
		this.adEndTime = adEndTime;
	}

	public MultipartFile getAdImage() {
		return adImage;
	}

	public void setAdImage(MultipartFile adImage) {
		this.adImage = adImage;
	}
	
}
