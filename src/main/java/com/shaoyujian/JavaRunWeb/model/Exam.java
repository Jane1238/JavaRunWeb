package com.shaoyujian.JavaRunWeb.model;

/**
 * exam表对应的实体类
 *
 */
public class Exam {
	private int q_id;	//编程题编号
	private String q_name;	//编程题名字
	private String question;	//编程题内容
	private String answer;		//编程题答案
	

	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
