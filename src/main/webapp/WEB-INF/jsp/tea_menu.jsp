<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
<title>后台管理</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/styleLearnJava.css">
</head>
<style>
.login_out {
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

</style>
<body>

<!-- WRAPPER -->
<div id="wrapper"> 
  <!-- NAVBAR -->
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="brand"> <font style="color: #fff;
  font-size: 22px;">学生信息后台管理</font> </div>
    <div class="container-fluid">
      <div class="navbar-btn" style="padding: 0; padding-top: 10px;">
        <button type="button" class="btn-toggle-fullwidth btn-toggle-mx"><img src="img/left.png" height="40px" alt=""></button>
      </div>
      <div align="right">
    	<button onclick="exit()" type="button"  class="login_out"  >
				退出登录
		</button>
	</div>
    </div>
  </nav>
  <!-- END NAVBAR --> 
  <!--_________________________________________________________________________________________--> 
  <!-- LEFT SIDEBAR -->
  <div id="sidebar-nav" class="sidebar">
    <div class="sidebar-scroll">
      <nav>
        <ul class="nav">
          <li><a href="exam_manage" target="_blank" class="iframe_link active"><span>编程题库管理</span></a></li>
          <li><a href="paper_manage" target="_blank" class="iframe_link"><span>客观题库管理</span></a></li>
          <li><a href="check_result_ready" target="_blank" class="iframe_link"><span>学生成绩查看</span></a></li>
          <li><a href="video_manage" target="_blank" class="iframe_link"><span>视频管理</span></a></li>
		  <li> 
			<a href="javascript:;" class="nav-togg"> <span>搭建方法</span> </a>
            <div>
              <ul>
                  <li><a href="learn_1" target="_blank" class="iframe_link"><span>test1</span></a></li>
                  <li><a href="learn_2" target="_blank" class="iframe_link"><span>test2</span></a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
    </div>
  </div>
  <div class="main">
    <div class="main-content" style="height: 100%;">
      <iframe src="exam_manage" class="iframe_mx uicss-cn"></iframe>
    </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/klorofil-common.js" ></script> 
<script>
/*
 * 退出老师登录的ajax操作
 */
function exit(){
	if(confirm("是否退出学生信息后台管理?")){
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
		

}
</script>
</body>
</html>