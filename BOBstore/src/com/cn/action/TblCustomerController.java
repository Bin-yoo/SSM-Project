package com.cn.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblCustomerBiz;
import com.cn.biz.TblShopcartBiz;
import com.cn.entity.TblCustomer;
import com.cn.entity.TblGoods;
import com.cn.entity.TblShopcart;

@Controller
@RequestMapping("/user")
public class TblCustomerController {

	@Autowired
	TblCustomerBiz tblCustomerBiz;
	@Autowired
	TblShopcartBiz tblShopcartBiz;
	
	/**
	 * 
	 * @param name 登录名
	 * @param password 密码
	 * @param goodsID 商品ID
	 * @param session
	 * @return 这个方法用于登录，并且判断你在加入购物车和立即购买时有没有登录，没有登录则返回登录界面
	 */
	
	@RequestMapping("/login")
	public ModelAndView Login(@ModelAttribute("name")String name,String password,Integer goodsID,HttpSession session){
		
		TblCustomer tblCustomer = tblCustomerBiz.login(name, password);

		ModelAndView modelAndView = new ModelAndView();
		if(tblCustomer==null){
			modelAndView.addObject("errMsg", "用户名或密码错误！");
			modelAndView.setViewName("login");
		}else if(tblCustomer != null && goodsID != null){
			session.setAttribute("customer", tblCustomer);
			modelAndView.setViewName("redirect:../good/goodsdetail?goodsID="+goodsID);
		}else{
			session.setAttribute("customer", tblCustomer);
			modelAndView.setViewName("redirect:../good/index");
		}
		return modelAndView;
	}
	/**
	 * 
	 * @param tblCustomer 传入用户信息
	 * @return 用于登录
	 */
	@RequestMapping("/register")
	public ModelAndView register(TblCustomer tblCustomer){
		boolean flag = tblCustomerBiz.register(tblCustomer);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(flag){
			modelAndView.setViewName("redirect:../user/login?name="+tblCustomer.getCustomerName()+"&password="+tblCustomer.getPassword());
		}else{
			modelAndView.addObject("errMsg", "注册失败!!!");
			modelAndView.addObject("tblCustomer", tblCustomer);
			modelAndView.setViewName("register");
		}
		
		return modelAndView;
	}
	/**
	 * 
	 * @param name
	 * @return 注册时用的，检查有没有相同的用户名
	 */
	@RequestMapping("/checkName")
	public @ResponseBody String checkName(String name){
		boolean flag = tblCustomerBiz.checkByCustomerName(name);
		return flag + "";
	}
	/**
	 * 
	 * @param request
	 * @return 登出
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.getAttribute("customer");
		session.removeAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:../good/index");
		
		return modelAndView;
	}
	
}
