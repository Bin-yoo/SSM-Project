package com.cn.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.entity.TblAdmin;
import com.cn.mapper.TblAdminMapper;

@Service
public class TblAdminBiz {

	@Autowired
	TblAdminMapper tblAdminMapper;

	/**
	 * 管理员登陆
	 * @param name 用户名
	 * @param password 密码
	 * @return true 登陆成功 false 登陆失败
	 */
	public TblAdmin login(String name, String password) {
		TblAdmin tblAdmin = tblAdminMapper.selectByNameFun(name);
		
		if (tblAdmin != null && tblAdmin.getPassword().equals(password)){
			return tblAdmin;
		}else{
			return null;
		}
	}
	
}
