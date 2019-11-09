package com.shaoyujian.JavaRunWeb.model;

/**
 * test表对应的实体类
 *
 */
public class Test {
	private int testId;		//客观题编号
	private String testTxt;		//客观题问题内容
	private String a;			//a选项内容
	private String b;			//b选项内容
	private String c;			//c选项内容
	private String d;			//d选项内筒
	private String answer;		//客观题答案
	private int paperId;		//试卷编号
	private int a_choose;		//a选项被选择的次数
	private int b_choose;		//b选项被选择的次数
	private int c_choose;		//c选项被选择的次数
	private int d_choose;		//d选项被选择的次数
	private int isTrue;			//这道题被用户答对了的次数
	
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public String getTestTxt() {
		return testTxt;
	}
	public void setTestTxt(String testTxt) {
		this.testTxt = testTxt;
	}
	
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public int getA_choose() {
		return a_choose;
	}
	public void setA_choose(int a_choose) {
		this.a_choose = a_choose;
	}
	public int getB_choose() {
		return b_choose;
	}
	public void setB_choose(int b_choose) {
		this.b_choose = b_choose;
	}
	public int getC_choose() {
		return c_choose;
	}
	public void setC_choose(int c_choose) {
		this.c_choose = c_choose;
	}
	public int getD_choose() {
		return d_choose;
	}
	public void setD_choose(int d_choose) {
		this.d_choose = d_choose;
	}
	public int getIsTrue() {
		return isTrue;
	}
	public void setIsTrue(int isTrue) {
		this.isTrue = isTrue;
	}
	
}
