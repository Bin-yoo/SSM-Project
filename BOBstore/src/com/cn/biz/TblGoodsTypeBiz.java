package com.cn.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblGoodsType;
import com.cn.mapper.TblGoodsTypeMapper;

@Service
public class TblGoodsTypeBiz {
	
	@Autowired
	TblGoodsTypeMapper tblGoodsTypeMapper;
	
	public List<TblGoodsType> viewAllTypeFun() {
		return tblGoodsTypeMapper.selectAllType();
	}
}
