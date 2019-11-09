<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专题测试</title>
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
	<h2>专题测试</h2>
<div class="table-wrapper">
    <table class="fl-table" role="grid" aria-describedby="example_info" id="tableTest">
        <thead>
        <tr>
            <th>试卷号</th>
            <th>试卷名</th>
            <th>题目数量</th>
            <th>操作</th>
         	
        </tr>
        </thead>
        <tbody>
       
        <tbody>
    </table>
	
    <input type="button" onclick="location.href='menu'" value ="返回到导航栏" id="list" class="btn btn-primary btn-block btn-large"/>
</div>

	

</body>
<script>
/*
	查询所有试卷的ajax操作
*/
 $(document).ready(function(){
    $.ajax({
        url:"/select_testPaper",
        type:'get',
        dataType:'json',
        success:function(data){
            //方法中传入的参数data为后台获取的数据
            $.each(data,function(index,item){
                var tr;
               	index++;
                tr='<td>'+index+'</td>'+'<td>'+item.paperName+'</td>'+'<td>'+item.testCount+'</td>'+'<td><a href="#" class="start" id="'+item.paperId+'">开始答题</a></td>';
                $("#tableTest").append('<tr>'+tr+'</tr>');
            })
            /*
            	点击开始答题的ajax操作
            */
            $('.start').on('click',function(){
            	var c = confirm("确认开始答题吗?")
            	if(c){
            		var paperId = $(this).attr("id");
            		var data={"paperId":paperId}
					$.ajax({
						url:"/ready_test",
						type:"post",
						data:data,
						dataType:'text',
						success:function(data){
							if(data==2){
								$(this).attr('disabled',"true");
								alert("您已答完次试卷，不可重复作答！");
								return false;
							}else{
								window.location.href = "testPaper";
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