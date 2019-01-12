package com.cn.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblAdminBiz;
import com.cn.biz.TblGoodsBiz;
import com.cn.biz.TblGoodsTypeBiz;
import com.cn.biz.TblGoodsTypeDetailBiz;
import com.cn.entity.TblAdmin;
import com.cn.entity.TblGoods;
import com.cn.entity.TblGoodsQuery;
import com.cn.entity.TblGoodsType;
import com.cn.entity.TblGoodsTypeDetail;
import com.cn.util.PageBean;

@Controller
@RequestMapping("/admin")
public class TblAdminController {
	
	@Autowired
	TblAdminBiz tblAdminBiz;
	@Autowired
	TblGoodsBiz tblGoodsBiz;
	@Autowired
	TblGoodsTypeBiz tblGoodsTypeBiz;
	@Autowired
	TblGoodsTypeDetailBiz tblGoodsTypeDetailBiz;
	
	@RequestMapping("/login")
	public ModelAndView Login(@ModelAttribute("name")String name,String password,HttpSession session){
		
		TblAdmin tblAdmin = tblAdminBiz.login(name, password);
		
		ModelAndView modelAndView = new ModelAndView();
		if(tblAdmin==null){
			modelAndView.addObject("errMsg", "用户名或密码错误！");
			modelAndView.setViewName("admin");
		}
		else{
			session.setAttribute("admin", tblAdmin);
			modelAndView.setViewName("redirect:../admin/goods");
		}
		return modelAndView;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.getAttribute("admin");
		session.removeAttribute("admin");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:../admin.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/goods")
	public ModelAndView viewGoods(Integer currPage,TblGoodsQuery tblGoodsQuery){
		int limit = 3;
		PageBean <TblGoods> pageBean = tblGoodsBiz.viewByConditionPageFun(tblGoodsQuery,currPage, limit);
		
		List<TblGoodsType> typeList = tblGoodsTypeBiz.viewAllTypeFun();
		List<TblGoodsTypeDetail> detailTypeList = null;
		
		if(typeList.size() > 0){
			TblGoodsType tblGoodsType = typeList.get(0);
			int i = tblGoodsType.getGoodsTypeID();
			detailTypeList = tblGoodsTypeDetailBiz.viewGoodsTypeIDFun(i);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pageBean",pageBean);
		modelAndView.addObject("typeList",typeList);
		modelAndView.addObject("detailTypeList",detailTypeList);
		modelAndView.setViewName("admin_goods");
		
		return modelAndView;
	}
	
}
