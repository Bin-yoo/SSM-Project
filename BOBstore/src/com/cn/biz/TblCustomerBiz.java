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
	 * ��¼
	 * @param name �û���
	 * @param password ����
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
	 * ע��
	 * @param tblCustomer �û���Ϣ
	 * @return true ע��ɹ�  false ע��ʧ��
	 */
	public boolean register(TblCustomer tblCustomer){
		try {
			tblCustomerMapper.insertFun(tblCustomer);
			
			return true;
		} catch (Exception e) {
			System.out.println("ע��ʧ��!!!");
			e.printStackTrace();
			
			return false;
		}
	}
	
	/**
	 * ע�����û����Ƿ��ظ�
	 * @param name �û���
	 * @return true �û������� false �û����ظ�
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
