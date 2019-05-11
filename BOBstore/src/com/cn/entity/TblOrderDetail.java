package com.cn.entity;

public class TblOrderDetail extends TblOrder{

	private Integer orderID;
	private Integer goodsID;
	private Double orderPrice;
	private Integer goodCount;
	
	private TblGoods tblGoods;

	public TblGoods getTblGoods() {
		return tblGoods;
	}
	public void setTblGoods(TblGoods tblGoods) {
		this.tblGoods = tblGoods;
	}
	
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(Integer goodsID) {
		this.goodsID = goodsID;
	}
	public Double getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Double orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Integer getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}
	
}
