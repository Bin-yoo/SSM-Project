 package com.cn.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.biz.TblCustomerBiz;
import com.cn.biz.TblGoodsBiz;
import com.cn.biz.TblOrderBiz;
import com.cn.biz.TblShopcartBiz;
import com.cn.entity.TblAdmin;
import com.cn.entity.TblCustomer;
import com.cn.entity.TblGoods;
import com.cn.entity.TblOrder;
import com.cn.entity.TblOrderQuery;
import com.cn.entity.TblShopcartQuery;
import com.cn.util.PageBean;
import com.cn.util.TblOrderQueryModel;

@Controller
@RequestMapping("/order")
public class TblOrderController {
	
	@Autowired
	TblOrderBiz tblOrderBiz;
	@Autowired
	TblGoodsBiz tblGoodsBiz;
	@Autowired
	TblCustomerBiz tblCustomerBiz;
	@Autowired
	TblShopcartBiz tblShopcartBiz;
	/**
	 * 
	 * @param orderID ����ID
	 * @param currPage �ڹ���Ա�Ķ���ҳ���ϵ�ҳ��
	 * @return �������޸Ķ���״̬
	 */
	@RequestMapping("/Grant")
	public String grant(Integer orderID,Integer currPage){
		boolean flag = tblOrderBiz.grantByOrder(orderID);
		if(flag){
			return "redirect:/order/adminOrder?currPage=" + currPage;
		}else{
			return "redirect:/order/adminOrder?currPage=" + currPage;
		}
		
	}

	/**
	 * 
	 * @param session
	 * @return ͨ��session�б�����û�������ѯ�������ж������ص��û��Ķ���ҳ����
	 */
	@RequestMapping("/allOrder")
	public ModelAndView allOrder(HttpSession session){
		TblCustomer tblCustomer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<TblOrder> orderList=tblOrderBiz.selectAllFun(tblCustomer.getCustomerName());
		
		modelAndView.addObject("orderList",orderList);
		modelAndView.setViewName("customer_order");
		
		return modelAndView;
	}
	/**
	 * 
	 * @param tblOrderQuery
	 * @param currPage
	 * @return ����Ա����ҳ�棬������ɷ�ҳ
	 */
	@RequestMapping("/adminOrder")
	public ModelAndView adminOrder(TblOrderQuery tblOrderQuery,Integer currPage){
		int limit = 6;
		PageBean<TblOrderQuery> pageBean = tblOrderBiz.viewadminOrderFun(tblOrderQuery,currPage,limit);
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		modelAndView.addObject("pageBean",pageBean);
		modelAndView.setViewName("admin_order");
		
		return modelAndView;
		
	}
	/**
	 * 
	 * @param session
	 * @param orderState ������״̬
	 * @return ���ز�ѯ����״̬Ϊδ�����Ķ���
	 */
	@RequestMapping("/withgoods")
	public ModelAndView withgoods(HttpSession session,char orderState){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<TblOrder> orderList=tblOrderBiz.selectByorderStateFun(customer,orderState);
		
		modelAndView.addObject("orderList",orderList);
		modelAndView.setViewName("customer_order_withgoods");
		
		return modelAndView;
	}
	/**
	 * 
	 * @param session
	 * @param orderState
	 * @return ���ز�ѯ����״̬Ϊ���ջ��Ķ���
	 */
	@RequestMapping("/accept")
	public ModelAndView acceptOrder(HttpSession session,char orderState){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<TblOrder> orderList=tblOrderBiz.selectByorderStateFun(customer,orderState);
		
		modelAndView.addObject("orderList",orderList);
		modelAndView.setViewName("customer_order_accepted");
		
		return modelAndView;
	}
	/**
	 * 
	 * @param session
	 * @param orderState
	 * @return ���ز�ѯ����״̬Ϊδ�ջ��Ķ���
	 */
	@RequestMapping("/withaccept")
	public ModelAndView withacceptOrder(HttpSession session,char orderState){
		TblCustomer customer = (TblCustomer)session.getAttribute("customer");
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<TblOrder> orderList=tblOrderBiz.selectByorderStateFun(customer,orderState);
		
		modelAndView.addObject("orderList",orderList);
		modelAndView.setViewName("customer_order_withaccept");
		
		return modelAndView;
	}
	/**
	 * 
	 * @param goodsID ��ƷID
	 * @param count Ҫ�����Ʒ������
	 * @param session
	 * @return ���������ܣ�������������
	 */
	@RequestMapping("/buyNow")
	public ModelAndView buyNow(Integer goodsID,Integer count,HttpSession session){
		TblCustomer tblCustomer = (TblCustomer)session.getAttribute("customer");
		ModelAndView modelAndView = new ModelAndView();
		if(tblCustomer == null){
			modelAndView.addObject("goodsID",goodsID);
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		Double total;
		
		TblGoods tblGoods = tblGoodsBiz.selectByGoodsIdFun(goodsID);
		if(tblGoods.getGoodsDiscountPrice() == null || tblGoods.getGoodsDiscountPrice().equals("")){
			total = tblGoods.getGoodsPrice() * count;
		}else{
			total = tblGoods.getGoodsDiscountPrice() * count;
		}
		
		List<TblGoods> ShoppingList = new ArrayList<TblGoods>();
		ShoppingList.add(tblGoods);
		
		modelAndView.addObject("ShoppingList",ShoppingList);
		modelAndView.addObject("count",count);
		modelAndView.addObject("total",total);
		modelAndView.setViewName("customer_order_check");
		
		return modelAndView;
	}
	/**
	 * 
	 * @param tblOrderQuery
	 * @param session
	 * @return ����ȷ��ʱ�����ɶ���
	 */
	@RequestMapping("/buyNow/submit")
	public String order_submit(TblOrderQuery tblOrderQuery,HttpSession session){
		
		boolean order = false;
		int orderID;
		boolean order_detail = false;
		
		try {
			order = tblOrderBiz.submitOrder(tblOrderQuery);
			orderID = tblOrderBiz.checkSubmitOrderID();
			if(order){
				tblOrderQuery.setOrderID(orderID);
				order_detail = tblOrderBiz.submitOrderDetail(tblOrderQuery);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(order && order_detail){
			return "redirect:../allOrder";
		}else{
			return "redirect:../order/buyNow?goodsID"+tblOrderQuery.getGoodsID()+"&count="+tblOrderQuery.getGoodCount();
		}
		
	}
	/**
	 * 
	 * @param shopcartID
	 * @return ���ﳵ�����ύ
	 */
	@RequestMapping("/batchSubmission")
	public ModelAndView batchSubmission(Integer[] shopcartID){
		ModelAndView modelAndView = new ModelAndView();
		List<TblShopcartQuery> ShoppingList = new ArrayList<TblShopcartQuery>();
		for(int i : shopcartID){
			TblShopcartQuery tblShopcartQuery = tblShopcartBiz.selectByShopcartIdFun(i);
			ShoppingList.add(tblShopcartQuery);
		}
		
		Double total = 0.00;
		for(TblShopcartQuery tblShopcartQuery : ShoppingList){
			if(tblShopcartQuery.getGoodsDiscountPrice() == null || tblShopcartQuery.getGoodsDiscountPrice().equals("")){
				total += tblShopcartQuery.getGoodsPrice() * tblShopcartQuery.getGoodCount();
			}else{
				total += tblShopcartQuery.getGoodsDiscountPrice() * tblShopcartQuery.getGoodCount();
			}
		}
		
		modelAndView.addObject("ShoppingList",ShoppingList);
		modelAndView.addObject("total",total);
		modelAndView.setViewName("customer_batchorder_check");
		
		return modelAndView;
	}
	/**
	 * 
	 * @param shopcartID
	 * @return ���ﳵ�����ύ
	 */
	@RequestMapping("/batchSubmission/submit")
	public String order_batchSubmission(TblOrderQueryModel querymodel){
		
		List<TblOrderQuery> orderQueryList = querymodel.getOrder();
		boolean order = false;
		int orderID;
		boolean order_detail = false;
		boolean del_shopcart = false;
		
		try {
			order = tblOrderBiz.submitOrder(orderQueryList.get(0));
			orderID = tblOrderBiz.checkSubmitOrderID();
			if(order){
				for(TblOrderQuery query : orderQueryList){
					query.setOrderID(orderID);
					order_detail = tblOrderBiz.submitOrderDetail(query);
				}
			}
			if(order_detail){
				for(TblOrderQuery query : orderQueryList){
					del_shopcart = tblShopcartBiz.removeFun(query.getShopcartID());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(order && order_detail){
			return "redirect:../allOrder";
		}else{
			return "redirect:../shopCart/viewShopCart";
		}
	}
	/**
	 * 
	 * @param shopcartID
	 * @return �û�ǩ��
	 */
	@RequestMapping("/sign_good")
	public String sign_good(Integer orderID){
		boolean flag = tblOrderBiz.signGoodsByOrderID(orderID);
		if(flag){
			return "redirect:../order/allOrder";
		}else{
			return "redirect:../order/allOrder";
		}
	}
}
