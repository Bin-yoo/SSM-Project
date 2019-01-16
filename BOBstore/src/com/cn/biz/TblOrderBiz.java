package com.cn.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblAdmin;
import com.cn.entity.TblCustomer;
import com.cn.entity.TblOrder;
import com.cn.entity.TblOrderQuery;
import com.cn.mapper.TblOrderMapper;
import com.cn.util.PageBean;

@Service
public class TblOrderBiz {
	
	@Autowired
	TblOrderMapper tblOrderMapper;

	public List<TblOrderQuery> selectAllFun(String customerName) {
		// TODO Auto-generated method stub
		return tblOrderMapper.selectAllByName(customerName);
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

	public boolean signGoodsByOrderID(Integer orderID) {
		// TODO Auto-generated method stub
		try {
			tblOrderMapper.c_updateStateFun(orderID);
			return true;
		} catch (Exception e) {
			System.out.println("签收失败!!!");
			e.printStackTrace();
			return false;
		}
	}

	public PageBean<TblOrderQuery> viewadminOrderFun(TblOrderQuery tblOrderQuery, Integer currPage, int limit) {
		// TODO Auto-generated method stub
		int totalCount = tblOrderMapper.selectCountPageFun(tblOrderQuery);
		PageBean<TblOrderQuery>pageBean= new PageBean<TblOrderQuery>(totalCount, currPage, limit);
		if(tblOrderQuery == null){
			tblOrderQuery = new TblOrderQuery();
		}
		
		tblOrderQuery.setPageSize(pageBean.getLimit());
		tblOrderQuery.setStartNum((pageBean.getCurrPage() - 1)*pageBean.getLimit());
		
		if(totalCount > 0){
			pageBean.setList(tblOrderMapper.selectByCondtionPageFun(tblOrderQuery));
		}
		
		return pageBean;
	}

	public boolean grantByOrder(Integer orderID) {
		// TODO Auto-generated method stub
		try{
			tblOrderMapper.updateGrant(orderID);
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
}
