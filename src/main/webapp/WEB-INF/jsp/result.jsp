<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷</title>
<script src="js/jquery-1.8.2.js" type= "text/javascript"></script>
<link rel="stylesheet" href="css/table.css">
<style type="text/css">
.btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
.btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
.btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
.btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
.btn-primary.active { color: rgba(255, 255, 255, 0.75); }
.btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
.btn-block { width: 100%; display:block; }

* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }


body { 
	background-color: #14213D;
 	height: 100%;
  	width: 100%;
  	overflow-y:scroll;
 	font-family: 'Lato', sans-serif;
	}


</style>

</head>
<body>
<font style="color: #fff;
  font-size: 30px;" id="fs"></font>
<div class="table-wrapper">
    <table class="fl-table" role="grid" aria-describedby="example_info" id="tableTest">
        <thead>
        <tr>
            <th>题号</th>
            <th>题目内容</th>
            <th>您的答题选项</th>
            <th>您的答题选项内容</th>
         	<th>答案</th>
         	<th>答案选项内容</th>
         	 <th>对或错</th>
         	
        </tr>
        </thead>
        <tbody>
       
        <tbody>
    </table>
<input type="button" onclick="location.href='test_menu'" value ="返回试卷挑选界面" class="btn 
			btn-primary btn-block btn-large"/>
</div>
<script src="js/jquery-1.8.2.js" type= "text/javascript"></script>
<script>
/*
 * 学生端展示成绩的ajax操作
 */
$(document).ready(function(){
	$.ajax({
		url:"/select_result",
		dataType:"text",
		type:'get',
		success:function(data){
			var font;
			font='<h1>您的成绩为'+data+'分</h1>';
			$("#fs").append(font);
			/*
				展示做题记录的ajax操作，以表格的形式展现
			*/
			$.ajax({
				url:"/select_jilu",
				dataType:"json",
				type:'get',
				success:function(data){
					var julu;
					 $.each(data,function(index,item){
			               	index++;
			                jilu='<td>'+index+'</td>'+'<td>'+item.testTxt+'</td>'+'<td>'+item.userChoose+'</td>'+'<td>'+item.userChooseTxt+'</td>'+'<td>'+item.answer+'</td>'+'<td>'+item.answerTxt+'</td>'+'<td>'+item.duicuo+'</td>';
			                $("#tableTest").append('<tr>'+jilu+'</tr>');
			            })
					
					
					/* $.each(data,function(index){
						if(data[index]=="t"){
							jilu='<li><font style="color: #fff;font-size: 15px;">'+(index+1)+'</font><font style="color: #7FFF00;font-size: 15px;">.对</font><li>';
						}else{
							jilu='<li><font style="color:#fff;font-size: 15px;">'+(index+1)+'</font><font style="color:#FF0000;font-size: 15px;">.错</font><li>';
						}
						$("#jilu").append(jilu); 
					})*/
				}
			})
		}
		})
})
</script>

</body>
</html>