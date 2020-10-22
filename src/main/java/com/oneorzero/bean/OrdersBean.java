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
import javax.persistence.OneToOne;

@Entity
public class OrdersBean implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_id; //訂單編號
	
	@OneToOne(cascade=CascadeType.PERSIST)
	@JoinColumn
	private MemberBean member; //會員編號
	
	@OneToOne(cascade=CascadeType.PERSIST)
	@JoinColumn
	private StoreBean store; //商家編號
	
	@Column(name = "email", columnDefinition = "VARCHAR(50) NOT NULL")
	private String email; //會員Email
	private String order_date; //預訂日期
	private Integer service_charge; //服務費
	private Integer  people_count; //人數
	private Integer box; //包廂
	private String remark; //備註
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //修改日期
	
	public OrdersBean() {
	}
	
	public OrdersBean(String email, String order_date, Integer service_charge, Integer people_count, Integer box,
			String remark, MemberBean member, StoreBean store) {
		super();
		this.email = email;
		this.order_date = order_date;
		this.service_charge = service_charge;
		this.people_count = people_count;
		this.box = box;
		this.remark = remark;
		this.member = member;
		this.store = store;
		
		String timeStr1 = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.create_dt = timeStr1;
		this.update_dt = timeStr1;
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

	public StoreBean getStore() {
		return store;
	}

	public void setStore(StoreBean store) {
		this.store = store;
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
	
}
