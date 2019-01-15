package com.cn.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblShopcartBiz;
import com.cn.entity.TblCustomer;
import com.cn.entity.TblGoods;
import com.cn.entity.TblShopcart;
import com.cn.entity.TblShopcartQuery;

@Controller
@RequestMapping("/shopCart")
public class TblShopCartController 
{
	@Autowired
	TblShopcartBiz tblShopcartBiz;
	
	
	@RequestMapping("/viewShopCart")
	public ModelAndView viewShopCart(HttpSession session){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
			
		ModelAndView modelAndView = new ModelAndView();
		if(customer == null){
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		List<TblShopcartQuery> shopcartList=tblShopcartBiz.selectAllFun(customer);
		
		modelAndView.addObject("shopcartList",shopcartList);
		modelAndView.setViewName("customer_shop_cart");
		
		return modelAndView;
	}
	
	@RequestMapping("/add")
	public String addToShopCartFun(Integer goodsID,Integer count,HttpSession session,Model model){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		if(customer == null){
			return "redirect:/login.jsp";
		}
		boolean flag = tblShopcartBiz.addFun(customer.getCustomerName(),goodsID,count);
		
		if(flag){
			return "redirect:/good/goodsdetail?goodsID=" + goodsID + "&add=true";
		}else{
			model.addAttribute("errMsg","ÃÌº” ß∞‹");
			return "redirect:/good/goodsdetail?goodsID=" + goodsID;
		}
		
	}
}
