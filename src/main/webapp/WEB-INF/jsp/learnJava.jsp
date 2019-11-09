<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
<title>Java学习</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/styleLearnJava.css">
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper"> 
  <!-- NAVBAR -->
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="brand"> <a href="menu"><font style="color: #fff;
  font-size: 22px;">返回导航栏</font></a> </div>
    <div class="container-fluid">
      <div class="navbar-btn" style="padding: 0; padding-top: 10px;">
        <button type="button" class="btn-toggle-fullwidth btn-toggle-mx"><img src="img/left.png" height="40px" alt=""></button>
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
          <li><a href="learn_1" target="_blank" class="iframe_link active"><span>Java简介</span></a></li>
          <li><a href="learn_2" target="_blank" class="iframe_link"><span>Java基本数据类型</span></a></li>
		  <li><a href="learn_3" target="_blank" class="iframe_link"><span>Java对象和类</span></a></li>
		  <li><a href="learn_4" target="_blank" class="iframe_link"><span>JDBC应用</span></a></li>
		  <li><a href="learn_5" target="_blank" class="iframe_link"><span>多线程</span></a></li>
		  <li><a href="learn_6" target="_blank" class="iframe_link"><span>JavaWeb介绍</span></a></li>
        </ul>
      </nav>
    </div>
  </div>
  <div class="main">
    <div class="main-content" style="height: 100%;">
      <iframe src="learn_1" class="iframe_mx uicss-cn"></iframe>
    </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/klorofil-common.js" ></script> 

</body>
</html>