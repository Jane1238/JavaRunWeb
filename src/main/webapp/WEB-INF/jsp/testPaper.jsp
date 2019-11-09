<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>习题测试</title>
<link href="css/main1.css" rel="stylesheet" type="text/css" />
<link href="css/iconfont.css" rel="stylesheet" type="text/css" />
<link href="css/test.css" rel="stylesheet" type="text/css" />
<style>
.hasBeenAnswer {
	background: #5d9cec;
	color:#fff;
}
</style>

</head>
<body>
<div class="main">
	<!--nr start-->
	<div class="test_main">
		<div class="nr_left">
			<div class="test">
				<form action="" method="post">
					<div class="test_title">
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">00:15</b>
						</p>
						<font><input type="button" name="test_jiaojuan" class="jiaojuan" value="交卷"></font>
					</div>
					
						<div class="test_content">
							<div class="test_content_title">
								<h2>单选题</h2>
							</div>
						</div>
						<div class="test_content_nr">
							<ul id="danxuan">
							</ul>
							<br>
							<br>
						</div>
				</form>
			</div>
		</div>
		<div class="nr_right">
			<div class="nr_rt_main">
				<div class="rt_nr1">
					<div class="rt_nr1_title">
						<h1>
							<i class="icon iconfont">&#xe692;</i>答题卡
						</h1>
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">00:15</b>
						</p>
					</div>
					
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>单选题</h2>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul id="datika">
									
									
								</ul>
								
							</div>
						</div>
				</div>
			<input type="hidden" id="time1"></input>
			</div>
		</div>
	</div>
</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="js/jquery.countdown.js"></script>
		
		
</body>
	<script>
		$(document).ready(function(){
			/*
				作答时间的限额设置
			*/
				"use strict";
				$('time').countDown({
					with_separators : false
				});
				$('.alt-1').countDown({
					css_class : 'countdown-alt-1'
				});
				$('.alt-2').countDown({
					css_class : 'countdown-alt-2'
				});
				/*
					获取作答的时间
				*/
				var time1 =(new Date()).valueOf();
				$("#time1").val(time1);
				/*
					查询所有客观题的ajax操作
				*/
			$.ajax({
				url:"/select_test",
				dataType:'json',
				type:'get',
				success:function(data){
					
					 $.each(data,function(index,item){
						 var li;
						 var lii;
						 index++;
						 li='<li class="tihao" id="'+item.testId+'"><div class="test_content_nr_tt"><i>'+index+'.</i><span>(10分)</span><font>'+item.testTxt+
'</font><b class="icon iconfont">&#xe881;</b></div><div class="test_content_nr_main"><ul><li class="option"><input type="radio" class="radioOrCheck" name="answer'+index+'" id="'+item.testId+'A"/><label for="'+item.testId+'A">A.<p class="ue" style="display: inline;">'+item.a+
'</p></label></li><li class="option"><input type="radio" class="radioOrCheck" name="answer'+index+'" id="'+item.testId+'B"/><label for="'+item.testId+'B">B.<p class="ue" style="display: inline;">'+item.b+'</p></label></li><li class="option"><input type="radio" class="radioOrCheck" name="answer'+index+'" id="'+item.testId+'C"/><label for="'+item.testId+'C">C.<p class="ue" style="display: inline;">'+item.c+
'</p></label></li><li class="option"><input type="radio" class="radioOrCheck" name="answer'+index+'"id="'+item.testId+'D"/><label for="'+item.testId+'D">D.<p class="ue" style="display: inline;">'+item.d+'</p></label></li></ul></div></li>';
						lii='<li><a href= "#'+item.testId+'">'+index+'</a></li>';
						$('#danxuan').append("<ul>"+li+"</ul>");
						$('#datika').append(lii);
						
					 })
					 /*
					 	答题卡的相关操作
					 */
					 $('li.option label').on("click",function() {
							
								var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
								var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
								// 设置已答题
								if(!cardLi.hasClass('hasBeenAnswer')){
									cardLi.addClass('hasBeenAnswer');
								}
								
							});
					 /*
					 	交卷时的ajax操作
					 */
					 $(".jiaojuan").on("click",function(){
						var time2 =(new Date()).valueOf();
						var time=$("#time1").val();
						var useTime=(time2-time)/1000;
						var c = confirm("确认交卷吗?")
			            if(c){	
								let x =[];
								$('input[type="radio"]:checked').each(function(){	
											 var xuanxiang = $(this).attr("id");
											 x.push(xuanxiang)
										})
							$.ajax({
								url:"/push_time",
								data:{'useTime':useTime},
								dataType:"text",
								type:"post",
								success:function(data){
									if(data>0){
										$.ajax({
											async : false,
								            cache : false,
								            traditional: true,
											url:"/select_answer",
											data:{'x':x},
											dataType:"text",
											type:"post",
											success:function(data){
												alert("提交成功!");
												window.location.href = "result";
											}
											
										})		
									}
								}
							})
									 
					 	}else{
					 		return false;
					 	}
					 })
							
						}
						 
					 })
					 })
					 
	</script>
</html>