package com.cn.action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblCustomerBiz;
import com.cn.biz.TblGoodsBiz;
import com.cn.biz.TblOrderBiz;
import com.cn.entity.TblCustomer;
import com.cn.entity.TblGoods;

@Controller
@RequestMapping("/order")
public class TblOrderController {
	
	@Autowired
	TblOrderBiz tblOrderBiz;
	@Autowired
	TblGoodsBiz tblGoodsBiz;
	@Autowired
	TblCustomerBiz tblCustomerBiz;
	
	@RequestMapping("/setOrder")
	public ModelAndView setOrder(){
		return null;
		
	}
	
	@RequestMapping("/buyNow")
	public ModelAndView buyNow(Integer goodsID,Integer count,HttpSession session){
		TblCustomer tblCustomer = (TblCustomer)session.getAttribute("customer");
		ModelAndView modelAndView = new ModelAndView();
		if(tblCustomer == null){
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		TblGoods tblGoods = tblGoodsBiz.selectByGoodsIdFun(goodsID);

		modelAndView.addObject("tblGoods",tblGoods);
		modelAndView.addObject("count",count);
		modelAndView.setViewName("customer_order_check");
		
		return modelAndView;
	}
}
