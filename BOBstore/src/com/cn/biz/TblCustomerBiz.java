package com.cn.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblCustomer;
import com.cn.mapper.TblCustomerMapper;

@Service
public class TblCustomerBiz {

	@Autowired
	TblCustomerMapper tblCustomerMapper;
	
	/**
	 * 登录
	 * @param name 用户名
	 * @param password 密码
	 * @return 
	 */
	public TblCustomer login(String name,String password){
		TblCustomer tblCustomer = tblCustomerMapper.selectByCustomerNameFun(name);
		
		if (tblCustomer != null && tblCustomer.getPassword().equals(password)){
			return tblCustomer;
		}else{
			return null;
		}
	}
	
	/**
	 * 注册
	 * @param tblCustomer 用户信息
	 * @return true 注册成功  false 注册失败
	 */
	public boolean register(TblCustomer tblCustomer){
		try {
			tblCustomerMapper.insertFun(tblCustomer);
			
			return true;
		} catch (Exception e) {
			System.out.println("注册失败!!!");
			e.printStackTrace();
			
			return false;
		}
	}
	
	/**
	 * 注册检查用户名是否重复
	 * @param name 用户名
	 * @return true 用户名可用 false 用户名重复
	 */
	public boolean checkByCustomerName(String name){
		TblCustomer tblCustomer = tblCustomerMapper.selectByCustomerNameFun(name);
		if (tblCustomer == null)
			return false;
		else
			return true;
	}
	
	public TblCustomer viewByCustomerName(String name){
		TblCustomer tblCustomer = tblCustomerMapper.selectByCustomerNameFun(name);
		if (tblCustomer == null)
			return null;
		else
			return tblCustomer;
	}
	
}
