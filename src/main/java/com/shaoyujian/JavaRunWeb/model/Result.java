package com.shaoyujian.JavaRunWeb.model;

/**
 * result表对应的实体类
 *
 */
public class Result {
	private String userName;	//用户名
	private String paperName;	//试卷名
	private int result;			//用户考试成绩
	private String useTime;		//作答时间
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getUseTime() {
		return useTime;
	}
	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}
	
	
}
