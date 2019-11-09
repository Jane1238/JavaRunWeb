package com.shaoyujian.JavaRunWeb.model;

/**
 * testPaper表对应的实体类
 *
 */
public class TestPaper {
	private int paperId;	//试卷编号
	private String paperName;	//试卷名字
	private int testCount;		//试卷中包含的题的个数
	private int userCount;		//此试卷被用户作答过的人数
	
	
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}
	public int getTestCount() {
		return testCount;
	}
	public void setTestCount(int testCount) {
		this.testCount = testCount;
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	
}
