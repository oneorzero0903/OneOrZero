package com.oneorzero.bean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PaymentBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer payment_id;//帳務編號
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "store_id")
	private StoreBean store;//商家編號
	private String month;//帳務月份
	private Integer receivable;//應收帳款
	private Integer actual;//實收帳款
	private String paymentStart;//帳務起始日
	private String paymentEnd;//帳務終止日
	private String dueDay = "C0";//欠款代號，D ~ D + 20 => C0 (繳款期限內，算未欠款)
										  //D + 21 ~ D + 30 => M1(欠款一個月內)
										  //D + 31 ~ D + 60 => M2(欠款兩個月內)
										  //D + 61 ~ D + 90 => M3(欠款三個月內)
	private Integer dueDayCount;//欠款天數
	private Integer balance_due;//欠款金額
	private String remark;//備註
	private Integer isSend = 0;//是否已寄信 0:未寄 1:已寄
	private Integer isAutodiler = 0;//是否已電話通知催款 0:未通知 1:已通知
	private String create_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));//建立日期
	private String update_dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));//修改日期
	
	public PaymentBean() {
	}

	public Integer getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(Integer payment_id) {
		this.payment_id = payment_id;
	}

	public StoreBean getStore() {
		return store;
	}

	public void setStore(StoreBean store) {
		this.store = store;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public Integer getReceivable() {
		return receivable;
	}

	public void setReceivable(Integer receivable) {
		this.receivable = receivable;
	}

	public Integer getActual() {
		return actual;
	}

	public void setActual(Integer actual) {
		this.actual = actual;
	}

	public String getPaymentStart() {
		return paymentStart;
	}

	public void setPaymentStart(String paymentStart) {
		this.paymentStart = paymentStart;
	}

	public String getPaymentEnd() {
		return paymentEnd;
	}

	public void setPaymentEnd(String paymentEnd) {
		this.paymentEnd = paymentEnd;
	}

	public String getDueDay() {
		return dueDay;
	}

	public void setDueDay(String dueDay) {
		this.dueDay = dueDay;
	}

	public Integer getDueDayCount() {
		return dueDayCount;
	}

	public void setDueDayCount(Integer dueDayCount) {
		this.dueDayCount = dueDayCount;
	}

	public Integer getBalance_due() {
		return balance_due;
	}

	public void setBalance_due(Integer balance_due) {
		this.balance_due = balance_due;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getIsSend() {
		return isSend;
	}

	public void setIsSend(Integer isSend) {
		this.isSend = isSend;
	}

	public Integer getIsAutodiler() {
		return isAutodiler;
	}

	public void setIsAutodiler(Integer isAutodiler) {
		this.isAutodiler = isAutodiler;
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
