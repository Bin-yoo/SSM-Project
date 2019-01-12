package com.cn.entity;

public class TblAdmin {

	private Integer adminID;
	private String adminName;
	private String password;
	private String adminTrueName;
	private char sex;
	
	public Integer getAdminID() {
		return adminID;
	}
	public String getAdminName() {
		return adminName;
	}
	public String getPassword() {
		return password;
	}
	public String getAdminTrueName() {
		return adminTrueName;
	}
	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAdminTrueName(String adminTrueName) {
		this.adminTrueName = adminTrueName;
	}
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
	
}
