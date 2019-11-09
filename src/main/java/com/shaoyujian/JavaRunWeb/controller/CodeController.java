package com.shaoyujian.JavaRunWeb.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.shaoyujian.JavaRunWeb.model.Code;
import com.shaoyujian.JavaRunWeb.service.CodeService;


/**
 * 用户保存代码的相关页面逻辑操作
 *
 */
@RestController
public class CodeController {
	@Autowired
	private CodeService codeService; 
//获取代码	
@RequestMapping("/getCode")
@ResponseBody
public List<Code> getCode(HttpServletRequest request,HttpSession session){
	//获取保存在session中的用户名
	String userName = (String) session.getAttribute("userName");
	//图片没给过用户名获取用户编号
	int userId = codeService.selectUserId(userName);
	//通过用户编号获取遍历代码表
	List<Code> codes = codeService.selectCode(userId);
	/*for(Code code:codes) {
		System.out.println(code.getCodeDate()+code.getCodeName());
	}*/
	return codes;
}
//保存代码
@RequestMapping("/saveCode")
@ResponseBody
public int saveCode(HttpServletRequest request,HttpSession session,String codeName,String codeTxt,String codeDate) {
	//System.out.println("");
	//获取session中保存过的用户名
	String userName = (String) session.getAttribute("userName");
	//根据用户名查询用户编号
	int userId = codeService.selectUserId(userName);
	//向代码表中添加
	codeService.saveCode(codeName, codeTxt, codeDate, userId);
	return 1;
}
}
