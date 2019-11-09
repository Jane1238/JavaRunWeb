package com.shaoyujian.JavaRunWeb.service;

import java.util.List;
import com.shaoyujian.JavaRunWeb.model.Video;

public interface VideoService {

		//查找视频
		List<Video> selectVideos();
		//添加视频
		boolean addVideo(String videoName,String videoTime,String videoSrc);
		//删除视频
		int delVideo(int videoId);
		//根据id查路径
		String selectVideoSrc(int videoId);
		//根据id查询video
		Video selectVideo(int videoId);
		//根据id修改视频
		int updateVideo(String videoName,String videoTime,String videoSrc,int videoId);
}
