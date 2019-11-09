<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客观题库管理</title>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<link rel="stylesheet" type="text/css" href="css/manager.css">

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bootbox.min.js"></script>
<style>
.gongju {
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
td {
text-align:center; /*设置水平居中*/
vertical-align:middle;/*设置垂直居中*/
}
</style>
</head>
<body>

<div class="box" class="btn btn-primary btn-sm" >

    <div class="title">客观题库管理</div>
    
    <div class="content">
        <!--添加按钮及bootstrap的模态框-->
        <div class="export">
            <button id="new_add" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#renyuan">
                <img src="img/add_two.png">
                <span>添加</span>
            </button>
            
            <div class="modal fade" id="renyuan">
                <div class="modal-dialog modal-lg modal_position">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">添加</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                      		<table>
                      		<tr><td>试卷名称:</td><td><input type="text" id="paperName" placeholder="请填写试卷名称"/></td></tr>
                      		
                      		</table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" onclick="add_paper()" type="button" class="btn btn-secondary">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!--表格列表-->
        <table id="tb" class="table">
            <thead>
            <tr>
                <th>试卷号</th>
                <th>试卷名</th>
                <th>试卷题数</th>
                <th>查看</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody >
           
            </tbody>
        </table>
    </div>
</div>
<script src="js/jquery.datatables.min.js"></script>
<script src="js/dataTables.buttons.min.js"></script>
<script src="js/jszip.min.js"></script>
<script src="js/buttons.html5.min.js"></script>
<script src="js/buttons.flash.min.js"></script>
<script src="js/pdfmake.min.js"></script>
<script src="js/vfs_fonts.js"></script>
<script src="js/buttons.print.min.js"></script>

</body>
<script>
/*
 * 查询遍历所有的试卷
 */
$(document).ready(function(){
	$.ajax({
    		url:"/select_testPaper",
    		type:"get",
    		dataType:'json',
    		success:function(data){
    			$.each(data,function(index,item){
                    var tr;
                   	index++;
                    tr='<td>'+index+'</td>'+'<td>'+item.paperName+'</td>'+'<td>'+item.testCount+'</td>'+'<td><a href="#" class="start" id="'+item.paperId+'">查看试卷</a></td><td><a href="#" class="del" id="'+item.paperId+'">删除试卷</a></td>';
                    $("#tb").append('<tr>'+tr+'</tr>');
                })
					/*
						点击弹窗中的返回操作
					*/
    				$('#back_btn').click(function () {
        				$('#Ktext').val(' ');
        				methods.resectList();
    				})
    				/*
    					点击查看试题的ajax操作
    				*/
    				$('.start').on('click',function() {
    					var paperId = $(this).attr("id");
    					var data={"paperId":paperId}
    					$.ajax({
							url:"/select_ready",
							type:"post",
							data:data,
							dataType:'text',
							success:function(data){
								if(data>0){
									window.location.href = "test_manage";
								}
								}
						})
					})
					/*
						点击删除试卷的ajax操作
					*/
    				$('.del').on('click',function() {
		                var c = confirm("确认删除吗?");
        				if(c){
							var paperId = $(this).attr("id");
							var data={"paperId":paperId};
							$.ajax({
								url:"/del_paper",
								type:"post",
								data:data,
								dataType:'text',
								success:function(data){
									if(data>0){
										alert("删除成功!");
										window.history.go(0);
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
		/*
			点击添加试卷的ajax操作
		*/
function add_paper(){
		var paperName = $("#paperName").val();
		if(paperName==""){
			alert("请输入试卷名称！");
			return false;
		}else{
			$.ajax({
				url:"/add_paper",
				data:{"paperName":paperName},
				dataType:'text',
				type:"post",
				success:function(data){
					if(data==1){
						alert("添加成功！");
						window.history.go(0);
					}
				}
			})
		}	
}


   
    				

</script>
</html>