package com.cn.util;

import java.util.List;

import com.cn.entity.TblOrderQuery;

public class TblOrderQueryModel {
	
	private List<TblOrderQuery> order;

	public TblOrderQueryModel(List<TblOrderQuery> order) {
		super();
		this.order = order;
	}
	
	public TblOrderQueryModel() {
		super();
	}

	public List<TblOrderQuery> getOrder() {
		return order;
	}

	public void setOrder(List<TblOrderQuery> order) {
		this.order = order;
	}
	
}
