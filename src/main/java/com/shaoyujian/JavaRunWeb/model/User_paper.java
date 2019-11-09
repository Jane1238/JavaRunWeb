package com.shaoyujian.JavaRunWeb.model;

/**
 * user_paper表对应的实体类
 *
 */
public class User_paper {
	private int userId;		//用户编号
	private int paperId;	//试卷编号
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	
}
