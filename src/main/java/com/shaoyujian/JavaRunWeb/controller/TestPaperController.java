package com.shaoyujian.JavaRunWeb.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.shaoyujian.JavaRunWeb.model.JiLu;
import com.shaoyujian.JavaRunWeb.model.Result;
import com.shaoyujian.JavaRunWeb.model.Test;
import com.shaoyujian.JavaRunWeb.model.TestPaper;
import com.shaoyujian.JavaRunWeb.model.User_paper;
import com.shaoyujian.JavaRunWeb.service.TestService;

/**
 *客观题试卷与试题的相关页面逻辑操作
 *
 */
@RestController
public class TestPaperController {
	@Autowired
	private TestService testService;	
	//学生在做客观题前，查询所有的试卷
	@RequestMapping("select_testPaper")
	@ResponseBody
	public List<TestPaper> selectTestPaper(HttpServletRequest req,HttpSession session){
		List<TestPaper> testPapers = testService.selectTestPaper();
		for(TestPaper tps: testPapers) {
			//根据试卷id查询客观题表里对应的客观题个数，并加入到testPapers数组中
			tps.setTestCount(testService.testCount(tps.getPaperId()));
		}
		return testPapers;
	}
	//老师在观看指定试卷下所有的学生成绩前，查询所有的试卷
	@RequestMapping("select_result_ready")
	@ResponseBody
	public List<TestPaper> select_result_ready(HttpServletRequest req,HttpSession session){	
		List<TestPaper> testPapers = testService.selectTestPaper();
		for(TestPaper tps: testPapers) {
			//根据试卷编号查询做过此试卷的用户人数
			tps.setUserCount(testService.selectUserCount(tps.getPaperId()));
		}
		return testPapers;
	}
	//查询用户与试卷的关系表，检查用户是否已做过此张试卷
	@RequestMapping("ready_test")
	@ResponseBody
	public int readyTest(HttpServletRequest req,HttpSession session ,int paperId){
		//获取session中保存的用户编号
		int userId=(int)session.getAttribute("userId");
		//根据用户编号和试卷编号查询用户_试卷关系表
		List<User_paper> user_paper = testService.selectUserPaper(userId, paperId);
		if(user_paper.isEmpty()) {//如果没有，说明用户没有做过
			session.setAttribute("paperId", paperId);//将试卷编号存入session中，以便接下来遍历对应的所有客观题
			return 1;
			
		}else {
			return 2;	//用户已做过
		}
	}
	//老师查看指定试卷时，将试卷编号存入session中
	@RequestMapping("result_ready")
	@ResponseBody
	public int result_ready(HttpServletRequest req,HttpSession session ,int paperId){
			session.setAttribute("paperId", paperId);
			return 1;
		}
	//展示每个客观题的a、b、c、d具体选择人数情况前，将客观题编号保存在session中
	@RequestMapping("show_ready")
	@ResponseBody
	public int show_ready(HttpServletRequest req,HttpSession session ,int testId){
			session.setAttribute("testId", testId);
			return 1;
		}
	//根据客观题编号查询abcd的具体选择人数情况
	@RequestMapping("show_a_b_c_d")
	@ResponseBody
	public Test show_a_b_c_d(HttpServletRequest req,HttpSession session){
			//获取保存在session中的客观题编号
			int testId=(int)session.getAttribute("testId");
			return testService.selectAbcd(testId);
		}
	//根据试卷编号查询客观题表对应的所有题的作对人数情况
	@RequestMapping("show_to_isTrue")
	@ResponseBody
	public int[] show_to_isTrue(HttpServletRequest req,HttpSession session){
			int paperId=(int)session.getAttribute("paperId");
			return testService.selectIstrues(paperId);
		}

	@RequestMapping("select_ready")
	@ResponseBody
	public int select_ready(HttpServletRequest req,HttpSession session ,int paperId){
		session.setAttribute("paperId", paperId);
		return 1;
	}
	//添加试卷
	@RequestMapping("add_paper")
	@ResponseBody
	public int add_paper(HttpServletRequest req,HttpSession session,String paperName){
		testService.addPaper(paperName);
		return 1;
	}
	//根据指定试卷编号查询试卷名
	@RequestMapping("select_paperName")
	@ResponseBody
	public String select_paperName(HttpServletRequest req,HttpSession session ){
		return testService.selectPaperName((int)session.getAttribute("paperId"));
	}
	//删除试卷，删除对应试卷下的所有客观题
	@RequestMapping("del_Paper")
	@ResponseBody
	public int del_Per(HttpServletRequest req,HttpSession session ,int paperId){
		testService.delPaper(paperId);
		testService.delTest(paperId);
		testService.delUserPaper(paperId);
		return 1;
	}
	//删除指定客观题
	@RequestMapping("del_one_test")
	@ResponseBody
	public int del_one_test(HttpServletRequest req,HttpSession session ,int testId){
		testService.delOneTest(testId);
		return 1;
	}
	//添加客观题
	@RequestMapping("add_test")
	@ResponseBody
	public int add_test(HttpServletRequest req,HttpSession session ,String testTxt,String a,String b,String c,String d,String answer){
		int paperId = (int) session.getAttribute("paperId");
		testService.addTest(testTxt, a, b, c, d, answer, paperId);
		return 1;
	}
	//查询所有题
	@RequestMapping("select_test")
	@ResponseBody
	public List<Test> selectTest(HttpServletRequest req,HttpSession session ){
		int paperId = (int) session.getAttribute("paperId");
		List<Test> tests=testService.selectTest(paperId);
		return tests;
	}
	//查询某一个客观题
	@RequestMapping("sel_t")
	@ResponseBody
	public Test sel_t(HttpServletRequest req,HttpSession session,int testId){
		return testService.selectOneTest(testId);
	}
	//修改某一个客观题
	@RequestMapping("update_test")
	@ResponseBody
	public int update_test(HttpServletRequest req,HttpSession session,String testTxt,String a,String b,String c,String d,String answer,int testId){
		return testService.updateTest(testTxt, a, b, c, d, answer, testId);
	}
	//学生上交题后的具体操作
	@RequestMapping("/select_answer")
	@ResponseBody
	public int selectAnswer(HttpServletRequest req ,HttpSession session,String[] x){
		int fenshu=0;
		int a_choose=0;
		int b_choose=0;
		int c_choose=0;
		int d_choose=0;
		int isTrue=0;
		String[] y=x;//（客观题编号+选项）形式的数组{1A,2B.....}
		String[] useQue=new String[y.length];
		for(int i=0;i<y.length;i++) {
			useQue[i]=y[i].replaceAll("[^a-zA-Z]", "");//用户选的选项{A,B,C....}
		}
		int paperId = (int) session.getAttribute("paperId");
		String[] answer=testService.selectAnswer(paperId);//答案的选项{A,B,C.....}
		int[] paperIds = testService.selectTestId(paperId);//客观题编号{1,2,3,4...}
		String[] xx =new String[answer.length];//答案选项内容
		String[] yy=new String[y.length];//用户选项内容
		for(int i=0;i<useQue.length;i++) {
			if(useQue[i].equals("A")) {//用户选择a的情况
				yy[i]=testService.selecta(paperIds[i]);//查询a选项对应的内容，放入到选项内容数组中
				a_choose=testService.selecta_choose(paperIds[i]);//查询选择该客观的a选项的人数
				a_choose+=1;//a选项被选择的人数加1
				testService.updatea_choose(a_choose, paperIds[i]);//修改a选项被选择的人数
			}else if(useQue[i].equals("B")) {
				yy[i]=testService.selectb(paperIds[i]);
				b_choose=testService.selectb_choose(paperIds[i]);
				b_choose+=1;
				testService.updateb_choose(b_choose, paperIds[i]);
			}else if(useQue[i].equals("C")) {
				yy[i]=testService.selectc(paperIds[i]);
				c_choose=testService.selectc_choose(paperIds[i]);
				c_choose+=1;
				testService.updatec_choose(c_choose, paperIds[i]);
			}else {
				yy[i]=testService.selectd(paperIds[i]);
				d_choose=testService.selectd_choose(paperIds[i]);
				d_choose+=1;
				testService.updated_choose(d_choose, paperIds[i]);
			}
		}
		for(int i=0;i<answer.length;i++) {
			if(answer[i].equals("A")) {//答案是a选项
				xx[i]=testService.selecta(paperIds[i]);//查询a选项对应的内容放到答案选项数组中
			}else if(answer[i].equals("B")) {
				xx[i]=testService.selectb(paperIds[i]);
			}else if(answer[i].equals("C")) {
				xx[i]=testService.selectc(paperIds[i]);
			}else {
				xx[i]=testService.selectd(paperIds[i]);
			}//答案的{a字段里的内容，b字段里的内容...}
		}
		String[] testTxt=testService.selectTestTxt(paperId);
		
		for(int i=0;i<answer.length;i++) {
			answer[i]=paperIds[i]+answer[i];
			System.out.println(answer[i]);
		}
//		JiLu jilu=new JiLu();
//		List<JiLu> jilus = null;
//		//将用户选择的选项添加到JiLu表中
//		
//		for(int i=0;i<answer.length;i++) {
//			jilu.setUserChoose(y[i].substring(y[i].length()-1));
//			jilu.setAnswer(answer[i]);
//			jilus.add(jilu);
//		}
//		
 		for(int i=0;i<answer.length;i++) {
			if(y[i].equals(answer[i])) {//选项与答案进行对比
				fenshu=fenshu+10;//正确分数加10
				isTrue=testService.selectIstrue(paperIds[i]);
				isTrue=isTrue+1;//该题的作对人数加1
				testService.updateIstrue(isTrue, paperIds[i]);//修该做对人数
				y[i]="对";//原数组改为对
			}else {
				y[i]="错";//原数组改为错
			}
		}
 		for(int i=0;i<answer.length;i++) {
 			answer[i]=answer[i].replaceAll("[^a-zA-Z]", "");//答案的{A,B,C....}
		}
 		int userId = (int)session.getAttribute("userId");
 		Double ut=(Double)session.getAttribute("useTime");
 		String useTime="";
 		//将时间格式改为*分*秒*或*秒
 		if(ut>60) {
 			int m=(int)(ut/60);
 			int s=(int)(ut%60);
 			useTime=m+"分"+s+"秒";
 		}else {
 			int s=(int)(ut/1);
 			useTime=s+"秒";
 		}
 		System.out.println(useTime);
 		testService.saveResult(fenshu, paperId, userId,useTime);//存成绩
 		testService.saveUserPaper(userId, paperId);//存用户试卷关系
 		session.setAttribute("fenshu", fenshu);//session中存入分数
 		session.setAttribute("duicuo", y);//session中存入对错情况
 		session.setAttribute("useQue", useQue);//session中存入用户选项数组
 		session.setAttribute("answer", answer);//session中存入答案选项数组
 		session.setAttribute("xx", xx);//session中存入用户选项对应内容数组
 		session.setAttribute("yy", yy);//session中存入答案选线对应内容数组
 		session.setAttribute("testTxt", testTxt);//session存入客观题内容
		return 1;
	}
	//获取成绩
	@RequestMapping("select_result")
	@ResponseBody
	public int selectResult(HttpServletRequest req,HttpSession session ){
		int fenshu = (int) session.getAttribute("fenshu");
		return fenshu;
	}
	//存时间
	@RequestMapping("push_time")
	@ResponseBody
	public int push_time(HttpServletRequest req,HttpSession session,double useTime ){
		System.out.println(useTime);
		session.setAttribute("useTime", useTime);
		return 1;
	}
	//展示给学生成绩
	@RequestMapping("show_result")
	@ResponseBody
	public List<Result> show_result(HttpServletRequest req,HttpSession session ){
		int paperId=(int)session.getAttribute("paperId");
		List<Result> results =  testService.selectResult(paperId);
		for(Result re:results) {
			re.setPaperName(testService.selectPaperName(paperId));
		}
		return results;
	}
	//展示给学生对错记录
	@RequestMapping("select_jilu")
	@ResponseBody
	public List<JiLu> selectJilu(HttpServletRequest req,HttpSession session ){
		String[] duicuo =(String[])session.getAttribute("duicuo");
		String[] useQue =(String[])session.getAttribute("useQue");
		String[] answer =(String[])session.getAttribute("answer");
		String[] xx =(String[])session.getAttribute("xx");
		String[] yy =(String[])session.getAttribute("yy");
		String[] testTxt =(String[])session.getAttribute("testTxt");
		List<JiLu> jilus=new ArrayList<>();
		for(int i=0;i<duicuo.length;i++) {
			JiLu ji=new JiLu();
			ji.setTestTxt(testTxt[i]);
			ji.setAnswer(answer[i]);
			ji.setAnswerTxt(xx[i]);
			ji.setUserChooseTxt(yy[i]);
			ji.setUserChoose(useQue[i]);
			ji.setDuicuo(duicuo[i]);
			jilus.add(ji);
		}
		
		return jilus;
	}
}
