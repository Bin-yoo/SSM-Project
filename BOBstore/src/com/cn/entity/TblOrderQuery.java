package com.cn.entity;

import java.sql.Timestamp;

public class TblOrderQuery {
	private Integer orderID;
	private String customerName;
	private String orderAddress;
	private String orderPhone;
	private String orderAddressee;
	private Double totalMoney;
	private Timestamp orderDate;
	private char orderState;
	
	
	private Integer goodsID;
	private Integer goodCount;
	
	
	private String goodsName;
	
	
	private Integer detailedTypeID;
	private Double goodsPrice;
	private Integer goodsInCount;
	private Integer goodsSellCount;
	private String goodsDescript;
	private String goodsImageUrl;
	private Timestamp goodsDate = new Timestamp((new java.util.Date()).getTime());
	private Double goodsDiscountPrice;
	
	private Integer goodsTypeID;
	private String goodsTypeName;
	private String detailedTypeName;
	
	
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderAddressee() {
		return orderAddressee;
	}
	public void setOrderAddressee(String orderAddressee) {
		this.orderAddressee = orderAddressee;
	}
	public Double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public char getOrderState() {
		return orderState;
	}
	public void setOrderState(char orderState) {
		this.orderState = orderState;
	}
	public Integer getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(Integer goodsID) {
		this.goodsID = goodsID;
	}
	public Integer getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getDetailedTypeID() {
		return detailedTypeID;
	}
	public void setDetailedTypeID(Integer detailedTypeID) {
		this.detailedTypeID = detailedTypeID;
	}
	public Double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public Integer getGoodsInCount() {
		return goodsInCount;
	}
	public void setGoodsInCount(Integer goodsInCount) {
		this.goodsInCount = goodsInCount;
	}
	public Integer getGoodsSellCount() {
		return goodsSellCount;
	}
	public void setGoodsSellCount(Integer goodsSellCount) {
		this.goodsSellCount = goodsSellCount;
	}
	public String getGoodsDescript() {
		return goodsDescript;
	}
	public void setGoodsDescript(String goodsDescript) {
		this.goodsDescript = goodsDescript;
	}
	public String getGoodsImageUrl() {
		return goodsImageUrl;
	}
	public void setGoodsImageUrl(String goodsImageUrl) {
		this.goodsImageUrl = goodsImageUrl;
	}
	public Timestamp getGoodsDate() {
		return goodsDate;
	}
	public void setGoodsDate(Timestamp goodsDate) {
		this.goodsDate = goodsDate;
	}
	public Double getGoodsDiscountPrice() {
		return goodsDiscountPrice;
	}
	public void setGoodsDiscountPrice(Double goodsDiscountPrice) {
		this.goodsDiscountPrice = goodsDiscountPrice;
	}
	public Integer getGoodsTypeID() {
		return goodsTypeID;
	}
	public void setGoodsTypeID(Integer goodsTypeID) {
		this.goodsTypeID = goodsTypeID;
	}
	public String getGoodsTypeName() {
		return goodsTypeName;
	}
	public void setGoodsTypeName(String goodsTypeName) {
		this.goodsTypeName = goodsTypeName;
	}
	public String getDetailedTypeName() {
		return detailedTypeName;
	}
	public void setDetailedTypeName(String detailedTypeName) {
		this.detailedTypeName = detailedTypeName;
	}
	
	
}
