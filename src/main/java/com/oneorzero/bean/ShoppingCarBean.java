package com.oneorzero.bean;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//本類別存放訂單資料
@Entity
public class ShoppingCarBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L; 
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;  //訂單編號
	
	private Integer	totalAmount;  //購買總金額
	private String	shippingAddress;   //寄送地址
	private String  invoiceTitle;  //發票抬頭
	private Date  orderDate;  //下單日期
	private Date  shippingDate;  //購物日期
	private String	cancelTag;  //刪除訂單
	private String 	member_id; //會員編號 (成為會員才能購買)
//	private List<ProductBean> productList;  //存放商品清單
	
	public ShoppingCarBean() {
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getInvoiceTitle() {
		return invoiceTitle;
	}

	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}

	public String getCancelTag() {
		return cancelTag;
	}

	public void setCancelTag(String cancelTag) {
		this.cancelTag = cancelTag;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

//	public List<ProductBean> getProductList() {
//		return productList;
//	}
//
//	public void setProductList(List<ProductBean> productList) {
//		this.productList = productList;
//	}

}
