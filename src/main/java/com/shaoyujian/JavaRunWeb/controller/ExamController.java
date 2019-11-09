package com.shaoyujian.JavaRunWeb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.shaoyujian.JavaRunWeb.model.Exam;
import com.shaoyujian.JavaRunWeb.service.ExamService;

/**
 * 编程题的相关页面逻辑操作
 */
@RestController
public class ExamController {
	@Autowired
	private ExamService examService;
//查询编程练习表中的所有问题和问题编号
@RequestMapping("/select_q")
@ResponseBody
public List<Exam> selectQuestion(HttpServletRequest request){
	List<Exam> exams = examService.selectAllQuestion();
	return exams;	
}
//根据编程问题编号查询指定的问题答案
@RequestMapping("/select_a")
@ResponseBody
public String selectAnswer(HttpServletRequest request,int q_id) {
	return examService.selectAnswer(q_id);
}
//查询编程练习表中所有的元素
@RequestMapping("/select_exam")
@ResponseBody
public List<Exam> selectExam(HttpServletRequest request){
	return examService.selectExam();
	
}
//根据问题编号删除指定的编程问题
@RequestMapping("/del_exam")
@ResponseBody
public int delExam(HttpServletRequest request,int q_id){
	return examService.delExam(q_id);
	
}
//添加编程问题
@RequestMapping("/add_exam")
@ResponseBody
public int addExam(HttpServletRequest request){
	String q_name = request.getParameter("q_name");
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	return examService.addExam(q_name,question,answer);
	
}
//根据编程问题编号查询问题下的所有内容
@RequestMapping("/sel_q")
@ResponseBody
public Exam selQue(HttpServletRequest request,int q_id){
	return examService.selectQuestion(q_id);
}
//修改编程练习表
@RequestMapping("/update_exam")
@ResponseBody
public int updateExam(HttpServletRequest request,String q_name,String question,String answer,int q_id){
	return examService.updateExam(q_name, question, answer, q_id);
}
}
