package com.cn.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.biz.TblGoodsTypeDetailBiz;
import com.cn.entity.TblGoodsTypeDetail;

@Controller
@RequestMapping("/detail")
public class TblGoodsTypeDetailController {

	@Autowired
	TblGoodsTypeDetailBiz tblGoodsTypeDetailBiz;
	/**
	 * 
	 * @param goodsTypeID
	 * @return 按照商品类型ID查找
	 */
	@RequestMapping("/viewByGoodsTypeId")
	public @ResponseBody List<TblGoodsTypeDetail> viewByGoodsTypeId(Integer goodsTypeID){
		List<TblGoodsTypeDetail> detailList = tblGoodsTypeDetailBiz.viewGoodsTypeIDFun(goodsTypeID);
		return detailList;
	}
}
