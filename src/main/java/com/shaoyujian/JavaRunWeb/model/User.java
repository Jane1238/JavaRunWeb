package com.shaoyujian.JavaRunWeb.model;

import java.util.List;

import org.springframework.stereotype.Component;

/**
 * user表对应的实体类
 *
 */
@Component
public class User {
	private int userId;		//用户编号
	private String userName;	//用户名
	private String userPassword;	//用户密码
	private int power;				//用户权限
	private List<Code> code;		//用户对应的code表
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public List<Code> getCode() {
		return code;
	}
	public void setCode(List<Code> code) {
		this.code = code;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	
}
