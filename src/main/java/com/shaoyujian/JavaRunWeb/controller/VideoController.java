package com.shaoyujian.JavaRunWeb.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.shaoyujian.JavaRunWeb.model.Video;
import com.shaoyujian.JavaRunWeb.service.VideoService;

/**
 * 教学视频的相关页面逻辑操作
 *
 */
@RestController
public class VideoController {
	@Autowired
	private VideoService videoService;
	//遍历所有视频
	@RequestMapping("/select_video")
	@ResponseBody
	public List<Video> select_video(HttpServletRequest request){
		List<Video> videos = videoService.selectVideos();
		return videos;	
	}
	//添加视频
	@RequestMapping("/add_video")
	@ResponseBody
	public int  add_video(HttpServletRequest request,@RequestParam("videoName")String videoName,@RequestParam("videoTime")String videoTime,@RequestParam("myfile") MultipartFile myFile) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");//为了处理中文文件名
			String originalFilename=myFile.getOriginalFilename();
			//int pos=originalFilename.lastIndexOf(".");
			//String suffix=originalFilename.substring(pos);//获取后缀
			//项目src路径
			String realPath="D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb"+File.separator+"src"+File.separator+"main"+File.separator+"resources"+File.separator+"static"+File.separator+"video";
			//项目target路径
			String realPath2="D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb"+File.separator+"target"+File.separator+"classes"+File.separator+"static"+File.separator+"video";
			String fullPath=realPath+File.separator+originalFilename;
			String fullPath2=realPath2+File.separator+originalFilename;
			System.out.println("full:"+fullPath);
			//保存文件
			InputStream in = null;
			//文件输入流存入到src路径下
			try {
				in=myFile.getInputStream();
				OutputStream out = new FileOutputStream(new File(fullPath));
				int len=0;
				byte[] buf =new byte[3*1024];
				while((len = in.read(buf))!=-1) {
					out.write(buf, 0, len);
				}
				out.close();
				in.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
			//文件输入流存入到target路径下
			try {
				in=myFile.getInputStream();
				OutputStream out = new FileOutputStream(new File(fullPath2));
				int len=0;
				byte[] buf =new byte[3*1024];
				while((len = in.read(buf))!=-1) {
					out.write(buf, 0, len);
				}
				out.close();
				in.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
			String videoSrc="video"+File.separator+originalFilename;
			System.out.println("videoSrc:"+videoSrc);
			boolean a = videoService.addVideo(videoName, videoTime, videoSrc);
			System.out.println(a);
			return 1;
		
		

	}
	//删除视频
	@RequestMapping("/del_video")
	@ResponseBody
	public int del_video(HttpServletRequest request,int videoId) throws FileNotFoundException{
		String realPath="D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb"+File.separator+"src"+File.separator+"main"+File.separator+"resources"+File.separator+"static";
		String realPath2="D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb"+File.separator+"target"+File.separator+"classes"+File.separator+"static";
		String videoSrc=videoService.selectVideoSrc(videoId);
		String src=realPath+File.separator+videoSrc;
		String src2=realPath2+File.separator+videoSrc;
		File file = new File(src);
		File file2 = new File(src2);
		//视频文件删除
		file.delete();
		file2.delete();
		videoService.delVideo(videoId);
		return 1;	
	}
	//查询视频路径
	@RequestMapping("/sel_video")
	@ResponseBody
	public Video sel_video(HttpServletRequest request,HttpSession session,int videoId){
		Video video =videoService.selectVideo(videoId);
		String src =video.getVideoSrc();
		session.setAttribute("videoSrc",src);
		return video;	
	}
	//修改视频
	@RequestMapping("/update_video")
	@ResponseBody
	public int update_video(HttpServletRequest request,HttpSession session,@RequestParam("videoName1")String videoName1,@RequestParam("videoId")int videoId,@RequestParam("videoTime1")String videoTime1,@RequestParam("myfile1") MultipartFile myFile1) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");//为了处理中文文件名
		String originalFilename=myFile1.getOriginalFilename();
		//int pos=originalFilename.lastIndexOf(".");
		//String suffix=originalFilename.substring(pos);//获取后缀
		String realPath="D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb"+File.separator+"src"+File.separator+"main"+File.separator+"resources"+File.separator+"static"+File.separator+"video";
		String realPath2="D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb"+File.separator+"target"+File.separator+"classes"+File.separator+"static"+File.separator+"video";
		String fullPath=realPath+File.separator+originalFilename;
		String fullPath2=realPath2+File.separator+originalFilename;
		System.out.println("full:"+fullPath);
		//保存文件
		InputStream in = null;
		try {
			in=myFile1.getInputStream();
			OutputStream out = new FileOutputStream(new File(fullPath));
			int len=0;
			byte[] buf =new byte[3*1024];
			while((len = in.read(buf))!=-1) {
				out.write(buf, 0, len);
			}
			out.close();
			in.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		try {
			in=myFile1.getInputStream();
			OutputStream out = new FileOutputStream(new File(fullPath2));
			int len=0;
			byte[] buf =new byte[3*1024];
			while((len = in.read(buf))!=-1) {
				out.write(buf, 0, len);
			}
			out.close();
			in.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		//删除原来文件
		String src = (String)session.getAttribute("videoSrc");
		String delSrc = "D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb"+File.separator+"src"+File.separator+"main"+File.separator+"resources"+File.separator+"static"+File.separator+src;
		String delSrc2="D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb"+File.separator+"target"+File.separator+"classes"+File.separator+"static"+File.separator+src;
		File f = new File(delSrc);
		File f2 = new File(delSrc2);
		f.delete();
		f2.delete();
		//修改信息到数据库
		String vStrc="video"+File.separator+originalFilename;
		videoService.updateVideo(videoName1, videoTime1, vStrc,videoId);
		return 1;
	}
	
	
}
