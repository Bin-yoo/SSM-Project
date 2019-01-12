package com.cn.entity;

public class TblGoodsQuery extends TblGoods {

	//分页查询时用
	private Integer startNum;				//从第几行开始查询
	private Integer pageSize;				//每页行数,代表查询多少行
	
	//对应查询条件中的价格范围
	private String strPrice;
	private Integer priceB;
	private Integer priceE;
	
	public Integer getStartNum() {
		return startNum;
	}
	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String getStrPrice() {
		return strPrice;
	}
	public void setStrPrice(String strPrice) {
		this.strPrice = strPrice;
		String [] priceArray = strPrice.split("-");
		if (priceArray.length >= 2){
			setPriceB(Integer.parseInt(priceArray[0]));
			setPriceE(Integer.parseInt(priceArray[1]));
		}
	}
	public Integer getPriceB() {
		return priceB;
	}
	public void setPriceB(Integer priceB) {
		this.priceB = priceB;
	}
	public Integer getPriceE() {
		return priceE;
	}
	public void setPriceE(Integer priceE) {
		this.priceE = priceE;
	}
	
}
