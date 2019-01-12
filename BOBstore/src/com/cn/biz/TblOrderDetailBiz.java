package com.cn.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.mapper.TblOrderDetailMapper;

@Service
public class TblOrderDetailBiz {

	@Autowired
	TblOrderDetailMapper tblOrderDetailMapper;
	
}
