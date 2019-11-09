package com.shaoyujian.JavaRunWeb.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shaoyujian.JavaRunWeb.mapper.CodeMapper;
import com.shaoyujian.JavaRunWeb.mapper.UserMapper;
import com.shaoyujian.JavaRunWeb.model.Code;
import com.shaoyujian.JavaRunWeb.service.CodeService;
@Service("codeService")
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper codeMapper;
	
	@Override
	public boolean saveCode(String codeName, String codeTxt, String codeDate, int userId) {
		if(codeMapper.saveCode(codeName, codeTxt, codeDate, userId)>0) {;
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int selectUserId(String userName) {
		return codeMapper.selectUserId(userName);
	}

	@Override
	public List<Code> selectCode(int userId) {
		return codeMapper.selectCode(userId);
	}

	@Override
	public int deleteCode(String codeName,int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
