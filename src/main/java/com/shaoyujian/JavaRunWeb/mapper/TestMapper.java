package com.shaoyujian.JavaRunWeb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shaoyujian.JavaRunWeb.model.Result;
import com.shaoyujian.JavaRunWeb.model.Test;
import com.shaoyujian.JavaRunWeb.model.TestPaper;
import com.shaoyujian.JavaRunWeb.model.User_paper;

/**
 * 单选题考试
 *
 */
public interface TestMapper {
	//查询所有试卷
	@Select("select paperId,paperName from testPaper")
	List<TestPaper> selectTestPaper();
	//查询试卷已考人数
	@Select("select COUNT(paperName) from (select u.userName,pr.paperName,pr.result,pr.useTime from user as u left JOIN(SELECT tp.paperName,ur.result,ur.useTime,ur.userId,tp.paperId from testPaper as tp join userResult as ur on tp.paperId = ur.paperId) as pr\r\n" + 
			"on u.userId = pr.userId and pr.paperId =#{paperId})as b ")
	int selectUserCount(@Param("paperId")int paperId);
	//删除试卷
	@Delete("delete from testPaper where paperId=#{paperId}")
	int delPaper(@Param("paperId")int paperId);
	//删除试卷中所有题
	@Delete("delete from test where paperId=#{paperId}")
	int delTest(@Param("paperId")int paperId);
	//删除试卷中某个题
	@Delete("delete from test where testId=#{testId}")
	int delOneTest(@Param("testId")int testId);
	//删除用户与试卷关系
	@Delete("delete from user_paper where paperId=#{paperId}")
	int delUserPaper(@Param("paperId")int paperId);
	//根据问题id查询问题
	@Select("select testTxt,a,b,c,d,answer from test where testId=#{testId}")
	Test selectOneTest(@Param("testId")int testId);
	//修改试题
	@Update("update test set testTxt=#{testTxt},a=#{a},b=#{b},c=#{c},d=#{d},answer=#{answer} where testId=#{testId}")
	int updateTest(@Param("testTxt")String testTxt,@Param("a")String a,@Param("b")String b,@Param("c")String c,@Param("d")String d,@Param("answer")String answer,@Param("testId")int testId);
	//查询试卷名
	@Select("select paperName from testPaper where paperId=#{paperId}")
	String selectPaperName(@Param("paperId")int paperId);
	//添加试题
	@Insert("insert into test(testTxt,a,b,c,d,answer,paperId)values(#{testTxt},#{a},#{b},#{c},#{d},#{answer},#{paperId})")
	int addTest(@Param("testTxt")String testTxt,@Param("a")String a,@Param("b")String b,@Param("c")String c,@Param("d")String d,@Param("answer")String answer,@Param("paperId")int paperId);
	//查询学生成绩
	@Select("select u.userName,pr.result,pr.useTime from user as u left JOIN(SELECT tp.paperName,ur.result,ur.useTime,ur.userId,tp.paperId from testPaper as tp join userResult as ur on tp.paperId = ur.paperId) as pr on u.userId = pr.userId  and pr.paperId =#{paperId} where u.power=1")
	List<Result> selectResult(@Param("paperId")int paperId);
	//根据试卷号查询所有问题id
	@Select("select testId from test where paperId=#{paperId}")
	int[] selectTestId(@Param("paperId")int paperId);
	//查询该试卷有多少题
	@Select("select COUNT(paperId) from test where paperId=#{paperId}")
	int testCount(@Param("paperId")int paperId);
	//根据试卷号遍历所有题
	@Select("select testId,testTxt,a,b,c,d,answer from test where paperId=#{paperId}")
	List<Test> selectTest(@Param("paperId")int paperId);
	//根据paperId寻找题的答案
	@Select("select answer from test where paperId=#{paperId}")
	String[] selectAnswer(@Param("paperId")int paperId);
	//上交成绩
	@Insert("insert into userResult(result,paperId,userId,useTime)values(#{result},#{paperId},${userId},#{useTime})")
	int saveResult(@Param("result")int result,@Param("paperId")int paperId,@Param("userId")int userId,@Param("useTime")String useTime);
	//保存用户做卷记录
	@Insert("insert into user_paper(userId,paperId)values(#{userId},#{paperId})")
	int saveUserPaper(@Param("userId")int userId,@Param("paperId")int paperId);
	//查询用户做卷记录
	@Select("select * from user_paper where userId = #{userId} and paperId = #{paperId}")
	List<User_paper> selectUserPaper(@Param("userId")int userId,@Param("paperId")int paperId);
	//添加试卷
	@Insert("insert into testPaper(paperName)values(#{paperName})")
	int addPaper(@Param("paperName")String paperName);
	//查询题的选择情况
	@Select("select a_choose,b_choose,c_choose,d_choose from test where testId=#{testId}")
	Test selectAbcd(@Param("testId")int testId);
	//查询题的作对人数
	@Select("select isTrue from test where testId=#{testId}")
	int selectIstrue(@Param("testId")int testId);
	//查询题的所有作对人数
	@Select("select isTrue from test where paperId=#{paperId}")
	int[] selectIstrues(@Param("paperId")int paperId);
	//修改题的做对人数
	@Update("update test set isTrue=#{isTrue} where testId=#{testId}")
	int updateIstrue(@Param("isTrue")int isTrue,@Param("testId")int testId);
	
	//查询a选项内容
	@Select("select a from test where testId=#{testId}")
	String selecta(@Param("testId")int testId);
	//查询b选项内容
	@Select("select b from test where testId=#{testId}")
	String selectb(@Param("testId")int testId);
	//查询c选项内容
	@Select("select c from test where testId=#{testId}")
	String selectc(@Param("testId")int testId);
	//查询d选项内容
	@Select("select a from test where testId=#{testId}")
	String selectd(@Param("testId")int testId);
		//查询a选项选择的人数
		@Select("select a_choose from test where testId=#{testId}")
		int selecta_choose(@Param("testId")int testId);
		//查询b选项选择的人数
		@Select("select b_choose from test where testId=#{testId}")
		int selectb_choose(@Param("testId")int testId);
		//查询c选项选择的人数
		@Select("select c_choose from test where testId=#{testId}")
		int selectc_choose(@Param("testId")int testId);
		//查询d选项选择的人数
		@Select("select d_choose from test where testId=#{testId}")
		int selectd_choose(@Param("testId")int testId);
				//修改a选项选择的人数
				@Update("update test set a_choose=#{a_choose} where testId=#{testId}")
				int updatea_choose(@Param("a_choose")int a_choose,@Param("testId")int testId);
				//修改b选项选择的人数
				@Update("update test set b_choose=#{b_choose} where testId=#{testId}")
				int updateb_choose(@Param("b_choose")int b_choose,@Param("testId")int testId);
				//修改c选项选择的人数
				@Update("update test set c_choose=#{c_choose} where testId=#{testId}")
				int updatec_choose(@Param("c_choose")int c_choose,@Param("testId")int testId);
				//修改d选项选择的人数
				@Update("update test set d_choose=#{d_choose} where testId=#{testId}")
				int updated_choose(@Param("d_choose")int d_choose,@Param("testId")int testId);
	//查询所有问题内容
	@Select("select testTxt from test where paperId=#{paperId}")
	String[] selectTestTxt(@Param("paperId")int paperId);
	
}
