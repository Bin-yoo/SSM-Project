package com.cn.entity;

import java.sql.Timestamp;

public class TblOrder {

	private Integer orderID;
	private String customerName;
	private String orderAddress;
	private String orderPhone;
	private String orderAddressee;
	private Double totalMoney;
	private Timestamp orderDate = new Timestamp((new java.util.Date()).getTime());
	private char orderState = '0';
	
	public Integer getOrderID() {
		return orderID;
	}
	public String getCustomerName() {
		return customerName;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public String getOrderAddressee() {
		return orderAddressee;
	}
	public Double getTotalMoney() {
		return totalMoney;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public char getOrderState() {
		return orderState;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public void setOrderAddressee(String orderAddressee) {
		this.orderAddressee = orderAddressee;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public void setOrderState(char orderState) {
		this.orderState = orderState;
	}
	
}
