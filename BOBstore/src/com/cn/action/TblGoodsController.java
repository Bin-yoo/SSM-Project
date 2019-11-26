package com.cn.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblGoodsBiz;
import com.cn.biz.TblGoodsTypeBiz;
import com.cn.biz.TblGoodsTypeDetailBiz;
import com.cn.biz.TblShopcartBiz;
import com.cn.entity.TblAdmin;
import com.cn.entity.TblCustomer;
import com.cn.entity.TblGoods;
import com.cn.entity.TblGoodsQuery;
import com.cn.entity.TblGoodsType;
import com.cn.entity.TblGoodsTypeDetail;
import com.cn.entity.TblShopcart;
import com.cn.util.PageBean;
import com.cn.util.Uploader;

@Controller
@RequestMapping("/good")
public class TblGoodsController {
	
	@Autowired
	TblGoodsTypeBiz tblGoodsTypeBiz;
	@Autowired
	TblGoodsTypeDetailBiz tblGoodsTypeDetailBiz;
	@Autowired
	TblGoodsBiz tblGoodsBiz;
	@Autowired
	TblShopcartBiz tblShopcartBiz;
	/**
	 * 
	 * @param tblGoods 加入的商品的信息
	 * @param session 
	 * @param model
	 * @return 用于商品添加功能，必须要上传图片
	 * 
	 */ 
	
	@RequestMapping("/add")
	public String addFun(TblGoods tblGoods,HttpSession session,Model model,@RequestParam("i-file") MultipartFile picture, HttpServletRequest request){
		TblAdmin admin = (TblAdmin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/admin.jsp";
		}
		
		Uploader uploader = new Uploader();
		String path = uploader.upload(picture, request);
		
        try {
            tblGoods.setGoodsImageUrl(path);
            boolean flag = tblGoodsBiz.addFun(tblGoods);
    		if(flag){
    			return "redirect:/admin/goods";
    		}else{
    			model.addAttribute("errMsg","保存失败");
    			model.addAttribute("tblGoods", tblGoods);
    			return "/admin_addgood";
    		}
        } catch (Exception e) {
            System.out.println("上传失败");
            e.printStackTrace();
            model.addAttribute("errMsg","保存失败");
			model.addAttribute("tblGoods", tblGoods);
			return "/admin_addgood";
        }
	}
	/**
	 * 
	 * @return 用于添加商品的功能，查询出表里有的类型并且显示到添加界面上
	 */
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
	/**
	 * 
	 * @param tblGoodsQuery 商品的工具类
	 * @param session
	 * @return 用于商店的首页，返回几种热门商品的列表
	 */
	@RequestMapping("/index")
	public ModelAndView viewOfGoods(TblGoodsQuery tblGoodsQuery,HttpSession session){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(customer != null){
			int ShopcartCount = tblShopcartBiz.selectShopcartCountByName(customer.getCustomerName());
			modelAndView.addObject("ShopcartCount",ShopcartCount);
		}
		
		Random random = new Random();
		int suibiangao = random.nextInt(16)+1;
		List<TblGoods> bannerList = tblGoodsBiz.viewHotGoods(tblGoodsQuery,suibiangao,5);
		List<TblGoods> popularGoodsList = tblGoodsBiz.viewHotGoods(tblGoodsQuery, null, 10);
		List<TblGoods> popularWineList = tblGoodsBiz.viewHotGoods(tblGoodsQuery, 1, 5);
		List<TblGoods> popularCandyList = tblGoodsBiz.viewHotGoods(tblGoodsQuery, 10, 5);
		List<TblGoods> popularSnacksList = tblGoodsBiz.viewHotGoods(tblGoodsQuery, 15, 5);
		
		modelAndView.addObject("bannerList",bannerList);
		modelAndView.addObject("popularGoodsList",popularGoodsList);
		modelAndView.addObject("popularWineList",popularWineList);
		modelAndView.addObject("popularCandyList",popularCandyList);
		modelAndView.addObject("popularSnacksList",popularSnacksList);
		modelAndView.setViewName("index");
		
		return modelAndView;
	}
	
	/**
	 * 
	 * @param currPage 页数
	 * @param tblGoodsQuery 商品工具类
	 * @param detailedTypeID 类型ID
	 * @param session 
	 * @return 通过传进来的类型ID，完成几个页面的翻页查询
	 */
	@RequestMapping("/viewgoods")
	public ModelAndView viewGoods(Integer currPage,TblGoodsQuery tblGoodsQuery,Integer detailedTypeID,HttpSession session){
		int limit = 10;

		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		PageBean <TblGoods> pageBean = tblGoodsBiz.viewBydetailedTypeID(tblGoodsQuery,currPage, limit,detailedTypeID);

		ModelAndView modelAndView = new ModelAndView();
		
		if(customer != null){
			int ShopcartCount = tblShopcartBiz.selectShopcartCountByName(customer.getCustomerName());
			modelAndView.addObject("ShopcartCount",ShopcartCount);
		}
		
		List<TblGoods> glist = pageBean.getList();
		TblGoods tgoods = null;
		if(glist != null){
			tgoods = glist.get(0);
			modelAndView.addObject("detailedTypeID",tgoods.getDetailedTypeID());
		}
		modelAndView.addObject("goodName",tblGoodsQuery.getGoodsName());
		modelAndView.addObject("pageBean",pageBean);
		modelAndView.setViewName("goods_list");
		
		return modelAndView;
	}
	/**
	 * 
	 * @param goodsID 商品的ID
	 * @param add 
	 * @param session
	 * @return 返回通过商品ID查询到的商品的详细信息
	 */
	@RequestMapping("/goodsdetail")
	public ModelAndView viewGoodsDetail(Integer goodsID,boolean add,HttpSession session){
		TblGoods tblGoods = tblGoodsBiz.selectByGoodsIdFun(goodsID);
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		if(customer != null){
			int ShopcartCount = tblShopcartBiz.selectShopcartCountByName(customer.getCustomerName());
			modelAndView.addObject("ShopcartCount",ShopcartCount);
		}
		if(add){
			modelAndView.addObject("add",add);
		}
		
		modelAndView.addObject("tblGoods",tblGoods);
		modelAndView.setViewName("goods_detail");
		
		return modelAndView;
		
	}
	/**
	 * 
	 * @param goodsID 商品ID
	 * @param currPage
	 * @return 用于管理员删除商品的功能
	 */
	@RequestMapping("remove")
	public String removeFun(Integer goodsID,Integer currPage){
		if(goodsID!=null){
			tblGoodsBiz.removeFun(goodsID);
		}
		return "redirect:../admin/goods?currPage=" + currPage;
		
	}
	/**
	 * 
	 * @param tblGoods 整个商品的信息
	 * @param session
	 * @param model
	 * @param picture 图片
	 * @param request
	 * @return 用于管理员修改商品信息
	 */
	@RequestMapping("modify")
	public String modifyFun(TblGoods tblGoods,HttpSession session,Model model,@RequestParam("i-file") MultipartFile picture, HttpServletRequest request){
		TblAdmin admin = (TblAdmin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/admin.jsp";
		}
		
		if(picture.getSize() != 0){
			Uploader uploader = new Uploader();
			String path = uploader.upload(picture, request);
			tblGoods.setGoodsImageUrl(path);
		}
		
        try {
            boolean flag = tblGoodsBiz.modifyFun(tblGoods);
    		if(flag){
    			return "redirect:/admin/goods";
    		}else{
    			model.addAttribute("errMsg","保存失败");
    			model.addAttribute("tblGoods", tblGoods);
    			return "/admin_updategood";
    		}
        } catch (Exception e) {
            System.out.println("上传失败");
            e.printStackTrace();
            model.addAttribute("errMsg","保存失败");
			model.addAttribute("tblGoods", tblGoods);
			return "/admin_updategood";
        }
	}
	/**
	 * 
	 * @param goodsID 商品id
	 * @param goodsTypeID 商品的类型
	 * @param tblGoodsQuery 攻击类
	 * @return 将查询到的商品信息返回到修改商品信息页面上
	 */
	@RequestMapping("/befModify")
	public ModelAndView befModifyFun(Integer goodsID,Integer goodsTypeID,TblGoodsQuery tblGoodsQuery){
		
		List<TblGoodsType> typeList = tblGoodsTypeBiz.viewAllTypeFun();
		
		List<TblGoodsTypeDetail> detailTypeList = tblGoodsTypeDetailBiz.viewGoodsTypeIDFun(goodsTypeID);

		TblGoods tblGoods = tblGoodsBiz.selectByGoodsIdFun(goodsID);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("tblGoods",tblGoods);
		modelAndView.addObject("typeList",typeList);
		modelAndView.addObject("detailTypeList",detailTypeList);
		modelAndView.setViewName("admin_updategood");
		
		return modelAndView;
	}
	 
}
