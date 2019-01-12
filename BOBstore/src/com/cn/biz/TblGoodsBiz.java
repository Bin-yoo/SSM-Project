package com.cn.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblGoods;
import com.cn.entity.TblGoodsQuery;
import com.cn.mapper.TblGoodsMapper;
import com.cn.util.PageBean;

@Service
public class TblGoodsBiz {

	@Autowired
	TblGoodsMapper tblGoodsMapper;

	public PageBean<TblGoods> viewByConditionPageFun(TblGoodsQuery tblGoodsQuery, Integer currPage, int limit) {
		int totalCount = tblGoodsMapper.selectCountConditionPageFun(tblGoodsQuery);
		PageBean <TblGoods>pageBean = new PageBean<TblGoods>(totalCount,currPage,limit);
		if(tblGoodsQuery == null){
			tblGoodsQuery = new TblGoodsQuery();
		}
		
		tblGoodsQuery.setPageSize(pageBean.getLimit());
		tblGoodsQuery.setStartNum((pageBean.getCurrPage() - 1)*pageBean.getLimit());
		if(totalCount > 0){
			pageBean.setList(tblGoodsMapper.selectByConditionPageFun(tblGoodsQuery));
		}
		
		return pageBean;
	}

	/**
	 * 这个方法用于查询热门 商品
	 * @param tblGoodsQuery 
	 * @param detailedTypeID 传要查询的商品类型
	 * @param limit 要查询的条数
	 * @return
	 */
	public List<TblGoods> viewHotGoods(TblGoodsQuery tblGoodsQuery, Integer detailedTypeID, int limit) {
		// TODO Auto-generated method stub
		tblGoodsQuery.setDetailedTypeID(detailedTypeID);
		tblGoodsQuery.setLimit(limit);
		return tblGoodsMapper.selectByHotGoods(tblGoodsQuery);
	}
	/**
	 * 
	 * @param tblGoods 
	 * @return
	 */
	public boolean addFun(TblGoods tblGoods) {
		// TODO Auto-generated method stub
		try{
			tblGoodsMapper.insertFun(tblGoods);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
}
