package com.shaoyujian.JavaRunWeb.service;



public interface UserService {

	 public String getUserByNamePower(String userName,int power);
	 public String getByName(String userName);
	 public boolean registerUser(String userName, String userPassword,int power);
	 int selectUserId(String userName);
}
