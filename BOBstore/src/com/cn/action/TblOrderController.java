package com.cn.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblOrderBiz;

@Controller
@RequestMapping("/order")
public class TblOrderController {
	@Autowired
	TblOrderBiz tblOrderBiz;
	
	@RequestMapping("/setOrder")
	public ModelAndView setOrder(){
		return null;
		
	}
}
