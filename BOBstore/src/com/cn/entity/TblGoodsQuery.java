package com.cn.entity;

public class TblGoodsQuery extends TblGoods {

	//��ҳ��ѯʱ��
	private Integer startNum;				//�ӵڼ��п�ʼ��ѯ
	private Integer pageSize;				//ÿҳ����,�����ѯ������
	
	//��Ӧ��ѯ�����еļ۸�Χ
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
