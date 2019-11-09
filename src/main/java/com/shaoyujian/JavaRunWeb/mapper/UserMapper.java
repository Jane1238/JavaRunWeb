package com.shaoyujian.JavaRunWeb.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;



/**
 * 实现用户登录注册功能
 *
 */
@Component
public interface UserMapper {
	//根据用户名查找用户信息
	@Select("SELECT userPassword FROM user WHERE userName = #{userName};")
	public String getByName(@Param("userName")String userName);
	//根据用户名和权限等级查找出用户信息
	@Select("SELECT userPassword FROM user WHERE userName = #{userName} and power= #{power};")
	public String getByNamePower(@Param("userName")String userName,@Param("power")int power);
	//实现用户注册功能
	@Insert("INSERT INTO user (userName,userPassword,power) VALUES ( #{userName}, #{userPassword},#{power});")
	 public int registerUser(@Param("userName")String userName,@Param("userPassword") String userPassword,@Param("power")int power);
	//根据用户名查询用户id
	@Select("SELECT userId FROM user WHERE userName = #{userName};")
	int selectUserId(@Param("userName")String userName);
}
