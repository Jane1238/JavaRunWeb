package com.shaoyujian.JavaRunWeb.model;

/**
 * 用于做考试的答题记录
 *
 */
public class JiLu {
	private String testTxt;		//客观题的问题内容
	private String userChoose;		//用户选择的选项
	private String userChooseTxt;	//用户选择的选项但对应的内容
	private String answer;			//答案选项
	private String answerTxt;		//答案选项对应的内容
	private String duicuo;			//对或错
	public String getDuicuo() {
		return duicuo;
	}
	public void setDuicuo(String duicuo) {
		this.duicuo = duicuo;
	}
	public String getTestTxt() {
		return testTxt;
	}
	public void setTestTxt(String testTxt) {
		this.testTxt = testTxt;
	}
	public String getUserChoose() {
		return userChoose;
	}
	public void setUserChoose(String userChoose) {
		this.userChoose = userChoose;
	}
	public String getUserChooseTxt() {
		return userChooseTxt;
	}
	public void setUserChooseTxt(String userChooseTxt) {
		this.userChooseTxt = userChooseTxt;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswerTxt() {
		return answerTxt;
	}
	public void setAnswerTxt(String answerTxt) {
		this.answerTxt = answerTxt;
	}

	
	
}
