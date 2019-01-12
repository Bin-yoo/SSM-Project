package com.cn.mapper;

import com.cn.entity.TblCustomer;

public interface TblCustomerMapper {

	public TblCustomer selectByNameFun(String name);
	
	public void insertFun(TblCustomer tblCustomer);
	
}
