package com.cn.entity;

import java.sql.Timestamp;

public class TblCustomer {

	private Integer customerID;
	private String customerName;
	private String password;
	private String customerTrueName;
	private String customerAddress;
	private char sex;
	private String customerEmail;
	private String customerPhone;
	private Timestamp customerRegDate;
	
	
	
	public Integer getCustomerID() {
		return customerID;
	}
	public void setCustomerID(Integer customerID) {
		this.customerID = customerID;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCustomerTrueName() {
		return customerTrueName;
	}
	public void setCustomerTrueName(String customerTrueName) {
		this.customerTrueName = customerTrueName;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public Timestamp getCustomerRegDate() {
		return customerRegDate;
	}
	public void setCustomerRegDate(Timestamp customerRegDate) {
		this.customerRegDate = customerRegDate;
	}
	
}
