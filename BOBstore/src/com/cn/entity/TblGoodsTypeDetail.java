package com.cn.entity;

public class TblGoodsTypeDetail {

	private Integer detailedTypeID;
	private Integer goodsTypeID;
	private String detailedTypeName;
	
	
	public Integer getDetailedTypeID() {
		return detailedTypeID;
	}
	public Integer getGoodsTypeID() {
		return goodsTypeID;
	}
	public String getDetailedTypeName() {
		return detailedTypeName;
	}
	public void setDetailedTypeID(Integer detailedTypeID) {
		this.detailedTypeID = detailedTypeID;
	}
	public void setGoodsTypeID(Integer goodsTypeID) {
		this.goodsTypeID = goodsTypeID;
	}
	public void setDetailedTypeName(String detailedTypeName) {
		this.detailedTypeName = detailedTypeName;
	}
	
}
