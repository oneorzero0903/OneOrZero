package com.oneorzero.bean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class MemberBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer member_id; //會員編號

	@Column(name = "email", columnDefinition = "VARCHAR(50) NOT NULL")
	private String email; //會員帳號

	@Column(name = "password", columnDefinition = "VARCHAR(50) NOT NULL")
	private String password; //會員密碼
	private String name; //姓名
	private String birthday; //生日
	private String gender; //性別
	private String tel; //電話
	private String isSuccess = "off"; //開通狀態 on:已開通 off:未開通
	private String vip = "V0"; //會員等級 V0:一般會員 V1:VIP1 V2:VIP2
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));; //建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));; //修改日期
	private Integer resetPwd = 0; //需要更新密碼 0:不需要 1:需要
	
	@OneToOne(mappedBy = "member")
	private OrdersBean orders;
	
	@OneToOne(mappedBy = "member")
	private ProblemBean problem;

	public MemberBean() {
	}

	public MemberBean(String email, String password, String name, String birthday, String gender, String tel) {
		String timeStr1 = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.create_dt = timeStr1;
		this.update_dt = timeStr1;
		this.email = email;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.gender = gender;
		this.tel = tel;
		this.isSuccess = "off";
		this.vip = "V0";
		this.resetPwd = 0;
	}
	
	public OrdersBean getOrders() {
		return orders;
	}

	public void setOrders(OrdersBean orders) {
		this.orders = orders;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}

	public String getVip() {
		return vip;
	}

	public void setVip(String vip) {
		this.vip = vip;
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

	public Integer getResetPwd() {
		return resetPwd;
	}

	public void setResetPwd(Integer resetPwd) {
		this.resetPwd = resetPwd;
	}

}
