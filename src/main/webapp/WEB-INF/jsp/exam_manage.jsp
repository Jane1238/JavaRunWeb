<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编程题库管理</title>
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

</style>
</head>
<body>

<div class="box" class="btn btn-primary btn-sm" >

    <div class="title">编程题库管理</div>
    
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
                      		<tr><td  >题目名称:</td><td><input type="text" id="q_name" placeholder="请填写题目名称"/></td></tr>
                      		<tr><td><br></td></tr>
                      		<tr><td  valign="top">题目内容:</td><td><textarea placeholder="请填写题目内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="question"></textarea></td></tr>
                      		<tr><td  valign="top">题目答案:</td><td><textarea placeholder="请填写题目答案" style="overflow: visible;resize:none;width:300px;height:150px;" id="answer"></textarea></td></tr>
                      		</table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" onclick="add_exam()" type="button" class="btn btn-secondary">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="modal fade" id="xiugai">
                <div class="modal-dialog modal-lg modal_position">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">修改</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                      		<table>
                      		<tr><td  >题目名称:</td><td><input type="text" id="q_name1" /></td></tr>
                      		<tr><td><input type="hidden" id="q_id"></td></tr>
                      		<tr><td  valign="top">题目内容:</td><td><textarea style="overflow: visible;resize:none;width:300px;height:150px;" id="question1"></textarea></td></tr>
                      		<tr><td  valign="top">题目答案:</td><td><textarea style="overflow: visible;resize:none;width:300px;height:150px;" id="answer1"></textarea></td></tr>
                      		</table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" onclick="update_exam()" type="button" class="btn btn-secondary">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--表格列表-->
        <table id="tb" class="table">
            <thead>
            <tr>
                <th>题号</th>
                <th>题目</th>
                <th>内容</th>
                <th>答案</th>
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
 * 查询遍历所有的编程练习题的ajax操作
 */
$(document).ready(function(){
	$.ajax({
    		url:"/select_exam",
    		type:"get",
    		dataType:'json',
    		success:function(data){
    			  $.each(data,function(index,item){
    			  	var tr;
    			  	index++;
                	tr='<td>'+index+'</td>'+'<td>'+item.q_name+'</td>'+'<td>'+item.question+'</td>'+'<td  ><pre class="mScroll"><code class="lang-java">'
+item.answer+'</pre></code></td>'+'<td><a href="#" class="xiugai" id="'+item.q_id+'"data-toggle="modal" data-target="#xiugai">修改</a>/<a href="#" id="'+item.q_id+'"class="del">删除</a></td>';
                	$("#tb").append("<tr>"+tr+"</tr>");
  					});
					
    				$('#back_btn').click(function () {
        				$('#Ktext').val(' ');
        				methods.resectList();
    				});
    				/*
    					点击修改的ajax操作
    				*/
					$('.xiugai').on('click',function(){
						var q_id = $(this).attr("id");
						$("#q_id").val(q_id);
						$.ajax({
							url:"/sel_q",
							type:"get",
							data:{"q_id":q_id},
							dataType:'json',
							success:function(data){
								$("#q_name1").val(data.q_name);
								$("#question1").val(data.question);
								$("#answer1").val(data.answer);
							}
							
						})
						
						
					})
					/*
						点击删除的ajax操作
					*/
    				$('.del').on('click',function() {
    					var c = confirm("确认删除吗?")
        				if(c){
							var q_id = $(this).attr("id");
							var data={"q_id":q_id}
							$.ajax({
								url:"/del_exam",
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
						
						
    	 /*
    	表格加下载Excel、PDF、索引、翻页等功能
    */				
    $('#tb').on( 'processing.dt', function ( e, settings, processing ) {
		$('#tb_filter').css( 'color', processing ? '#337ab7' : '#337ab7' );
		$('#tb_filter').css( 'font-weight', processing ? 'bolder' : 'bolder' );
		$('input[type="search"]').css( 'background-color', processing ? '#17a2b8' : '#17a2b8' );
		$('#tb_previous').css( 'font-weight', processing ? 'bolder ' : 'bolder ' );
		$('#tb_next').css( 'font-weight', processing ? 'bolder' : 'bolder' );
    } ).DataTable( {
		dom: 'Bfrtip',
		language: {  
			emptyTable: '没有数据',  
			loadingRecords: '加载中...',  
			processing: '查询中...',  
			search: '按题目检索:',  
			lengthMenu: '每页 _MENU_ 件',  
			zeroRecords: '没有数据',  
			paginate: {  
				'first':      '第一页',  
				'last':       '最后一页',  
				'next':       '下一页',  
				'previous':   '上一页'  
			},  
			info: '第 _PAGE_ 页 / 总 _PAGES_ 页',  
			infoEmpty: '没有数据',  
			infoFiltered: '(过滤总件数 _MAX_ 条)',
		},
		buttons: [
			{
				extend: 'copyHtml5',
			},
			{
				extend: 'excelHtml5',
				title: 'Data export'
			},
			{
				extend: 'pdfHtml5',
				title: 'Data export'
			},
			{
				extend: 'csvHtml5',
				title: 'Data export'
			},
			{
				extend:'print',
			}
		]
	} );
	$(".buttons-copy").text('复制');
	$(".buttons-copy").attr('class','btn btn-primary btn-large');
	$(".buttons-excel").text('导出到excel');
	$(".buttons-excel").attr('class','btn btn-primary btn-large');
	$(".buttons-pdf").text('导出到pdf');
	$(".buttons-pdf").attr('class','btn btn-primary btn-large');
	$(".buttons-csv").text('导出到csv');
	$(".buttons-csv").attr('class','btn btn-primary btn-large');
	$(".buttons-print").text('打印');
	$(".buttons-print").attr('class','btn btn-primary btn-large');
    		}
  			})
  			
    	})
		/*
			点击添加的ajax操作
		*/
function add_exam(){
		var q_name = $("#q_name").val();
		var question = $("#question").val();
		var answer = $("#answer").val();
		if(q_name==""){
			alert("请输入题目名称！");
			return false;
		}else if(question==""){
			alert("请输入题目内容！");
			return false;
		}else if(answer==""){
			alert("请输入题目答案！");
			return false;
		}else{
			var data={"q_name":q_name,"question":question,"answer":answer};
			$.ajax({
				url:"/add_exam",
				data:data,
				async : false,
				global : false,
				dataType:'text',
				type:"post",
				success:function(data){
					if(data>0){
						alert("添加成功");
						window.history.go(0);
					}
				}
			})
		}	
}
/*
 * 点击修改的ajax操作
 */
function update_exam(){
	var q_name = $("#q_name1").val();
	var question = $("#question1").val();
	var answer = $("#answer1").val();
	var q_id = $("#q_id").val();
	if(q_name==""){
		alert("题目名称不能为空！");
		return false;
	}else if(question==""){
		alert("题目内容不能为空！");
		return false;
	}else if(answer==""){
		alert("题目答案不能为空！");
		return false;
	}else{
		var data={"q_name":q_name,"question":question,"answer":answer,"q_id":q_id};
		$.ajax({
			url:"/update_exam",
			data:data,
			async : false,
			global : false,
			dataType:'text',
			type:"post",
			success:function(data){
				if(data>0){
					alert("修改成功！");
					window.history.go(0);
				}
			}
		})
	}	 
	
}

   
    				

</script>
</html>