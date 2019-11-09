<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆/注册</title>
 <link rel="stylesheet" href="css/normalize.min.css">
 <link rel="stylesheet" href="css/style2.css">

<style type="text/css">

body { 
	background-color: #14213D;
 	height: 100%;
  	width: 100%;
 	font-family: 'Lato', sans-serif;
	}
input, textarea {
  font-size: 22px;
  display: block;
  width: 100%;
  height: 100%;
  padding: 5px 10px;
  background: none;
  background-image: none;
  border: 1px solid #a0b3b0;
  color: #ffffff;
  border-radius: 0;
  -webkit-transition: border-color .25s ease, box-shadow .25s ease;
  transition: border-color .25s ease, box-shadow .25s ease;
}

</style>


</head>
<body>
	<div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>注册</h1>
          
          <form action="${pageContext.request.contextPath}/register" method="post">
          
            <div class="field-wrap">
              <label>
                	用户名<span class="req">*</span>
              </label>
              <input type="text" id="new_userName" name="new_userName" required autocomplete="off" />
            	
            </div>
        
          <div class="field-wrap">
            <label>
              		   密码<span class="req">*</span>
            </label>
            <input type="password" id="new_userPassword" name="new_userPassword" required autocomplete="off"/>
          
          </div>
          
          <div class="field-wrap">
            <label>
                	确认密码<span class="req">*</span>
            </label>
            <input type="password" id="second_userPassword" name="second_userPassword"   required autocomplete="off"/>
          
          </div>
         	
          <input type="button" onclick="sub1()" value="提交" class="button button-block"/>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>登录</h1>
          
          <form action="">
          
            <div class="field-wrap">
            <label>
              	用户名<span class="req">*</span>
            </label>
            <input type="text" id="userName" name="userName" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              	密码<span class="req">*</span>
            </label>
            <input type="password" id="userPassword" name="userPassword" required autocomplete="off"/>
          </div>
       
        	<input type="checkbox" id="teacher" style="width:20px;height:20px;"/><font style="color:#fff;font-size: 15px;">我是老师</font>
        	
         <input type="button" onclick="sub()" value="登录" class="button button-block" />
          </form>
		
        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='js/jquery.min.js'></script>

 <script  src="js/index.js"></script>


<script type= "text/javascript" src="js/login.js"></script>
<script type= "text/javascript" src="js/register.js"></script>
</body>

</html>