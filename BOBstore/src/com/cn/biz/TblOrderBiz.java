package com.cn.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblCustomer;
import com.cn.entity.TblOrder;
import com.cn.entity.TblOrderQuery;
import com.cn.mapper.TblOrderMapper;

@Service
public class TblOrderBiz {
	
	@Autowired
	TblOrderMapper tblOrderMapper;

	public List<TblOrderQuery> selectAllFun(TblCustomer customer) {
		// TODO Auto-generated method stub
		return tblOrderMapper.selectAllByName(customer.getCustomerName());
	}

	public boolean submitOrder(TblOrderQuery tblOrderQuery) {
		// TODO Auto-generated method stub
		try {
			tblOrderMapper.insertOrderFun(tblOrderQuery);
			
			return true;
		} catch (Exception e) {
			System.out.println("下单失败!!!");
			e.printStackTrace();
			
			return false;
		}
	}

	public boolean submitOrderDetail(TblOrderQuery tblOrderQuery) {
		// TODO Auto-generated method stub
		try {
			tblOrderMapper.insertOrederDetailFun(tblOrderQuery);
			
			return true;
		} catch (Exception e) {
			System.out.println("下单失败!!!");
			e.printStackTrace();
			
			return false;
		}
	}

	public int checkSubmitOrderID() {
		// TODO Auto-generated method stub
		return tblOrderMapper.selectOredeIDByNewestOrderDate();
	}

	public List<TblOrderQuery> selectByorderStateFun(TblCustomer customer, char orderState) {
		// TODO Auto-generated method stub
		TblOrderQuery tblOrderQuery = new TblOrderQuery();
		tblOrderQuery.setCustomerName(customer.getCustomerName());
		tblOrderQuery.setOrderState(orderState);
		return tblOrderMapper.selectByorderStateByName(tblOrderQuery);
	}
	
}
