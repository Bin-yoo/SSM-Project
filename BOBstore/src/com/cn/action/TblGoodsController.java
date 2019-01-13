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
		
		//��ȡ�ļ��ڷ������Ĵ���λ��
        String path = request.getSession().getServletContext().getRealPath("/upload");
        File filePath = new File(path);
        System.out.println("�ļ��ı���·����" + path);
        if (!filePath.exists() && !filePath.isDirectory()) {
            System.out.println("Ŀ¼�����ڣ�����Ŀ¼:" + filePath);
            filePath.mkdir();
        }
 
        //��ȡԭʼ�ļ�����(������ʽ)
        String originalFileName = picture.getOriginalFilename();
        System.out.println("ԭʼ�ļ����ƣ�" + originalFileName);
 
        //��ȡ�ļ����ͣ������һ��`.`Ϊ��ʶ
        String type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        System.out.println("�ļ����ͣ�" + type);
        //��ȡ�ļ����ƣ���������ʽ��
        String name = originalFileName.substring(0, originalFileName.lastIndexOf("."));
 
        //�����ļ�������: ��ǰʱ��+�ļ����ƣ���������ʽ��
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String date = sdf.format(d);
        String fileName = date + name + "." + type;
        System.out.println("���ļ����ƣ�" + fileName);
 
        //��ָ��·���´���һ���ļ�
        File targetFile = new File(path, fileName);
 
        //���ļ����浽������ָ��λ��
        try {
            picture.transferTo(targetFile);
            System.out.println("�ϴ��ɹ�");
            //���ļ��ڷ������Ĵ洢·������
            tblGoods.setGoodsImageUrl("./upload/"+fileName);
            boolean flag = tblGoodsBiz.addFun(tblGoods);
    		if(flag){
    			return "redirect:/admin/goods";
    		}else{
    			model.addAttribute("errMsg","����ʧ��");
    			model.addAttribute("tblGoods", tblGoods);
    			return "/admin_addgood";
    		}
        } catch (IOException e) {
            System.out.println("�ϴ�ʧ��");
            e.printStackTrace();
            model.addAttribute("errMsg","����ʧ��");
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
