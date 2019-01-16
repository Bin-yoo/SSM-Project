package com.cn.mapper;

import java.util.List;

import com.cn.entity.TblGoods;
import com.cn.entity.TblShopcart;
import com.cn.entity.TblShopcartQuery;

public interface TblShopcartMapper {

	int selectShopcartCountByName(String customerName);


	void insertFun(TblShopcart tblShopcart);

	List<TblShopcartQuery> selectAllByName(String customerName);

	
	void removeByshopcartIDFun(Integer shopcartID);


	TblShopcart selectShopcartByGoodsID(TblShopcart tblShopcart);


	void updateFun(TblShopcart tblShopcart);


	TblShopcartQuery selectByShopcartIDFun(int i);
	

}
