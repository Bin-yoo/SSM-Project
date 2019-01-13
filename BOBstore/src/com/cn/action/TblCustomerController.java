package com.cn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblCustomerBiz;
import com.cn.entity.TblCustomer;

@Controller
@RequestMapping("/user")
public class TblCustomerController {

	@Autowired
	TblCustomerBiz tblCustomerBiz;
	
	@RequestMapping("/login")
	public ModelAndView Login(@ModelAttribute("name")String name,String password,HttpSession session){
		
		TblCustomer tblCustomer = tblCustomerBiz.login(name, password);
		
		ModelAndView modelAndView = new ModelAndView();
		if(tblCustomer==null){
			modelAndView.addObject("errMsg", "”√ªß√˚ªÚ√‹¬Î¥ÌŒÛ£°");
			modelAndView.setViewName("login");
		}
		else{
			session.setAttribute("customer", tblCustomer);
//			modelAndView.setViewName("redirect:../house/viewByConditionPage");
			modelAndView.setViewName("redirect:../good/index");
		}
		return modelAndView;
	}
	
	@RequestMapping("/register")
	public ModelAndView register(TblCustomer tblCustomer){
		boolean flag = tblCustomerBiz.register(tblCustomer);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(flag){
			modelAndView.setViewName("redirect:../user/login?name="+tblCustomer.getCustomerName()+"&password="+tblCustomer.getPassword());
		}else{
			modelAndView.addObject("errMsg", "◊¢≤· ß∞‹!!!");
			modelAndView.addObject("tblCustomer", tblCustomer);
			modelAndView.setViewName("register");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/checkName")
	public @ResponseBody String checkName(String name){
		boolean flag = tblCustomerBiz.checkByCustomerName(name);
		return flag + "";
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.getAttribute("customer");
		session.removeAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:../index.jsp");
		
		return modelAndView;
	}
	
}
