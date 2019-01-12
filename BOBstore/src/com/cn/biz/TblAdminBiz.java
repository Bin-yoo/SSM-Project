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
	 * ����Ա��½
	 * @param name �û���
	 * @param password ����
	 * @return true ��½�ɹ� false ��½ʧ��
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
