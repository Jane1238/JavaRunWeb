package com.shaoyujian.JavaRunWeb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shaoyujian.JavaRunWeb.mapper.ExamMapper;
import com.shaoyujian.JavaRunWeb.model.Exam;
import com.shaoyujian.JavaRunWeb.service.ExamService;
@Service("examService")
public class ExamServiceImpl implements ExamService {
	@Autowired
	private ExamMapper examMapper;
	@Override
	public List<Exam> selectAllQuestion() {
		return examMapper.selectAllQuestion();
	}

	@Override
	public String selectAnswer(int q_id) {
		return examMapper.selectAnswer(q_id);
	}

	@Override
	public List<Exam> selectExam() {
		return examMapper.selectExam();
	}

	@Override
	public int updateExam(String q_name, String question, String answer, int q_id) {
		return examMapper.updateExam(q_name, question, answer, q_id);
	}

	@Override
	public int addExam(String q_name, String question, String answer) {
		return examMapper.AddExam(q_name, question, answer);
	}

	@Override
	public int delExam(int q_id) {
		return examMapper.delExam(q_id);
	}

	@Override
	public Exam selectQuestion(int q_id) {
		return examMapper.selectQuestion(q_id);
	}

}
