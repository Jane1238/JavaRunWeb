package com.shaoyujian.JavaRunWeb.service;

import java.util.List;
import com.shaoyujian.JavaRunWeb.model.Exam;

public interface ExamService {
	//添加新问题与答案
	int addExam(String q_name,String question,String answer);
	//根据问题id删除问题
	int delExam(int q_id);
	//查找所有问题
	List<Exam> selectAllQuestion();
	//根据问题id查找答案
	String selectAnswer(int q_id);
	//查询题库所有元素
	List<Exam> selectExam();
	//根据问题id修改问题名称，问题，问题答案
	int updateExam(String q_name,String question,String answer,int q_id);
	//根据q_id查找具体内容
	Exam selectQuestion(int q_id);
	
}
