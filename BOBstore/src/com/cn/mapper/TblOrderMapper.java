package com.cn.mapper;

import java.util.List;

import com.cn.entity.TblOrder;
import com.cn.entity.TblOrderQuery;

public interface TblOrderMapper {

	List<TblOrder> selectAllByName(String customerName);

	void insertOrderFun(TblOrderQuery tblOrderQuery);

	void insertOrederDetailFun(TblOrderQuery tblOrderQuery);

	int selectOredeIDByNewestOrderDate();

	List<TblOrder> selectByorderStateByName(TblOrderQuery tblOrderQuery);

	void c_updateStateFun(Integer orderID);

	int selectCountPageFun(TblOrderQuery tblOrderQuery);

	List<TblOrderQuery> selectByCondtionPageFun(TblOrderQuery tblOrderQuery);

	void updateGrant(Integer orderID);

}
