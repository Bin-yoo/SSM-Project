package com.cn.mapper;

import java.util.List;

import com.cn.entity.TblOrder;
import com.cn.entity.TblOrderQuery;

public interface TblOrderMapper {

	List<TblOrderQuery> selectAllByName(String customerName);

}
