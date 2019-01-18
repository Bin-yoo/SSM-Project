package com.cn.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblCustomer;
import com.cn.entity.TblGoods;
import com.cn.entity.TblShopcart;
import com.cn.entity.TblShopcartQuery;
import com.cn.mapper.TblShopcartMapper;

@Service
public class TblShopcartBiz {

	@Autowired
	TblShopcartMapper tblShopcartMapper;
	/**
	 * 
	 * @param customerName
	 * @param goodsID
	 * @return ���ʱȷ�Ϲ��ﳵ���Ƿ��������Ʒ
	 */
	public TblShopcart selectShopcartByGoodsID(String customerName, Integer goodsID) {

		TblShopcart tblShopcart = new TblShopcart();
		tblShopcart.setCustomerName(customerName);
		tblShopcart.setGoodsID(goodsID);
		tblShopcart = tblShopcartMapper.selectShopcartByGoodsID(tblShopcart);
		return tblShopcart;



}
	/**
	 * 
	 * @param customerName
	 * @param count
	 * @param goodsID
	 * @return ��ӹ��ﳵʱ�����繺�ﳵ����ͬ������Ʒ���͸��¹��ﳵ
	 */
	public boolean updateFun(String customerName, Integer count, Integer goodsID) {
		TblShopcart tblShopcart = new TblShopcart();
		tblShopcart.setCustomerName(customerName);
		tblShopcart.setGoodCount(count);
		tblShopcart.setGoodsID(goodsID);
		tblShopcart.setGoodCount(count);
		try{
			tblShopcartMapper.updateFun(tblShopcart);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 
	 * @param customer
	 * @return ��ѯ���ﳵ�����еĶ���
	 */
	public List<TblShopcartQuery> selectAllFun(TblCustomer customer) {
		return tblShopcartMapper.selectAllByName(customer.getCustomerName());	
	}
	/**
	 * 
	 * @param shopcartID
	 * @return ɾ�����ﳵ�е�ĳ����Ʒ
	 */
	public boolean removeFun(Integer shopcartID) {
		// TODO Auto-generated method
		try{
			tblShopcartMapper.removeByshopcartIDFun(shopcartID);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 
	 * @param customerName
	 * @return ��ѯ�û��Ĺ��ﳵ���м�����Ʒ
	 */
	public int selectShopcartCountByName(String customerName) {
		// TODO Auto-generated method stub
		
		return tblShopcartMapper.selectShopcartCountByName(customerName);
	}
	/**
	 * 
	 * @param customerName
	 * @param goodsID
	 * @param count
	 * @return ��ӹ��ﳵʱ�����繺�ﳵ��û��ͬ������Ʒ������ӹ��ﳵ
	 */
	public boolean addFun(String customerName, Integer goodsID, Integer count) {
		// TODO Auto-generated method stub
				TblShopcart tblShopcart = new TblShopcart();
				tblShopcart.setCustomerName(customerName);
				tblShopcart.setGoodsID(goodsID);
				tblShopcart.setGoodCount(count);
				try{
					tblShopcartMapper.insertFun(tblShopcart);
					return true;
				}catch(Exception e){
					return false;
				}
	}
	/**
	 * 
	 * @param i
	 * @return ͨ�����ﳵID��ѯ���ﳵ
	 */
	public TblShopcartQuery selectByShopcartIdFun(int i) {
		return tblShopcartMapper.selectByShopcartIDFun(i);
	}
	
	
}
