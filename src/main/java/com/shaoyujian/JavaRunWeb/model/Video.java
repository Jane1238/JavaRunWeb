package com.shaoyujian.JavaRunWeb.model;

/**
 * video表对应的实体类
 *
 */
public class Video {
	private int videoId;		//视频标号
	private String videoName;	//视频名字
	private String videoTime;	//视频时长
	private String videoSrc;	//视频路径
	private int videoTypeId;	//视频类型编号
	public int getVideoId() {
		return videoId;
	}
	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}
	public String getVideoName() {
		return videoName;
	}
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	public String getVideoSrc() {
		return videoSrc;
	}
	public void setVideoSrc(String videoSrc) {
		this.videoSrc = videoSrc;
	}
	public int getVideoTypeId() {
		return videoTypeId;
	}
	public void setVideoTypeId(int videoTypeId) {
		this.videoTypeId = videoTypeId;
	}
	public String getVideoTime() {
		return videoTime;
	}
	public void setVideoTime(String videoTime) {
		this.videoTime = videoTime;
	}
	
}
