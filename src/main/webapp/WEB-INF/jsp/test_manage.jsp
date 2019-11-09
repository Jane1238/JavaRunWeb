<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单选题库</title>
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

    <div class="title"></div>
    
    <div class="content">
        <!--添加按钮及bootstrap的模态框-->
        <div class="export">
            <button id="new_add" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#renyuan">
                <img src="img/add_two.png">
                <span>添加试题</span>
            </button>
            
            <div class="modal fade" id="renyuan">
                <div class="modal-dialog modal-lg modal_position">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">添加试题</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                      		<table>
                      		<tr><td  valign="top">题目内容:</td><td  colspan="3"><textarea placeholder="请填写题目内容" style="overflow: visible;resize:none;width:600px;height:100px;" id="test"></textarea></td></tr>
                      		<tr><td><br></td></tr>
                      		<tr>
                      		<td  valign="top">A:</td><td><textarea placeholder="请填写选项A内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="a"></textarea></td>
                      		<td  valign="top">B:</td><td><textarea placeholder="请填写选项B内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="b"></textarea></td>
                      		</tr>
                      		<tr>
                      		<td  valign="top">C:</td><td><textarea placeholder="请填写选项C内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="c"></textarea></td>
                      		<td  valign="top">D:</td><td><textarea placeholder="请填写选项D内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="d"></textarea></td>
                      		</tr>
                      		<tr>
                      		<td  valign="top">题目答案:</td><td><input type="text" id="answer" placeholder="请填写题目答案(A/B/C/D)"style="width:100%"/></td>
                      		</tr>
                      		</table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" onclick="add_test()" type="button" class="btn btn-secondary">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="xiugai">
                <div class="modal-dialog modal-lg modal_position">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">修改试题</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                      		<table>
                      		<tr><td  valign="top">题目内容:</td><td  colspan="3"><textarea placeholder="请填写题目内容" style="overflow: visible;resize:none;width:600px;height:100px;" id="test1"></textarea></td></tr>
                      		<tr><td><input type="hidden" id="testId"></td></tr>
                      		<tr>
                      		<td  valign="top">A:</td><td><textarea placeholder="请填写选项A内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="a1"></textarea></td>
                      		<td  valign="top">B:</td><td><textarea placeholder="请填写选项B内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="b1"></textarea></td>
                      		</tr>
                      		<tr>
                      		<td  valign="top">C:</td><td><textarea placeholder="请填写选项C内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="c1"></textarea></td>
                      		<td  valign="top">D:</td><td><textarea placeholder="请填写选项D内容" style="overflow: visible;resize:none;width:300px;height:150px;" id="d1"></textarea></td>
                      		</tr>
                      		<tr>
                      		<td  valign="top">题目答案:</td><td><input type="text" id="answer1" placeholder="请填写题目答案(A/B/C/D)"style="width:100%"/></td>
                      		</tr>
                      		</table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" onclick="update_test()" type="button" class="btn btn-secondary">确定</button>
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
                <th>A</th>
                <th>B</th>
                <th>C</th>
                <th>D</th>
                <th>答案</th>
                <th>操作</th>
                <th>查看具体信息</th>
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
  查询所有客观题试题的ajax操作
 
 */
$(document).ready(function(){
	$.ajax({
    		url:"/select_test",
    		type:"get",
    		dataType:'json',
    		success:function(data){
    			$.each(data,function(index,item){
                    var tr;
                   	index++;
                    tr='<td>'+index+'</td>'+'<td>'+item.testTxt+'</td>'+'<td>'+item.a+'</td>'+'<td>'+item.b+'</td>'+'<td>'+item.c+'</td>'+'<td>'+item.d+'</td>'+'<td>'+item.answer+'</td>'+'<td><a href="#" class="xiugai" id="'+item.testId+'" data-toggle="modal" data-target="#xiugai">修改</a>/<a href="#" class="del" id="'+item.testId+'">删除</a></td><td><a href="#" class="toshow" id="'+item.testId+'">该题学生选择情况图表</a></td>';
                    $("#tb").append('<tr>'+tr+'</tr>');
                })
                /*
                	标题为试卷名的ajax操作
                */
					$.ajax({
						url:"/select_paperName",
			    		type:"get",
			    		dataType:'text',
			    		success:function(data){
			    			$(".title").append(data)
			    		}
			    		
						
					})
					/*
						弹窗点击返回的操作
					*/
					
    				$('#back_btn').click(function () {
        				$('#Ktext').val(' ');
        				methods.resectList();
    				})
    				/*
    					点击修改的ajax操作
    				*/
    				$('.xiugai').on('click',function(){
						var testId = $(this).attr("id");
						$("#testId").val(testId);
						$.ajax({
							url:"/sel_t",
							type:"get",
							data:{"testId":testId},
							dataType:'json',
							success:function(data){
								$("#test1").val(data.testTxt);
								$("#a1").val(data.a);
								$("#b1").val(data.b);
								$("#c1").val(data.c);
								$("#d1").val(data.d);
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
							var testId = $(this).attr("id");
							var data={"testId":testId};
							$.ajax({
								url:"/del_one_test",
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
							点击展示该题的abcd选择图表情况的ajax准备操作
						*/
					$('.toshow').on('click',function() {
						var testId = $(this).attr("id");
						$.ajax({
							url:"/show_ready",
							type:"get",
							data:{"testId":testId},
							dataType:'text',
							success:function(data){
									window.location.href = "show_abcd";
								
							}
							
						})
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
    }).DataTable( {
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
				title: '试题'
			},
			{
				extend: 'pdfHtml5',
				title: '试题'
			},
			{
				extend: 'csvHtml5',
				title: '试题'
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
function add_test(){
		var test = $("#test").val();
		var a= $("#a").val();
		var b = $("#b").val();
		var c= $("#c").val();
		var d= $("#d").val();
		var answer=$("#answer").val();
		if(test==""){
			alert("请输入题目内容");
			return false;
		}else if(a==""){
			alert("请输入选项A内容！");
			return false;
		}else if(b==""){
			alert("请输入选项B内容！");
			return false;
		}else if(c==""){
			alert("请输入选项C内容！");
			return false;
		}else if(d==""){
			alert("请输入选项D内容！");
			return false;
		}else if(answer==""){
			alert("请输入答案选项！");
			return false;
		}else{
			var data={"testTxt":test,"a":a,"b":b,"c":c,"d":d,"answer":answer};
			$.ajax({
				url:"/add_test",
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
function update_test(){
	var testId = $("#testId").val();
	var test = $("#test1").val();
	var a= $("#a1").val();
	var b = $("#b1").val();
	var c= $("#c1").val();
	var d= $("#d1").val();
	var answer=$("#answer1").val();
	if( test==""){
		alert("题目内容不能为空！");
		return false;
	}else if(a==""){
		alert("a选项不能为空！");
		return false;
	}else if(b==""){
		alert("b选项不能为空！");
		return false;
	}else if(c==""){
		alert("c选项不能为空！");
		return false;
	}else if(d==""){
		alert("d选项不能为空！");
		return false;
	}else if(answer== ""){
		alert("答案不能为空！");
		return false;
	}else{
		var data={"testTxt":test,"a":a,"b":b,"c":c,"d":d,"answer":answer,"testId":testId};
		$.ajax({
			url:"/update_test",
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