<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实验练习</title>
<link rel="stylesheet" href="css/exam.css" type="text/css" />
<link rel="stylesheet" href="css/codemirror.css" type="text/css" />
<link rel="stylesheet" href="css/ambiance.css" type="text/css" />
<link rel="stylesheet" href="css/tab.css">


<script src="js/codemirror.js" type="text/javascript"></script>
<script src="js/clike.js" type = "text/javascript"></script>
<script src="js/matchbrackets.js" type = "text/javascript"></script>
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

body { 
	background-color: #14213D;
 	height: 100%;
  	width: 100%;
 	font-family: 'Lato', sans-serif;
	}
.code,.recode{
	font-size:18px
}

</style>

</head>
  
<body>
<!-- 遮罩层 -->
<div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">
   
</div>
<!-- 弹窗 -->
<div id="showdiv" style="width: 80%; margin: 0 auto; height: 499px; border: 1px solid #999; display: none; position: absolute; top: 40%; left: 10%; z-index: 3; background: #483D8B">
  <!-- 标题 -->
  <div id ="title" style="background: #F8F7F7; width: 100%; height: 2rem; font-size: 0.65rem; line-height: 2rem; border: 1px solid #999; text-align: center;" >
    
  </div>
  <!-- 内容 -->
  <div class="col-lg-12  " style="text-indent: 50px; height: 25rem;color:#fff; overflow:auto;font-size: 1rem; padding: 0.5rem; line-height: 1rem; ">
    <pre class="mScroll" >
    	 <code class="lang-java">
    		
    	</code>
     </pre>
    
   </div>
  <!-- 按钮 -->
  <div style="background: #418BCA; width: 15%; margin: 0 auto; height: 2rem; line-height:2rem; text-align: center;color: #fff;margin-top: 1rem; -moz-border-radius: .128rem; -webkit-border-radius: .128rem; border-radius: .128rem;font-size: .59733rem;" onclick="closeWindow()">
    	确 定
  </div>
</div>
<div id="box" >
	<div id="topthing">	
			 <div class="tab-wrapper">
  		 		<ul id="ul" style="padding-inline-start: 0px;" class="tab-menu">	
  		
    				
  				</ul>
  			<div id="question" class="tab-content">
    			
    			
  			</div><!-- //tab-content -->
  
			</div><!-- //tab-wrapper -->
			
	</div>
		<hr>
		<div id="midddlething">	
		<div id="txt">
			<font style="color: #fff;
  font-size: 30px;">编辑区:</font>
			<form action="${pageContext.request.contextPath}/run" method="post" id="form">
			<textarea id="code" name="code" class="code">
				
			
			</textarea>
			<input type="button" onclick="empty()" value ="清空" class="btn 
			btn-primary btn-block btn-large"/>
			<input type="button" onclick="sub()" value ="点击运行" id="run" class="btn 
			btn-primary btn-block btn-large"/>
			<input type="button" onclick="location.href='menu'" value ="返回导航界面" id="run" class="btn 
			btn-primary btn-block btn-large"/>
			</form>
		</div>
		<div id="retxt" class="recode">
		<font style="color: #fff;
  font-size: 30px;">结果区:</font>
			<textarea id="result">
		
			</textarea>
		
		</div>
		
	</div>
	

</div>

<script src="js/jquery.min.js" type= "text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
</body>
<script>
/*
 * 查询所有的客观题的ajax操作
 */
$(document).ready(function(){
	$.ajax({
        url:"/select_q",
        type:'get',
        dataType:'json',
        success:function(data){
            //方法中传入的参数data为后台获取的数据
            $.each(data,function(index,item){
                index++;
                var ul;
                var div;
                if(index==1){
                	ul='<li class="active">第'+index+'题</li>';
                }else{
                ul='<li>第'+index+'题</li>';
                }
                div='<div style="color:#fff; font-size:2.5rem;">'+item.question+'<input type="button" class= "'+index+'"id="'+item.q_id+'" value ="查看答案" />';
				div=div+'</div>';
			
                $("#ul").append(ul);
                $("#question").append(div);
  });
            /*
            	点击不同的题实现不同的tab版块切换
            */
      var $wrapper = $('.tab-wrapper'),
      $allTabs = $wrapper.find('.tab-content > div'),
      $tabMenu = $wrapper.find('.tab-menu li'),
      $line = $('<div class="line"></div>').appendTo($tabMenu);
      $allTabs.not(':first-of-type').hide();  
      $tabMenu.filter(':first-of-type').find(':first').width('100%')
      $tabMenu.each(function(i) {
      $(this).attr('data-tab', 'tab'+i);
      });
      $allTabs.each(function(i) {
      $(this).attr('data-tab', 'tab'+i);
      });
      $tabMenu.on('click',function() {
      var dataTab = $(this).data('tab'),
      $getWrapper = $(this).closest($wrapper);
    
    $getWrapper.find($tabMenu).removeClass('active');
    $(this).addClass('active');
    
    $getWrapper.find('.line').width(0);
    $(this).find($line).animate({'width':'100%'}, 'fast');
    $getWrapper.find($allTabs).hide();
    $getWrapper.find($allTabs).filter('[data-tab='+dataTab+']').show();
    /*
    	点击查看答案的ajax操作
    */
    $button = $wrapper.find("input[type='button']");
    $button.on('click',function(){
    	var q_id = $(this).attr('id');
    	var index = $(this).attr('class');
    	data={"q_id":q_id}
    	$.ajax({
    		url:"/select_a",
    		data:data,
    		type:"POST",
    		dataType:'text',
    		success:function(data){
    			 $("#title").empty();
				$(".lang-java").empty();
    			$("#title").append("问题"+index+"(答案)");
    			$(".lang-java").append(data);
    		}
    	})
    $('#showdiv').show();  //显示弹窗
    $('#cover').css('display','block'); //显示遮罩层
    $('#cover').css('height',document.body.clientHeight+'px'); //设置遮罩层的高度为当前页面高度
    })
  
            })
        }
    })
    
})
/*
 * 加入java的编辑器
 */
 var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
		indentUnit:2,//单位缩进为4
		lineNumbers: true,//显示行号
		matchBrackets: true,//括号匹配
		theme: "ambiance",//设置主题
		lineWrapping: true, //代码折叠
		foldGutter: true,
		gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"],
		matchBrackets: true,  //括号匹配
		autoCloseBrackets: true,
		mode: "text/x-java"//实现java代码高亮
	});
/*
 * 结果显示区的设置，只读不可写
 */
var result = CodeMirror.fromTextArea(document.getElementById("result"), {
	readOnly:true,
	indentUnit:1,
	theme: "ambiance"//设置主题
});

// 弹窗
function showWindow() {
    $('#showdiv').show();  //显示弹窗
    $('#cover').css('display','block'); //显示遮罩层
    $('#cover').css('height',document.body.clientHeight+'px'); //设置遮罩层的高度为当前页面高度
  }
  
  // 关闭弹窗
function closeWindow() {
    $('#showdiv').hide();  //隐藏弹窗
    $('#cover').css('display','none'); 
     //显示遮罩层
  }

function empty(){
	editor.setValue("");

}

/*
 * 运行
 */
function sub(){
	$.ajax({
			url : "/run",
			data: {"code":editor.getValue()},
			global : false,
			type : "POST",
			dataType : "text",
			async : false,
			success : function(data) {
				result.getDoc().setValue(data);
			}

		});
	}

</script>
</html>