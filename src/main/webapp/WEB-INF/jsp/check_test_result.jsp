<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩表</title>
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

    <div class="title">学生成绩表</div>
    
    <div class="content">
        <!--添加按钮及bootstrap的模态框-->
       
        <!--表格列表-->
        <table id="tb" class="table">
            <thead>
            <tr>
                <th>序号</th>
                <th>学生名</th>
                <th>试卷名</th>
                <th>试卷成绩</th>
                <th>用时</th>
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

$(document).ready(function(){
	/*
		给老师展示学生成绩前的ajax准备
	*/
	$.ajax({
    		url:"/show_result",
    		type:"get",
    		dataType:'json',
    		success:function(data){
    			$.each(data,function(index,item){
                    var tr;
                   	index++;
                   	if(item.useTime==null){
                        tr='<td>'+index+'</td>'+'<td>'+item.userName+'</td>'+'<td>'+item.paperName+'</td>'+'<td><font style="color:red">未作答</font></td>'+'<td><font style="color:red">未作答</font></td>';

                   	}else{
                        tr='<td>'+index+'</td>'+'<td>'+item.userName+'</td>'+'<td>'+item.paperName+'</td>'+'<td>'+item.result+'</td>'+'<td>'+item.useTime+'</td>';

                   	}
                    $("#tb").append('<tr>'+tr+'</tr>');
                })
					
    				$('#back_btn').click(function () {
        				$('#Ktext').val(' ');
        				methods.resectList();
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
			search: '按学生名检索:',  
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
				title: '学生成绩表'
			},
			{
				extend: 'pdfHtml5',
				title: '学生成绩表'
			},
			{
				extend: 'csvHtml5',
				title: '学生成绩表'
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

</script>
</html>