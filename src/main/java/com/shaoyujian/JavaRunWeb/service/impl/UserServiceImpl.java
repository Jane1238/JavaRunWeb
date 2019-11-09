package com.shaoyujian.JavaRunWeb.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shaoyujian.JavaRunWeb.mapper.UserMapper;

import com.shaoyujian.JavaRunWeb.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	

	
	public boolean registerUser(String userName,String userPassword,int power) {
		String p=userMapper.getByNamePower(userName,power);
		if(p==null) {
			if(userMapper.registerUser(userName, userPassword,power)>0) {
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}



	public String getUserByNamePower(String userName,int power) {
		return userMapper.getByNamePower(userName,power);
	}



	@Override
	public String getByName(String userName) {
		return userMapper.getByName(userName);
	}



	@Override
	public int selectUserId(String userName) {
		return userMapper.selectUserId(userName);
	}
}
