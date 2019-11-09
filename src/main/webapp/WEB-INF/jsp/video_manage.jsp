<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频课程管理</title>
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

    <div class="title">视频课程管理</div>
    
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
                         <form id="upload-form" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                          
                      		<table>
                      		<tr><td>视频名称:</td><td><input type="text" id="videoName" name="videoName"  placeholder="请填写视频名称" style="width:250px"/></td></tr>
                      		<tr><td><br></td></tr>
                      		<tr><td>视频时长:</td><td><input type="text" id="videoTime" name="videoTime" placeholder="请填写视频时长(例:10分20秒)" style="width:250px"/></td></tr>
                      		<tr><td><br></td></tr>
                      		<tr><td>视频文件:</td><td><input type="file" id="videoFile" name="myfile" ></td></tr>
                      		</table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" onclick="add_video()" type="button" class="btn btn-secondary">确定</button>
                        </div>
                        </form>
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
                         <form id="upload-form1" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                      		<table>
                      		<tr><td>视频名称:</td><td><input type="text" id="videoName1"  name="videoName1"  placeholder="请填写视频名称"/></td></tr>
                      		<tr><td><input type="hidden" id="videoId" name="videoId"></td></tr>
                      		<tr><td>视频时长:</td><td><input type="text" id="videoTime1"  name="videoTime1" placeholder="请填写视频时长(例:10分20秒)"/></td></tr>
                      		<tr><td><br></td></tr>
                      		<tr><td >视频文件:</td><td><input type="file" id="videoFile1" name="myfile1"></td></tr>
                      		</table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" onclick="update_video()" type="button" class="btn btn-secondary">确定</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--表格列表-->
        <table id="tb" class="table">
            <thead>
            <tr>
                <th>视频课程号</th>
                <th>视频名称</th>
                <th>视频时长</th>
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
 * 查询所有视频的ajax操作
 */
$(document).ready(function(){
	$.ajax({
    		url:"/select_video",
    		type:"get",
    		dataType:'json',
    		success:function(data){
    			  $.each(data,function(index,item){
    			  	var tr;
    			  	index++;
    			  	 tr='<td>'+index+'</td>'+'<td>'+item.videoName+'</td>'+'<td>'+item.videoTime+'</td>'+'<td><a href="#" class="xiugai" id="'+item.videoId+'" data-toggle="modal" data-target="#xiugai">修改</a>/<a href="#" class="del" id="'+item.videoId+'">删除</a></td>';
    	            
                	$("#tb").append("<tr>"+tr+"</tr>");
  					});
					
    				$('#back_btn').click(function () {
        				$('#Ktext').val(' ');
        				methods.resectList();
    				});
    				/*
    					修改视频的操作
    				*/
					$('.xiugai').on('click',function(){
						var videoId = $(this).attr("id");
						$("#videoId").val(videoId);
						$.ajax({
							url:"/sel_video",
							type:"get",
							data:{"videoId":videoId},
							dataType:'json',
							success:function(data){
								$("#videoName1").val(data.videoName);
								$("#videoTime1").val(data.videoTime);
							}
							
						})
						
						
					})
					/*
						删除视频的ajax操作
					*/
    				$('.del').on('click',function() {
    					var c = confirm("确认删除吗?")
        				if(c){
							var videoId = $(this).attr("id");
							var data={"videoId":videoId}
							$.ajax({
								url:"/del_video",
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
 * 添加视频的操作
 */
function add_video(){
		var videoName = $("#videoName").val();
		var videoTime = $("#videoTime").val();
		var videoFile = $("#videoFile").val;
		var formData = new FormData($("#upload-form")[0]);
		
		// videoFile.append('videoName', videoName);
		// videoFile.append('videoTime', videoTime);
		if(videoName==""){
			alert("请输入视频名称！");
			return false;
		}else if(videoTime==""){
			alert("请输入视频时长内容！");
			return false;
		}else if(videoFile==""){
			alert("请选择文件！");
			return false;
		}else{
			//var data={"videoName":videoName,"videoTime":videoTime,"formData":formData};
			$.ajax({
				url:"/add_video",
				data:formData,
				dataType:'text',
				type:"post",
				processData:false,
				contentType:false,
				success:function(data){
					if(data==1){
						alert("添加成功！");
						window.history.go(0);
					}
				}
			})
		}	
}
/*
 * 修改视频的操作
 */
function update_video(){
	var videoName = $("#videoName1").val();
	var videoTime = $("#videoTime1").val();
	var videoFile = $("#videoFile1").val;
	var formData = new FormData($("#upload-form1")[0]);
	
	// videoFile.append('videoName', videoName);
	// videoFile.append('videoTime', videoTime);
	if(videoName==""){
		alert("请输入视频名称！");
		return false;
	}else if(videoTime==""){
		alert("请输入视频时长内容！");
		return false;
	}else if(videoFile==""){
		alert("请选择文件！");
		return false;
	}else{
		//var data={"videoName":videoName,"videoTime":videoTime,"formData":formData};
		$.ajax({
			url:"/update_video",
			data:formData,
			dataType:'text',
			type:"post",
			processData:false,
			contentType:false,
			success:function(data){
				if(data==1){
					alert("修改成功！");
					window.history.go(0);
				}
			}
		})
	}	
}

   
    				

</script>
</html>