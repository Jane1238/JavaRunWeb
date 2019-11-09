<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的代码</title>
<script src="js/jquery-1.8.2.js" type= "text/javascript"></script>
<link rel="stylesheet" href="css/table.css">
<style type="text/css">
.btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
.btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
.btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
.btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
.btn-primary.active { color: rgba(255, 255, 255, 0.75); }
.btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
.btn-block { width: 100%; display:block; }

* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }


body { 
	background-color: #14213D;
 	height: 100%;
  	width: 100%;
  	overflow-y:scroll;
 	font-family: 'Lato', sans-serif;
	}


</style>

</head>
<body>
	<h2>我的代码</h2>
<div class="table-wrapper">
    <table class="fl-table" role="grid" aria-describedby="example_info" id="tableTest">
        <thead>
        <tr>
            <th>序号</th>
            <th>代码名</th>
            <th>代码</th>
            <th>保存时间</th>
         	
        </tr>
        </thead>
        <tbody>
       
        <tbody>
    </table>
	
    <input type="button" onclick="location.href='toStudy1'" value ="返回到编译器" id="list" class="btn btn-primary btn-block btn-large"/>
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
 * 	展现给学生保存的代码的ajax操作
 */
 $(document).ready(function(){
    $.ajax({
        url:"/getCode",
        type:'get',
        dataType:'json',
        success:function(data){
            //方法中传入的参数data为后台获取的数据
            $.each(data,function(index,item){
                var tr;
               	index++;
                tr='<td>'+index+'</td>'+'<td>'+item.codeName+'</td>'+'<td><pre class="mScroll"><code class="lang-java">'
+item.codeTxt+'</pre></code></td>'+'<td>'+item.codeDate+'</td>';
                $("#tableTest").append('<tr>'+tr+'</tr>');
            })
    /*
    	表格加下载Excel、PDF、索引、翻页等功能
    */		
             $('#tableTest').on( 'processing.dt', function ( e, settings, processing ) {
         		$('#tableTest_filter').css( 'color', processing ? '#fff' : '#fff' );
        		$('#tableTest_filter').css( 'font-weight', processing ? 'bolder' : 'bolder' );
        		$('#tableTest_paginate span').css( 'color', processing ? '#fff' : '#fff');
        		$('input[type="search"]').css( 'background-color', processing ? '#17a2b8' : '#17a2b8' );
        		$('#tableTest_info').css( 'color', processing ? '#fff ' : '#fff ' );
        		$('#tableTest_previous').css( 'color', processing ? '#fff ' : '#fff ' );
        		$('#tableTest_previous').css( 'font-weight', processing ? 'bolder ' : 'bolder ' );
        		$('#tableTest_next').css( 'color', processing ? '#fff ' : '#fff ' );
        		$('#tableTest_next').css( 'font-weight', processing ? 'bolder' : 'bolder' );
            } ).DataTable( {
		dom: 'Bfrtip',
		language: {  
			emptyTable: '没有数据',  
			loadingRecords: '加载中...',  
			processing: '查询中...',  
			search: '按代码名检索:',  
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
</script>
</html>