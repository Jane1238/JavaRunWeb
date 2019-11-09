package com.shaoyujian.JavaRunWeb.service;

import java.util.Date;
import java.util.List;



import com.shaoyujian.JavaRunWeb.model.Code;

public interface CodeService {
	
	//保存代码
	boolean saveCode(String codeName,String codeTxt,String codeDate,int userId);
	//查看userId
	int selectUserId(String userName);
	//查看代码列表
	List<Code> selectCode(int userId);
	//删除代码
	int deleteCode(String codeName,int userId);
}
