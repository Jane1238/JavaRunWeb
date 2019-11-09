<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航</title>

<link rel="stylesheet" type="text/css" href="css/styles.css">

</head>
<body>
<div class="nav">
  <button class="btn-nav">
	<span class="icon-bar top"></span>
	<span class="icon-bar middle"></span>
	<span class="icon-bar bottom"></span>
  </button>
</div>

<div class="nav-content hideNav hidden">
  <ul class="nav-list">
	<li class="nav-item"><a href="/toStudy1" class="item-anchor">使用编译器</a></li>
	<li class="nav-item"><a href="learnJava" class="item-anchor">Java学习</a></li>
	<li class="nav-item"><a href="video_menu" class="item-anchor">视频学习</a></li>
	<li class="nav-item"><a href="exam" class="item-anchor">实验练习</a></li>
	<li class="nav-item"><a href="test_menu" class="item-anchor">专题测试</a></li>
	<li class="nav-item"><a href="#" id="login_out"class="item-anchor">退出</a></li>
  </ul>
</div>
<div class="show">
 	<font style="color: #1ab188;font-size: 70px;font-weight:3px" id="userName"></font><br><br>
	<font style="color: #fff;
  font-size: 30px;">欢迎您来到Java在线编译器的导航页~<br><br>
  				   在这里你可以测试你的Java代码！<br><br>可以学习如何写Java代码!<br><br>可以通过做测试题巩固自己的Java水平!<br><br>
  				 点击左上角，开始你的Java学习之旅！</font>
</div>

<script src="js/jquery-1.8.2.js" type= "text/javascript"></script>
<script>
$(document).ready(function(){
	$.ajax({
		url:"/userName",
		dataType:"text",
		type:"get",
		success:function(data){
			$("#userName").append(data)	
		}
	})
	
	$('.btn-nav').on('click tap', function () {
		$('.nav-content').toggleClass('showNav hideNav').removeClass('hidden');
		$(this).toggleClass('animated');
	});
	$("#login_out").on("click",function(){
		var c = confirm("确认退出吗?")
        if(c){
		$.ajax({
			url:"/login_out",
			dataType:"text",
			type:"get",
			success:function(data){
				if(data==1){
					window.location.href = "toLogin";
				}
				
			}
		})
        }else{
        	return false;
        }
	})
})
	
	


</script>

</body>
</html>