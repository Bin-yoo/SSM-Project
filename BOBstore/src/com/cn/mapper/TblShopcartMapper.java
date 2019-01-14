package com.cn.mapper;

import java.util.List;

import com.cn.entity.TblGoods;
import com.cn.entity.TblShopcart;

public interface TblShopcartMapper {

	int selectShopcartCountByName(String customerName);


	void insertFun(TblShopcart tblShopcart);

	List<TblGoods> selectAllByName(String customerName);

}
