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

	public int selectShopcartCountByName(String customerName) {
		// TODO Auto-generated method stub
		
		return tblShopcartMapper.selectShopcartCountByName(customerName);
	}



	public List<TblShopcartQuery> selectAllFun(TblCustomer customer) {
		return tblShopcartMapper.selectAllByName(customer.getCustomerName());	
	}


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
 	* @param goodsID
 	* @param count
 	* @return 这里的selectshopcartBygooID方法用于判断购物车里有没有与新加入的商品的ID一样的商品
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



	public TblShopcart selectShopcartByGoodsID(String customerName, Integer goodsID) {
			
			TblShopcart tblShopcart = new TblShopcart();
			tblShopcart.setCustomerName(customerName);
			tblShopcart.setGoodsID(goodsID);
			tblShopcart = tblShopcartMapper.selectShopcartByGoodsID(tblShopcart);
			return tblShopcart;
		
		
		
	}



	public boolean updateFun(String customerName, Integer count, Integer goodsID) {
		// TODO Auto-generated method stub
		TblShopcart tblShopcart = new TblShopcart();
		tblShopcart.setCustomerName(customerName);
		tblShopcart.setGoodCount(count);
		tblShopcart.setGoodsID(goodsID);
		try{
			tblShopcartMapper.updateFun(tblShopcart);
			return true;
		}catch(Exception e){
			return false;
		}
	}


	
}
