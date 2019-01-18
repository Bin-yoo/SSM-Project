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
	 * @return 添加时确认购物车中是否有这个商品
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
	 * @return 添加购物车时，假如购物车中有同样的商品，就更新购物车
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
	 * @return 查询购物车中所有的东西
	 */
	public List<TblShopcartQuery> selectAllFun(TblCustomer customer) {
		return tblShopcartMapper.selectAllByName(customer.getCustomerName());	
	}
	/**
	 * 
	 * @param shopcartID
	 * @return 删除购物车中的某样商品
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
	 * @return 查询用户的购物车中有几样商品
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
	 * @return 添加购物车时，假如购物车中没有同样的商品，就添加购物车
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
	 * @return 通过购物车ID查询购物车
	 */
	public TblShopcartQuery selectByShopcartIdFun(int i) {
		return tblShopcartMapper.selectByShopcartIDFun(i);
	}
	
	
}
