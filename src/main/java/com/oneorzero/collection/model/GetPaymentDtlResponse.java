package com.oneorzero.collection.model;

public class GetPaymentDtlResponse implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer store_id;//商家編號
	private String email;//Email
	private String store_name;//商家名稱
	private String address_area;//所在地_區
	private String tel;//公司電話
	private String phone;//行動電話
	private String contact_person;//聯絡人
	
	private Integer payment_id;
	private String month;//帳務月份
	private Integer receivable;//應收帳款
	private Integer actual;//實收帳款
	private String paymentStart;//帳務起始日
	private String paymentEnd;//帳務終止日
	private String dueDay;//欠款代號
	private Integer balance_due;//欠款金額
	private Integer dueDayCount;//欠款日期
	private String remark;//備註
	private String update_dt;
	private Integer isAutodiler;
	
	public GetPaymentDtlResponse() {
		super();
	}

	public Integer getStore_id() {
		return store_id;
	}

	public void setStore_id(Integer store_id) {
		this.store_id = store_id;
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

	public String getAddress_area() {
		return address_area;
	}

	public void setAddress_area(String address_area) {
		this.address_area = address_area;
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

	public Integer getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(Integer payment_id) {
		this.payment_id = payment_id;
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

	public Integer getBalance_due() {
		return balance_due;
	}

	public void setBalance_due(Integer balance_due) {
		this.balance_due = balance_due;
	}

	public Integer getDueDayCount() {
		return dueDayCount;
	}

	public void setDueDayCount(Integer dueDayCount) {
		this.dueDayCount = dueDayCount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUpdate_dt() {
		return update_dt;
	}

	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}

	public Integer getIsAutodiler() {
		return isAutodiler;
	}

	public void setIsAutodiler(Integer isAutodiler) {
		this.isAutodiler = isAutodiler;
	}
	
}
