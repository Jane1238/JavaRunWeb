package com.shaoyujian.JavaRunWeb.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.shaoyujian.JavaRunWeb.service.UserService;


/**
 * 登录的相关页面逻辑操作
 *
 */
@RestController
public class LoginController {
	
	@Autowired
	private UserService userService;
	//用户登录
	@RequestMapping("/login")
	@ResponseBody
	public int toLogin(HttpServletRequest req,HttpSession session,String userName,String userPassword,int power) {
		//根据用户名与用户权限获取用户密码
		String p = userService.getUserByNamePower(userName, power);
		//密码为空的情况
		if(p==null) {
			return 1;
		}else if(!p.equals(userPassword)) {//密码不匹配的情况
			return 2;
		}else {
			if(power==1) {//为学生的情况
				int userId = userService.selectUserId(userName);
				session.setAttribute("userName", userName);//向sessio中保存用户名
				session.setAttribute("userId", userId);//向session中保存用户编号
				return 3;//用户以学生身份登录
			}else {//为老师的情况
				return 4;//用户以老师身份登录
			}
		}
	
	}
	//学生注册
	@RequestMapping("/register")
	@ResponseBody
	public int toRegister(HttpServletRequest req,String userName,String userPassword,int power) {
		if(userService.registerUser(userName, userPassword,power)) {
			return 1;
		}else {
			return 2;
		}
	}
	//获取session中的用户名
	@RequestMapping("/userName")
	@ResponseBody
	public String toUseName(HttpServletRequest req,HttpSession session) {
		return (String)session.getAttribute("userName");
	}
	//用户退出登录，清除session中所有保存过的值
	@RequestMapping("/login_out")
	@ResponseBody
	public int toLogin_out(HttpServletRequest req,HttpSession session) {
		session.invalidate();
		return 1;
	}
}
