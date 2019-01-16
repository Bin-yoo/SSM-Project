package com.cn.entity;

import java.sql.Timestamp;

public class TblShopcartQuery extends TblShopcart{
	
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
