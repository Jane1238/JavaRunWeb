package com.shaoyujian.JavaRunWeb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import com.shaoyujian.JavaRunWeb.model.Exam;

/**
 * 小题测试功能
 *
 */
@Component
public interface ExamMapper {
	//添加新问题与答案
	@Insert("insert into exam(q_name,question,answer)values(#{q_name},#{question},#{answer})")
	int AddExam(@Param("q_name")String q_name,@Param("question")String question,@Param("answer")String answer);
	//查看所有考试问题
	@Select("select q_id,question from exam")
	List<Exam> selectAllQuestion();
	//根据问题id寻找答案
	@Select("select answer from exam where q_id=#{q_id}")
	String selectAnswer(@Param("q_id")int q_id);
	//根据问题id修改问题名称，问题，问题答案
	@Update("update exam set q_name=#{q_name},question=#{question},answer=#{answer} where q_id=#{q_id}")
	int updateExam(@Param("q_name")String q_name,@Param("question")String question,@Param("answer")String answer,@Param("q_id")int q_id);
	//查询题库中所有元素
	@Select("select q_id,q_name,question,answer from exam")
	List<Exam> selectExam();
	//根据q_id查找具体内容
	@Select("select q_name,question,answer from exam where q_id=#{q_id}")
	Exam selectQuestion(@Param("q_id")int q_id);
	//根据问题id删除问题
	@Delete("delete from exam where q_id =#{q_id}")
	int delExam(@Param("q_id")int q_id);
}
