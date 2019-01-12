package com.cn.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblGoodsTypeDetail;
import com.cn.mapper.TblGoodsTypeDetailMapper;

@Service
public class TblGoodsTypeDetailBiz {

	@Autowired
	TblGoodsTypeDetailMapper tblGoodsTypeDetailMapper;
	
	public List<TblGoodsTypeDetail> viewAllDetailTypeFun() {
		return tblGoodsTypeDetailMapper.selectAllDetailType();
	}

	public List<TblGoodsTypeDetail> viewGoodsTypeIDFun(Integer goodsTypeID) {
		return tblGoodsTypeDetailMapper.selectByGoodsTypeID(goodsTypeID);
	}
	
}
