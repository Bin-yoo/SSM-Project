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
	/**
	 * 
	 * @param customerName
	 * @return ��ѯ�û������ж���
	 */
	public List<TblOrder> selectAllFun(String customerName) {
		// TODO Auto-generated method stub
		return tblOrderMapper.selectAllByName(customerName);
	}
	/**
	 * 
	 * @param tblOrderQuery
	 * @return �ύ����
	 */
	public boolean submitOrder(TblOrderQuery tblOrderQuery) {
		// TODO Auto-generated method stub
		try {
			tblOrderMapper.insertOrderFun(tblOrderQuery);
			
			return true;
		} catch (Exception e) {
			System.out.println("�µ�ʧ��!!!");
			e.printStackTrace();
			
			return false;
		}
	}
	/**
	 * 
	 * @param tblOrderQuery
	 * @return �ύ����
	 */ 
	public boolean submitOrderDetail(TblOrderQuery tblOrderQuery) {
		// TODO Auto-generated method stub
		try {
			tblOrderMapper.insertOrederDetailFun(tblOrderQuery);
			
			return true;
		} catch (Exception e) {
			System.out.println("�µ�ʧ��!!!");
			e.printStackTrace();
			
			return false;
		}
	}
	/**
	 * 
	 * @return ȷ�϶����ύ����id
	 */
	public int checkSubmitOrderID() {
		// TODO Auto-generated method stub
		return tblOrderMapper.selectOredeIDByNewestOrderDate();
	}
	/**
	 * 
	 * @param customer
	 * @param orderState
	 * @return ͨ������״̬��ѯ����
	 */
	public List<TblOrder> selectByorderStateFun(TblCustomer customer, char orderState) {
		// TODO Auto-generated method stub
		TblOrderQuery tblOrderQuery = new TblOrderQuery();
		tblOrderQuery.setCustomerName(customer.getCustomerName());
		tblOrderQuery.setOrderState(orderState);
		return tblOrderMapper.selectByorderStateByName(tblOrderQuery);
	}
	/**
	 * 
	 * @param orderID
	 * @return �����µ�
	 */
	public boolean signGoodsByOrderID(Integer orderID) {
		// TODO Auto-generated method stub
		try {
			tblOrderMapper.c_updateStateFun(orderID);
			return true;
		} catch (Exception e) {
			System.out.println("ǩ��ʧ��!!!");
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 
	 * @param tblOrderQuery
	 * @param currPage
	 * @param limit
	 * @return ����Ա��ѯ���ж���
	 */
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
	/**
	 * 
	 * @param orderID
	 * @return ���������¶���״̬
	 */
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
