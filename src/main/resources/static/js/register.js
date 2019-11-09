

function sub1() {
    var userName = $("#new_userName").val();
    var userPassword = $("#new_userPassword").val();
    var second_userPassword=$("#second_userPassword").val();
    var reg=/^[A-Za-z]+[0-9]+[A-Za-z0-9]*|[0-9]+[A-Za-z]+[A-Za-z0-9]*$/g;
    var power=1;
  	if(userName == ""){
  	 	alert("对不起,用户名不能为空!");
  	 	$("#new_userPassword").css('borderColor','');
  	 	$("#second_userPassword").css('borderColor','');
        $("#new_userName").css('borderColor','red'); 
        return false;
  	}else if(userPassword == ""){
  		alert("对不起,密码不能为空!");
  		 $("#new_userName").css('borderColor','');
  		$("#second_userPassword").css('borderColor','');
        $("#new_userPassword").css('borderColor','red');
        return false;
  	}else if(second_userPassword == ""){
  		alert("对不起,重复密码不能为空!");
  		 $("#new_userName").css('borderColor','');
  		$("#new_userPassword").css('borderColor','');
    	$("#second_userPassword").css('borderColor','red');
    	return false;
  	}else if(userPassword!=second_userPassword){
    	alert("两次密码输入不一致,请重新输入");
    	 $("#new_userName").css('borderColor',''); 
    	 $("#new_userPassword").css('borderColor','red');
    	$("#second_userPassword").css('borderColor','red');
    	return false;
    }else if(!reg.test(userPassword)){
    	alert("密码必须由6-16个英文字母和数字的字符串组成！");
    	 $("#new_userName").css('borderColor',''); 
    	$("#new_userPassword").css('borderColor','red');
    }else{
    //ajax去服务器端校验
    var data = {
        'userName': userName,
        'userPassword': userPassword,
        'power':power
    };

    $.ajax({
        type: "POST",
        url: "/register",
        data: data,
        dataType: 'text',
        success: function(msg) {
            if (msg == 1) {
                alert("注册成功");
                window.history.go(0);
            }  else {
                alert("用户名已存在，请更改用户名");
             	 $("#new_userName").css('borderColor','red'); 
            }
        }

    });
    }
    }