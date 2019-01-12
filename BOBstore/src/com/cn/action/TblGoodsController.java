package com.cn.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblGoodsBiz;
import com.cn.biz.TblGoodsTypeBiz;
import com.cn.biz.TblGoodsTypeDetailBiz;
import com.cn.entity.TblAdmin;
import com.cn.entity.TblGoods;
import com.cn.entity.TblGoodsQuery;
import com.cn.entity.TblGoodsType;
import com.cn.entity.TblGoodsTypeDetail;

@Controller
@RequestMapping("/good")
public class TblGoodsController {
	
	@Autowired
	TblGoodsTypeBiz tblGoodsTypeBiz;
	@Autowired
	TblGoodsTypeDetailBiz tblGoodsTypeDetailBiz;
	@Autowired
	TblGoodsBiz tblGoodsBiz;
	/**
	 * 
	 * @param tblGoods
	 * @param session
	 * @param model
	 * @return 注意！！添加功能是半成品，因为表的问题，什么都不填的时候也能提交成功,需要写一些JS验证，有空再说吧
	 * 不知道什么原因，拿不到admin，所以注释掉的东西是无效的
	 * 
	 */ 
	
	@RequestMapping("/add")
	public String addFun(TblGoods tblGoods,HttpSession session,Model model){
		TblAdmin admin = (TblAdmin)session.getAttribute("Admin");
//		if(admin == null){
//			return "redirect:/admin.jsp";
//		}
		boolean flag = tblGoodsBiz.addFun(tblGoods);
		if(flag){
			return "redirect:/admin/goods";
		}else{
			model.addAttribute("errMsg","保存失败");
			model.addAttribute("tblGoods", tblGoods);
			return "/admin_addgood";
		}
		
		
	}
	@RequestMapping("/befAdd")
	public ModelAndView befAddFun(){
		List<TblGoodsType> typeList = tblGoodsTypeBiz.viewAllTypeFun();
		List<TblGoodsTypeDetail> detailTypeList = null;
		
		if(typeList.size() > 0){
			TblGoodsType tblGoodsType = typeList.get(0);
			detailTypeList = tblGoodsTypeDetailBiz.viewGoodsTypeIDFun(tblGoodsType.getGoodsTypeID());
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("typeList",typeList);
		modelAndView.addObject("detailTypeList",detailTypeList);
		modelAndView.setViewName("admin_addgood");
		
		return modelAndView;
	}
	
	@RequestMapping("/index")
	public ModelAndView viewOfGoods(TblGoodsQuery tblGoodsQuery){
		List<TblGoods> bannerList = tblGoodsBiz.viewHotGoods(tblGoodsQuery,null,4);
		List<TblGoods> popularGoodsList = tblGoodsBiz.viewHotGoods(tblGoodsQuery, null, 10);
		List<TblGoods> popularWineList = tblGoodsBiz.viewHotGoods(tblGoodsQuery, 1, 5);
		List<TblGoods> popularCandyList = tblGoodsBiz.viewHotGoods(tblGoodsQuery, 10, 5);
		List<TblGoods> popularSnacksList = tblGoodsBiz.viewHotGoods(tblGoodsQuery, 15, 5);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("bannerList",bannerList);
		modelAndView.addObject("popularGoodsList",popularGoodsList);
		modelAndView.addObject("popularWineList",popularWineList);
		modelAndView.addObject("popularCandyList",popularCandyList);
		modelAndView.addObject("popularSnacksList",popularSnacksList);
		modelAndView.setViewName("index");
		
		return modelAndView;
	}
}
