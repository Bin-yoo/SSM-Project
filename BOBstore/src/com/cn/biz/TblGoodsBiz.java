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
	/**
	 * 
	 * @param tblGoodsQuery
	 * @param currPage ҳ��
	 * @param limit ����
	 * @return pageBean��������з�ҳ��ѯ��
	 */
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
	 * ����������ڲ�ѯ���� ��Ʒ
	 * @param tblGoodsQuery 
	 * @param detailedTypeID ��Ҫ��ѯ����Ʒ����
	 * @param limit Ҫ��ѯ������
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
	 * @return ���ﳵ���
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
	/**
	 * 
	 * @param tblGoodsQuery
	 * @param currPage
	 * @param limit
	 * @param detailedTypeID
	 * @return ��ҳ��ѯ
	 */
	public PageBean<TblGoods> viewBydetailedTypeID(TblGoodsQuery tblGoodsQuery, Integer currPage, int limit,
			Integer detailedTypeID) {
		// TODO Auto-generated method stub
		int totalCount = tblGoodsMapper.selectCountConditionPageFun(tblGoodsQuery);
		
		PageBean <TblGoods>pageBean = new PageBean<TblGoods>(totalCount,currPage,limit);
		if(tblGoodsQuery == null){
			tblGoodsQuery = new TblGoodsQuery();
		}
		tblGoodsQuery.setDetailedTypeID(detailedTypeID);
		tblGoodsQuery.setPageSize(pageBean.getLimit());
		tblGoodsQuery.setStartNum((pageBean.getCurrPage() - 1)*pageBean.getLimit());
		if(totalCount > 0){
			pageBean.setList(tblGoodsMapper.selectByConditionPageFun(tblGoodsQuery));
		}
		
		return pageBean;
	}
	/**
	 * 
	 * @param goodsID
	 * @return ��ѯ��Ʒ����
	 */
	public TblGoods selectByGoodsIdFun(Integer goodsID) {
		return tblGoodsMapper.selectByIdFun(goodsID);
	}

	public boolean removeFun(Integer goodsID) {
		// TODO Auto-generated method stub
		try{
			tblGoodsMapper.delectFun(goodsID);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 
	 * @param tblGoods
	 * @return ��Ʒ���޸�
	 */
	public boolean modifyFun(TblGoods tblGoods) {
		try{
			tblGoodsMapper.updateFun(tblGoods);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
}
