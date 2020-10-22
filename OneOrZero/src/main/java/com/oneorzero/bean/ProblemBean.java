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
public class ProblemBean implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer problem_id; //問題反映編號
	
	@OneToOne(cascade=CascadeType.PERSIST)
	@JoinColumn
	private MemberBean member; //會員編號
	private String note; //問題內容
	private String status = "undo"; //處理狀態(ok:已處理, ing:處理中, undo:未處理)
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //修改日期
	
	public ProblemBean() {
	}
	
	public ProblemBean(Integer problem_id, MemberBean member, String note, String status) {
		this.problem_id = problem_id;
		this.member = member;
		this.note = note;
		this.status = "undo";
		String timeStr1 = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		this.create_dt = timeStr1;
		this.update_dt = timeStr1;
	}

	public Integer getProblem_id() {
		return problem_id;
	}

	public void setProblem_id(Integer problem_id) {
		this.problem_id = problem_id;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
