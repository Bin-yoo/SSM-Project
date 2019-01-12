package com.cn.mapper;

import java.util.List;

import com.cn.entity.TblGoodsTypeDetail;

public interface TblGoodsTypeDetailMapper {

	public List<TblGoodsTypeDetail> selectAllDetailType ();

	public List<TblGoodsTypeDetail> selectByGoodsTypeID(Integer goodsTypeID);
	
}
