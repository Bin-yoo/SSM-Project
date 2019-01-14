package com.cn.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblCustomer;
import com.cn.entity.TblOrder;
import com.cn.entity.TblOrderQuery;
import com.cn.mapper.TblOrderMapper;

@Service
public class TblOrderBiz {
	
	@Autowired
	TblOrderMapper tblOrderMapper;

	public List<TblOrderQuery> selectAllFun(TblCustomer customer) {
		// TODO Auto-generated method stub
		return tblOrderMapper.selectAllByName(customer.getCustomerName());
	}
	
}
