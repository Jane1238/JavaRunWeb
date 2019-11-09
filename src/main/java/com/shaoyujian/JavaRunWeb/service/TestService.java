package com.shaoyujian.JavaRunWeb.service;

import java.util.List;

import com.shaoyujian.JavaRunWeb.model.Result;
import com.shaoyujian.JavaRunWeb.model.Test;
import com.shaoyujian.JavaRunWeb.model.TestPaper;
import com.shaoyujian.JavaRunWeb.model.User_paper;

public interface TestService {
		//查询所有试卷
		List<TestPaper> selectTestPaper();
		//查询该试卷有多少题
		int testCount(int paperId);
		//根据试卷号遍历所有题
		List<Test> selectTest(int paperId);
		//根据paperId寻找题的答案
		String[] selectAnswer(int paperId);
		//查询试卷名
		String selectPaperName(int paperId);
		//上交成绩
		int saveResult(int result,int paperId,int userId,String useTime);
		//根据试卷号查询所有问题id
		int[] selectTestId(int paperId);
		//保存用户做卷记录
		int saveUserPaper(int userId,int paperId);
		//查询用户做卷记录
		List<User_paper> selectUserPaper(int userId,int paperId);
		//删除试卷
		int delPaper(int paperId);
		//删除试卷中所有题
		int delTest(int paperId);
		//删除试卷中某个题
		int delOneTest(int testId);
		//删除用户与试卷关系
		int delUserPaper(int paperId);
		//查询学生成绩
		List<Result> selectResult(int paperId);
		//添加试题
		int addTest(String testTxt,String a,String b,String c,String d,String answer,int paperId);
		//根据问题id查询问题
		Test selectOneTest(int testId);
		//修改试题
		int updateTest(String testTxt,String a,String b,String c,String d,String answer,int testId);
		//添加试卷
		int addPaper(String paperName);
		//查询试卷已考人数
		int selectUserCount(int paperId);
		//查询题的选择情况
		Test selectAbcd(int testId);
		//查询题的作对人数
		int selectIstrue(int testId);
		//查询题的所有作对人数
		int[] selectIstrues(int paperId);
		//修改题的做对人数
		int updateIstrue(int isTrue,int testId);
		
		
		//查询a选项内容
		String selecta(int testId);
		//查询b选项内容
		String selectb(int testId);
		//查询c选项内容
		String selectc(int testId);
		//查询d选项内容
		String selectd(int testId);
				//查询a选项选择的人数
				int selecta_choose(int testId);
				//查询b选项选择的人数
				int selectb_choose(int testId);
				//查询b选项选择的人数
				int selectc_choose(int testId);
				//查询d选项选择的人数
				int selectd_choose(int testId);
					//修改a选项选择的人数
					int updatea_choose(int a_choose,int testId);
					//修改b选项选择的人数
					int updateb_choose(int b_choose,int testId);
					//修改c选项选择的人数
					int updatec_choose(int c_choose,int testId);
					//修改d选项选择的人数
					int updated_choose(int d_choose,int testId);
		//查询所有问题内容
		String[] selectTestTxt(int paperId);
}

