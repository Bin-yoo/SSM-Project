package com.cn.entity;

public class TblShopcart {

	private Integer shopcartID;
	private String customerName;
	private Integer goodsID;
	private Integer goodCount;
	
	public Integer getShopcartID() {
		return shopcartID;
	}
	public String getCustomerName() {
		return customerName;
	}
	public Integer getGoodsID() {
		return goodsID;
	}
	public Integer getGoodCount() {
		return goodCount;
	}
	public void setShopcartID(Integer shopcartID) {
		this.shopcartID = shopcartID;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public void setGoodsID(Integer goodsID) {
		this.goodsID = goodsID;
	}
	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}
	
}
