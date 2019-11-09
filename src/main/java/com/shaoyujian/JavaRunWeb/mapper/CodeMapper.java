package com.shaoyujian.JavaRunWeb.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import com.shaoyujian.JavaRunWeb.model.Code;

/**
 * 实现保存删出代码功能
 *
 */
@Component
public interface CodeMapper {
	//保存代码
	@Insert("insert into code(codeName,codeTxt,codeDate,userId)values( #{codeName}, #{codeTxt},#{codeDate},#{userId})")
	int saveCode(@Param("codeName")String codeName,@Param("codeTxt")String codeTxt,@Param("codeDate")String codeDate,@Param("userId")int userId);
	
	//查看userId
	@Select("select userId from user where userName =#{userName}")
	int selectUserId(@Param("userName")String userName);
	//查看代码列表
	@Select("select codeName,codeTxt,codeDate from code where userId =#{userId}")
	List<Code> selectCode(@Param("userId")int userId);
	//删除代码
	@Delete("delete code where codeName=#{codeName} and userId=#{userId}")
	int deleteCode(@Param("codeName")String codeName,@Param("userId")int userId);
}
