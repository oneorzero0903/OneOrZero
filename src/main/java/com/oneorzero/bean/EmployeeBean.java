package com.oneorzero.bean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EmployeeBean implements java.io.Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Employee_id;  //員工編號
	
	private String Employee_acc;  //員工帳號
	private String Employee_pwd;  //員工密碼
	private String Employee_mail;  //員工Email
	private String Employee_phone;  //員工電話
	private String Authority;  //權限(admin:管理者,staff:員工)
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));  //建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));  //修改日期

	public EmployeeBean() {
	}

	public EmployeeBean(Integer employee_id, String employee_acc, String employee_pwd, String employee_mail,
		String employee_phone, String authority, String create_dt, String update_dt) {
		String timeStr1 = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.Employee_id = employee_id;
		this.Employee_acc = employee_acc;
		this.Employee_pwd = employee_pwd;
		this.Employee_mail = employee_mail;
		this.Employee_phone = employee_phone;
		this.Authority = "staff";
		this.create_dt = timeStr1;
		this.update_dt = timeStr1;
}

	public String getEmployee_acc() {
		return Employee_acc;
	}

	public void setEmployee_acc(String employee_acc) {
		Employee_acc = employee_acc;
	}

	public String getEmployee_pwd() {
		return Employee_pwd;
	}

	public void setEmployee_pwd(String employee_pwd) {
		Employee_pwd = employee_pwd;
	}

	public String getEmployee_mail() {
		return Employee_mail;
	}

	public void setEmployee_mail(String employee_mail) {
		Employee_mail = employee_mail;
	}

	public String getEmployee_phone() {
		return Employee_phone;
	}

	public void setEmployee_phone(String employee_phone) {
		Employee_phone = employee_phone;
	}

	public String getAuthority() {
		return Authority;
	}

	public void setAuthority(String authority) {
		Authority = authority;
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

	public void setEmployee_id(Integer employee_id) {
		Employee_id = employee_id;
	}

	

}
