<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线编译器</title>
<link rel="stylesheet" href="css/style1.css" type="text/css" />
<link rel="stylesheet" href="css/codemirror.css" type="text/css" />
 <link rel="stylesheet" href="css/ambiance.css" type="text/css" />


<script src="js/codemirror.js" type="text/javascript"></script>
<script src="js/clike.js" type = "text/javascript"></script>
<script src="js/matchbrackets.js" type = "text/javascript"></script>
<script src="js/jquery-1.8.2.js" type= "text/javascript"></script>
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
<div id="box">
		<div id="topthing">
			
			<div id="tlthing"  >
			<strong><font size = "5px">在线编译器</font></strong>
			</div>
			<div id="trthing"  >
				<strong><font size = "5px">欢迎使用</font></strong>	
			</div>
		</div>
		<hr>
		<div id="midddlething">	
		<input type="button" onclick="empty()" value="清空" class="btn btn-primary btn-large "/>
		<input type="button" onclick="save()" value ="保存代码" id="save" class="btn btn-primary  btn-large"/>
	    <input type="button" onclick="location.href='code'" value ="查看已保存代码" id="list" class="btn btn-primary btn-large"/>
		<input type="button" onclick="check()" value ="点击查看字节码" id="check" class="btn btn-primary  btn-large"/>
		<div id="txt">
			
			<form action="${pageContext.request.contextPath}/run" method="post" id="form">
			<textarea id="code" name="code" class="code">
				public class A{
					public static void main(String[] args){
						System.out.print("Hello world!");
					}
				}
			</textarea>
			<input type="button" onclick="sub()" value ="点击运行" id="run" class="btn 
			btn-primary btn-block btn-large"/>
			</form>
		</div>
		<div id="retxt" class="recode">
			<textarea id="result">
		
			</textarea>
		
		</div>
		
	</div>
	
	<input type="button" value ="返回导航界面" onclick="location.href='menu'"class="btn btn-primary btn-block btn-large"/>
</div>
</body>
<script>
/*
 * 添加java编辑器
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
 *结果区的编辑器，只读形式 
 */
 
var result = CodeMirror.fromTextArea(document.getElementById("result"), {
	readOnly:true,
	indentUnit:1,
	theme: "ambiance"//设置主题
});
/*
 * 运行代码
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
/*
 * 运行成字节码
 */
function check(){

	$.ajax({
			url : "/runClass",
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
/*
 * 清空编辑区
 */
function empty(){
	editor.setValue("");

}
/*
 * 获取保存代码的时间
 */
	Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "H+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

/*
 *保存代码的ajax操作
 */
	function save(){
	
	 var codeName = prompt("给你的代码起个名字吧:","");
	 if(codeName){ 
		//点击的是“确定”
	var codeDate = new Date().Format("yyyy-MM-dd HH:mm:ss"); 
	 data={"codeName": codeName  ,"codeTxt":editor.getValue(),"codeDate":codeDate}
	$.ajax({
			url : "/saveCode",
			data: data,
			global : false,
			type : "POST",
			dataType : "text",
			async : false,
			success : function(data) {
				if(data==1){
					alert("保存成功！");
				}
			}

		}); 
	}else if(codeName === ""){ 
		alert("给这段代码起名字有助以后查找噢~点击重试吧~");
	}else{ 
		return false;
	}
	 
	}
</script>
</html>