package com.cn.mapper;

import java.util.List;

import com.cn.entity.TblOrder;
import com.cn.entity.TblOrderQuery;

public interface TblOrderMapper {

	List<TblOrderQuery> selectAllByName();

	void insertOrderFun(TblOrderQuery tblOrderQuery);

	void insertOrederDetailFun(TblOrderQuery tblOrderQuery);

	int selectOredeIDByNewestOrderDate();

	List<TblOrderQuery> selectByorderStateByName(TblOrderQuery tblOrderQuery);


	int selectCountPageFun(TblOrderQuery tblOrderQuery);

	List<TblOrderQuery> selectByCondtionPageFun(TblOrderQuery tblOrderQuery);

	void updateGrant(Integer orderID);



}
