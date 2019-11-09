package com.shaoyujian.JavaRunWeb.model;

import java.sql.Date;

/**
 * code表对应的实体类
 *
 */
public class Code {
	private int codeId;		//代码编号
	private String codeName;	//代码名字
	private String codeTxt; 	//代码内容
	private String codeDate;	//代码保存日期
	private int userId;		//用户编号
	

	public int getCodeId() {
		return codeId;
	}

	public void setCodeId(int codeId) {
		this.codeId = codeId;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getCodeTxt() {
		return codeTxt;
	}

	public void setCodeTxt(String codeTxt) {
		this.codeTxt = codeTxt;
	}

	

	

	public String getCodeDate() {
		return codeDate;
	}

	public void setCodeDate(String codeDate) {
		this.codeDate = codeDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	
	
	
}
