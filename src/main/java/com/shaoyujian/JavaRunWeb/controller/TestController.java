package com.shaoyujian.JavaRunWeb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping("/toStudy1")
    public String toStudy() {
		System.out.println("this is toStudy");
        return "toStudy";
    }
	@RequestMapping("toLogin")
	public String toLogin() {
		return "login";
	}
	@RequestMapping("show_abcd")
	public String toShow_abcd() {
		return "show_abcd";
	}
	@RequestMapping("exam_manage")
	public String toExam_manage() {
		return "exam_manage";
	}
	@RequestMapping("menu")
	public String toMenu() {
		return "menu";
	}
	@RequestMapping("code")
	public String toCode() {
		return "code";
	}
	@RequestMapping("exam")
	public String toExam() {
		return "exam";
	}
	@RequestMapping("test_menu")
	public String toTest_menu() {
		return "test_menu";
	}
	@RequestMapping("testPaper")
	public String toTestPaper() {
		return "testPaper";
	}
	@RequestMapping("test_manage")
	public String toTest_manage() {
		return "test_manage";
	}
	
	@RequestMapping("video_manage")
	public String toVideo_manage() {
		return "video_manage";
	}
	@RequestMapping("paper_manage")
	public String toPaper_manage() {
		return "paper_manage";
	}
	@RequestMapping("check_result_ready")
	public String toCheck_result_ready() {
		return "check_result_ready";
	}
	@RequestMapping("result")
	public String toResult() {
		return "result";
	}
	@RequestMapping("show_isTrue")
	public String toshow_isTrue() {
		return "show_isTrue";
	}
	@RequestMapping("tea_menu")
	public String toTea_menu() {
		return "tea_menu";
	}
	@RequestMapping("video_menu")
	public String toVideo_menu() {
		return "video_menu";
	}
	@RequestMapping("check_test_result")
	public String toCheck_test_result() {
		return "check_test_result";
	}
	@RequestMapping("learnJava")
	public String tolearnJava() {
		return "learnJava";
	}
	@RequestMapping("learn_1")
	public String toLearn_1() {
		return "learn_1";
	}
	@RequestMapping("learn_2")
	public String toLearn_2() {
		return "learn_2";
	}
	@RequestMapping("learn_3")
	public String toLearn_3() {
		return "learn_3";
	}
	@RequestMapping("learn_4")
	public String toLearn_4() {
		return "learn_4";
	}
	@RequestMapping("learn_5")
	public String toLearn_5() {
		return "learn_5";
	}
	@RequestMapping("learn_6")
	public String toLearn_6() {
		return "learn_6";
	}
	
}
