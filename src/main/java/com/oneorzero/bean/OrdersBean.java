package com.oneorzero.bean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrdersBean implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_id; //訂單編號
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "member_id")
	private MemberBean member; //會員編號
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "setting_id")
	private Store_OrderSettingBean store_OrderSettingBean;//訂單編號
	
	private Integer store_id;//商家編號
	
	@Column(name = "email", columnDefinition = "VARCHAR(50) NOT NULL")
	private String email; //會員Email
	private String order_date; //預訂日期(yyyy/MM/dd)
	private String days;//預訂日期(星期)
	private String times;//預定時間
	private Integer service_charge; //服務費
	private Integer people_count; //人數
	private Integer box; //包廂
	private String remark; //備註
	private Integer isDelete = 1; //是否取消 1:未取消 0.已取消
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //修改日期
	
	public OrdersBean() {
	}
	
	public OrdersBean(String email, String order_date, String days, String times, Integer service_charge, Integer people_count, Integer box,
			String remark, MemberBean member, Store_OrderSettingBean store_OrderSettingBean, Integer store_id) {
		super();
		this.email = email;
		this.order_date = order_date;
		this.days = days;
		this.times = times;
		this.service_charge = service_charge;
		this.people_count = people_count;
		this.box = box;
		this.remark = remark;
		this.member = member;
		this.store_OrderSettingBean = store_OrderSettingBean;
		this.store_id = store_id;
	}
	
	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public Store_OrderSettingBean getStore_OrderSettingBean() {
		return store_OrderSettingBean;
	}

	public void setStore_OrderSettingBean(Store_OrderSettingBean store_OrderSettingBean) {
		this.store_OrderSettingBean = store_OrderSettingBean;
	}
	
	public Integer getStore() {
		return store_id;
	}

	public void setStore(Integer store_id) {
		this.store_id = store_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public Integer getService_charge() {
		return service_charge;
	}

	public void setService_charge(Integer service_charge) {
		this.service_charge = service_charge;
	}

	public Integer getPeople_count() {
		return people_count;
	}

	public void setPeople_count(Integer people_count) {
		this.people_count = people_count;
	}

	public Integer getBox() {
		return box;
	}

	public void setBox(Integer box) {
		this.box = box;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	
}
