<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷</title>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<link rel="stylesheet" type="text/css" href="css/manager.css">

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bootbox.min.js"></script>
<style>
.gongju {
  border: 0;
  outline: none;
  border-radius: 0;
  padding: 15px 0;
  font-size: 1.4rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: .1em;
  background: #FF0033;
  color: #ffffff;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
  -webkit-appearance: none;
}
td {
text-align:center; /*设置水平居中*/
vertical-align:middle;/*设置垂直居中*/
}
</style>
</head>
<body>

<div class="box" class="btn btn-primary btn-sm" >

    <div class="title">试卷</div>
    
    <div class="content">
        <!--添加按钮及bootstrap的模态框-->
        <!--表格列表-->
        <table id="tb" class="table">
            <thead>
            <tr>
                <th>试卷号</th>
                <th>试卷名</th>
                <th>已考人数</th>
                <th>查看学生成绩</th>
                <th>查看试卷作对情况</th>
            </tr>
            </thead>
            <tbody >
           
            </tbody>
        </table>
    </div>
</div>
</body>
<script>

$(document).ready(function(){
	/*
		查询所有试卷的ajax准备
	*/
	$.ajax({
    		url:"/select_result_ready",
    		type:"get",
    		dataType:'json',
    		success:function(data){
    			$.each(data,function(index,item){
                    var tr;
                   	index++;
                    tr='<td>'+index+'</td>'+'<td>'+item.paperName+'</td>'+'<td>'+item.userCount+'</td>'+'<td><a href="#" class="start" id="'+item.paperId+'">查看该试卷的所有学生成绩</a><td><a href="#" class="toshow" id="'+item.paperId+'">查看试卷作对情况</a></td></td>';
                    $("#tb").append('<tr>'+tr+'</tr>');
                })
                /*
                	点击查看该试卷所有的学生成绩ajax操作
                */
				$('.start').on('click',function(){
            	
            		var paperId = $(this).attr("id");
            		var data={"paperId":paperId}
					$.ajax({
						url:"/result_ready",
						type:"post",
						data:data,
						dataType:'text',
						success:function(data){
							if(data==1){
								window.location.href = "check_test_result";
							}
								
							}
					})
					})
					/*
						点击查看试卷作对情况的ajax操作
					*/
            	$('.toshow').on('click',function(){
            		var paperId = $(this).attr("id");
            		var data={"paperId":paperId}
					$.ajax({
						url:"/result_ready",
						type:"post",
						data:data,
						dataType:'text',
						success:function(data){
							if(data==1){
								window.location.href = "show_isTrue";
							}
								
							}
					})
            })
					}
					})
					})
					
</script>
</html>