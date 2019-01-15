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
	
	
	@RequestMapping("/removeGoods")
	public String delectGoods(Integer shopcartID){
		if(shopcartID!=null){
			tblShopcartBiz.removeFun(shopcartID);
		}
		return "redirect:/shopCart/viewShopCart";
	}
	
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
	/**
	 * 
	 * @param goodsID
	 * @param count
	 * @param session
	 * @param model
	 * @return selectShopcartByGoodsID是用于判断该用户购物车里有没有该商品
	 */
	@RequestMapping("/add")
	public String addToShopCartFun(Integer goodsID,Integer count,HttpSession session,Model model){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		boolean flag=false;
		if(customer == null){
			return "redirect:/login.jsp";
		}
		
		TblShopcart tblShopcart = tblShopcartBiz.selectShopcartByGoodsID(customer.getCustomerName(),goodsID);
		if(tblShopcart==null){
			flag = tblShopcartBiz.addFun(customer.getCustomerName(),goodsID,count);
		}else{
			count = tblShopcart.getGoodCount() + count;
			flag = tblShopcartBiz.updateFun(customer.getCustomerName(),count,tblShopcart.getGoodsID());
			
		}
		
		if(flag){
			return "redirect:/good/goodsdetail?goodsID=" + goodsID;
		}else{
			model.addAttribute("errMsg","添加失败");
			return "redirect:/good/goodsdetail?goodsID=" + goodsID;
		}
		
	}
}
