 package com.cn.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblCustomerBiz;
import com.cn.biz.TblGoodsBiz;
import com.cn.biz.TblOrderBiz;
import com.cn.entity.TblCustomer;
import com.cn.entity.TblGoods;
import com.cn.entity.TblOrder;
import com.cn.entity.TblOrderQuery;

@Controller
@RequestMapping("/order")
public class TblOrderController {
	
	@Autowired
	TblOrderBiz tblOrderBiz;
	@Autowired
	TblGoodsBiz tblGoodsBiz;
	@Autowired
	TblCustomerBiz tblCustomerBiz;
	
	@RequestMapping("/allOrder")
	public ModelAndView allOrder(HttpSession session){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<TblOrderQuery> orderList=tblOrderBiz.selectAllFun(customer);
		
		modelAndView.addObject("orderList",orderList);
		modelAndView.setViewName("customer_order");
		
		return modelAndView;
	}
	@RequestMapping("/withgoods")
	public ModelAndView withgoods(HttpSession session,char orderState){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<TblOrderQuery> orderList=tblOrderBiz.selectByorderStateFun(customer,orderState);
		
		modelAndView.addObject("orderList",orderList);
		modelAndView.setViewName("customer_order_withgoods");
		
		return modelAndView;
	}
	@RequestMapping("/withaccept")
	public ModelAndView withacceptOrder(HttpSession session,char orderState){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<TblOrderQuery> orderList=tblOrderBiz.selectByorderStateFun(customer,orderState);
		
		modelAndView.addObject("orderList",orderList);
		modelAndView.setViewName("customer_order_withaccept");
		
		return modelAndView;
	}
	
	@RequestMapping("/setOrder")
	public ModelAndView setOrder(){
		return null;
		
	}
	
	@RequestMapping("/buyNow")
	public ModelAndView buyNow(Integer goodsID,Integer count,HttpSession session){
		TblCustomer tblCustomer = (TblCustomer)session.getAttribute("customer");
		ModelAndView modelAndView = new ModelAndView();
		if(tblCustomer == null){
			modelAndView.addObject("goodsID",goodsID);
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		TblGoods tblGoods = tblGoodsBiz.selectByGoodsIdFun(goodsID);

		modelAndView.addObject("tblGoods",tblGoods);
		modelAndView.addObject("count",count);
		modelAndView.setViewName("customer_order_check");
		
		return modelAndView;
	}
	
	@RequestMapping("/buyNow/submit")
	public String order_submit(TblOrderQuery tblOrderQuery,HttpSession session){
		TblCustomer tblCustomer = (TblCustomer)session.getAttribute("customer");
		if(tblCustomer == null){
			return "login";
		}

		boolean order = tblOrderBiz.submitOrder(tblOrderQuery);
		int orderID = tblOrderBiz.checkSubmitOrderID();
		boolean order_detail = false;
		if(order){
			tblOrderQuery.setOrderID(orderID);
			order_detail = tblOrderBiz.submitOrderDetail(tblOrderQuery);
		}
		
		if(order && order_detail){
			return "redirect:../allOrder";
		}else{
			return "redirect:../order/buyNow?goodsID"+tblOrderQuery.getGoodsID()+"&count="+tblOrderQuery.getGoodCount();
		}
		
	}
}
