package com.shaoyujian.JavaRunWeb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import com.shaoyujian.JavaRunWeb.model.Video;

/**
 * 实现视频的管理
 *
 */
@Component
public interface VideoMapper {
	//查找所有视频
	@Select("select videoId,videoName,videoTime,videoSrc from video where 1=1")
	List<Video> selectVideos();
	//添加视频
	@Insert("insert into video(videoName,videoTime,videoSrc)values(#{videoName},#{videoTime},#{videoSrc})")
	int addVideo(@Param("videoName")String videoName,@Param("videoTime")String videoTime,@Param("videoSrc")String videoSrc);
	//删除视频
	@Delete("delete from video where videoId=#{videoId}")
	int delVideo(@Param("videoId")int videoId);
	//根据id查路径
	@Select("select videoSrc from video where videoId=#{videoId}")
	String selectVideoSrc(@Param("videoId")int videoId);
	//根据id查询video
	@Select("select videoName,videoTime,videoSrc from video where videoId=#{videoId}")
	Video selectVideo(@Param("videoId")int videoId);
	//根据id修改视频
	@Update("update video set videoName=#{videoName},videoTime=#{videoTime},videoSrc=#{videoSrc} where videoId=#{videoId}")
	int updateVideo(@Param("videoName")String videoName,@Param("videoTime")String videoTime,@Param("videoSrc")String videoSrc,@Param("videoId")int videoId);
}
