package com.cn.entity;

public class TblOrderDetail {

	private Integer orderID;
	private Integer goodsID;
	private Double goodsPrice;
	private Integer goodCount;
	
	public Integer getOrderID() {
		return orderID;
	}
	public Integer getGoodsID() {
		return goodsID;
	}
	public Double getGoodsPrice() {
		return goodsPrice;
	}
	public Integer getGoodCount() {
		return goodCount;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public void setGoodsID(Integer goodsID) {
		this.goodsID = goodsID;
	}
	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}
	
}
