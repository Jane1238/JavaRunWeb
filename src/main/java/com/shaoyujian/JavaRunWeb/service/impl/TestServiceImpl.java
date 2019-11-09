package com.shaoyujian.JavaRunWeb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shaoyujian.JavaRunWeb.mapper.TestMapper;
import com.shaoyujian.JavaRunWeb.model.Result;
import com.shaoyujian.JavaRunWeb.model.Test;
import com.shaoyujian.JavaRunWeb.model.TestPaper;
import com.shaoyujian.JavaRunWeb.model.User_paper;
import com.shaoyujian.JavaRunWeb.service.TestService;

@Service("testService")
public class TestServiceImpl implements TestService {
	@Autowired
	private TestMapper testMapper;
	
	@Override
	public List<TestPaper> selectTestPaper() {
		return testMapper.selectTestPaper();
	}

	@Override
	public int testCount(int paperId) {
		return testMapper.testCount(paperId);
	}

	@Override
	public List<Test> selectTest(int paperId) {
		return testMapper.selectTest(paperId);
	}

	@Override
	public String[] selectAnswer(int paperId) {
		return testMapper.selectAnswer(paperId);
	}

	@Override
	public int saveResult(int result, int paperId, int userId,String useTime) {
		return testMapper.saveResult(result, paperId, userId,useTime);
	}

	@Override
	public int[] selectTestId(int paperId) {
		return testMapper.selectTestId(paperId);
	}

	@Override
	public int saveUserPaper(int userId, int paperId) {
		return testMapper.saveUserPaper(userId, paperId);
	}

	@Override
	public List<User_paper> selectUserPaper(int userId, int paperId) {
		return testMapper.selectUserPaper(userId, paperId);
	}

	@Override
	public int delPaper(int paperId) {
		return testMapper.delPaper(paperId);
	}

	@Override
	public int delTest(int paperId) {
		return  testMapper.delTest(paperId);
	}

	@Override
	public int delUserPaper(int paperId) {
		return testMapper.delUserPaper(paperId);
	}

	@Override
	public int delOneTest(int testId) {
		return testMapper.delOneTest(testId);
	}

	@Override
	public String selectPaperName(int paperId) {
		return testMapper.selectPaperName(paperId);
	}

	@Override
	public List<Result> selectResult(int paperId) {
		return testMapper.selectResult(paperId);
	}

	@Override
	public int addTest(String testTxt, String a, String b, String c, String d, String answer, int paperId) {
		return testMapper.addTest(testTxt, a, b, c, d, answer, paperId);
	}

	@Override
	public Test selectOneTest(int testId) {
		return testMapper.selectOneTest(testId);
	}

	@Override
	public int updateTest(String testTxt, String a, String b, String c, String d, String answer, int testId) {
		return testMapper.updateTest(testTxt, a, b, c, d, answer, testId);
	}

	@Override
	public int addPaper(String paperName) {
		return testMapper.addPaper(paperName);
	}


	@Override
	public String[] selectTestTxt(int paperId) {
		return testMapper.selectTestTxt(paperId);
	}

	@Override
	public String selecta(int testId) {
		return testMapper.selecta(testId);
	}

	@Override
	public String selectb(int testId) {
		return testMapper.selectb(testId);
	}

	@Override
	public String selectc(int testId) {
		return testMapper.selectc(testId);
	}

	@Override
	public String selectd(int testId) {
		return testMapper.selectd(testId);
	}


	@Override
	public int selectUserCount(int paperId) {
		return testMapper.selectUserCount(paperId);
	}

	@Override
	public Test selectAbcd(int testId) {
		return testMapper.selectAbcd(testId);
	}

	@Override
	public int selecta_choose(int testId) {
		return testMapper.selecta_choose(testId);
	}

	@Override
	public int selectb_choose(int testId) {
		return testMapper.selectb_choose(testId);
	}

	@Override
	public int selectc_choose(int testId) {
		return testMapper.selectc_choose(testId);
	}

	@Override
	public int selectd_choose(int testId) {
		return testMapper.selectd_choose(testId);
	}

	@Override
	public int updatea_choose(int a_choose, int testId) {
		return testMapper.updatea_choose(a_choose, testId);
	}

	@Override
	public int updateb_choose(int b_choose, int testId) {
		return testMapper.updateb_choose(b_choose, testId);
	}

	@Override
	public int updatec_choose(int c_choose, int testId) {
		return testMapper.updatec_choose(c_choose, testId);
	}

	@Override
	public int updated_choose(int d_choose, int testId) {
		return testMapper.updated_choose(d_choose, testId);
	}

	@Override
	public int selectIstrue(int testId) {
		return testMapper.selectIstrue(testId);
	}

	@Override
	public int[] selectIstrues(int paperId) {
		return testMapper.selectIstrues(paperId);
	}

	@Override
	public int updateIstrue(int isTrue, int testId) {
		return testMapper.updateIstrue(isTrue, testId);
	}

}
