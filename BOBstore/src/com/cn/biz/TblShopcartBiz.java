package com.cn.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblShopcart;
import com.cn.mapper.TblShopcartMapper;

@Service
public class TblShopcartBiz {

	@Autowired
	TblShopcartMapper tblShopcartMapper;

	public int selectShopcartCountByName(String customerName) {
		// TODO Auto-generated method stub
		
		return tblShopcartMapper.selectShopcartCountByName(customerName);
	}
	
}
