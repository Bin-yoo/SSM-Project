package com.cn.biz;

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
	
}
