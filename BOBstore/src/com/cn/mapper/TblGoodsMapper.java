package com.cn.mapper;

import java.util.List;

import com.cn.entity.TblGoods;
import com.cn.entity.TblGoodsQuery;

public interface TblGoodsMapper {

	int selectCountConditionPageFun(TblGoodsQuery tblGoodsQuery);

	List<TblGoods> selectByConditionPageFun(TblGoodsQuery tblGoodsQuery);

	List<TblGoods> selectByHotGoods(TblGoodsQuery tblGoodsQuery);

}
