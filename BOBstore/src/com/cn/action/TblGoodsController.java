package com.cn.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.cn.entity.TblAdmin;
import com.cn.entity.TblGoods;
import com.cn.entity.TblGoodsQuery;
import com.cn.entity.TblGoodsType;
import com.cn.entity.TblGoodsTypeDetail;
import com.cn.util.PageBean;

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
	 * @return 
	 * 
	 */ 
	
	@RequestMapping("/add")
	public String addFun(TblGoods tblGoods,HttpSession session,Model model,@RequestParam("i-file") MultipartFile picture, HttpServletRequest request){
		TblAdmin admin = (TblAdmin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/admin.jsp";
		}
		
		//获取文件在服务器的储存位置
        String path = request.getSession().getServletContext().getRealPath("/upload");
        File filePath = new File(path);
        System.out.println("文件的保存路径：" + path);
        if (!filePath.exists() && !filePath.isDirectory()) {
            System.out.println("目录不存在，创建目录:" + filePath);
            filePath.mkdir();
        }
 
        //获取原始文件名称(包含格式)
        String originalFileName = picture.getOriginalFilename();
        System.out.println("原始文件名称：" + originalFileName);
 
        //获取文件类型，以最后一个`.`为标识
        String type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        System.out.println("文件类型：" + type);
        //获取文件名称（不包含格式）
        String name = originalFileName.substring(0, originalFileName.lastIndexOf("."));
 
        //设置文件新名称: 当前时间+文件名称（不包含格式）
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String date = sdf.format(d);
        String fileName = date + name + "." + type;
        System.out.println("新文件名称：" + fileName);
 
        //在指定路径下创建一个文件
        File targetFile = new File(path, fileName);
 
        //将文件保存到服务器指定位置
        try {
            picture.transferTo(targetFile);
            System.out.println("上传成功");
            //将文件在服务器的存储路径返回
            tblGoods.setGoodsImageUrl("./upload/"+fileName);
            boolean flag = tblGoodsBiz.addFun(tblGoods);
    		if(flag){
    			return "redirect:/admin/goods";
    		}else{
    			model.addAttribute("errMsg","保存失败");
    			model.addAttribute("tblGoods", tblGoods);
    			return "/admin_addgood";
    		}
        } catch (IOException e) {
            System.out.println("上传失败");
            e.printStackTrace();
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
		List<TblGoods> bannerList = tblGoodsBiz.viewHotGoods(tblGoodsQuery,null,5);
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
	
	@RequestMapping("/viewgoods")
	public ModelAndView viewGoods(Integer currPage,TblGoodsQuery tblGoodsQuery,Integer detailedTypeID){
		int limit = 10;
		PageBean <TblGoods> pageBean = tblGoodsBiz.viewBydetailedTypeID(tblGoodsQuery,currPage, limit,detailedTypeID);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pageBean",pageBean);
		modelAndView.setViewName("goods_list");
	
		
		return modelAndView;
	}
	
	@RequestMapping("/goodsdetail")
	public ModelAndView viewGoodsDetail(Integer goodsID){
		TblGoods tblGoods = tblGoodsBiz.selectGoodsByIdFun(goodsID);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tblGoods",tblGoods);
		
		modelAndView.setViewName("goods_detail");
		
		return modelAndView;
		
	}
	
	@RequestMapping("remove")
	public String removeFun(Integer goodsID,Integer currPage){
		if(goodsID!=null){
			tblGoodsBiz.removeFun(goodsID);
		}
		return "redirect:../admin/goods?currPage=" + currPage;
		
	}
	
	@RequestMapping("/befModify")
	public ModelAndView befModifyFun(Integer goodsID,Integer currPage,TblGoodsQuery tblGoodsQuery){
		
		List<TblGoodsType> typeList = tblGoodsTypeBiz.viewAllTypeFun();
		List<TblGoodsTypeDetail> detailTypeList = null;
		
		if(typeList.size() > 0 && tblGoodsQuery.getGoodsTypeID() != null && !tblGoodsQuery.getGoodsTypeID().equals("")){
			detailTypeList = tblGoodsTypeDetailBiz.viewGoodsTypeIDFun(tblGoodsQuery.getGoodsTypeID());
		}
		
		TblGoods tblGoods = tblGoodsBiz.selectGoodsByIdFun(goodsID);
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		
		modelAndView.addObject("typeList",typeList);
		modelAndView.addObject("detailTypeList",detailTypeList);
		
		
		return modelAndView;
	}
	 
}
