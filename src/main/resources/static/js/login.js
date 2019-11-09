function sub() {
    var userName = $("#userName").val();
    var userPassword = $("#userPassword").val();
    if (userName == "") {
        alert("请输入用户名");
        return false;
    } else if (userPassword == "") {
        alert("请输入密码");
        return false;
    }
    
	var teacher = $("#teacher").is(":checked");
	var power ="";
	if(teacher){
		power=2;
	}else{
		power=1;
	}
	//ajax去服务器端校验
    var data = {
        userName: userName,
        userPassword: userPassword,
        power:power
    };
    $.ajax({
        type: "POST",
        url: "/login",
        data: data,
        dataType: 'text',
        success: function(msg) {
            if (msg == 3) {	
                window.location.href = "menu";
            } else if (msg == 1) {
                alert("不存在此用户请重试");
                return false;
            } else if(msg==4){
                window.location.href = "tea_menu";
            }else{
            	alert("密码不匹配请重试！");
            	return false;
            }
        }

    });
}