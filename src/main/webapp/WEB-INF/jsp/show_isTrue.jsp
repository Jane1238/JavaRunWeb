<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>作对情况</title>
    <link rel="stylesheet" type="text/css" href="css/manager.css">
    <script src="js/jquery-1.8.2.js" type= "text/javascript"></script>
    <!-- 引入 echarts.js -->
    <script src="js/echarts.js"></script>
</head>
<body>
<div class="box" class="btn btn-primary btn-sm" >
  <div class="content">
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="draw" style="width: 100%;height:100%;"></div>
    </div>
    </div>
    <script type="text/javascript">
    /*
    	展示每个题的作对人数情况的条形图
    */
        // 基于准备好的dom，初始化echarts实例
        $(document).ready(function(){
        	$.ajax({
        		url:"/show_to_isTrue",
        		dataType:"json",
        		type:"get",
        		success:function(msg){
        			 var myChart = echarts.init(document.getElementById('draw'));
        			 let s =[];
        			 $.each(msg,function(index){
        				 index++;
        					 s.push("第"+index+"题");
        			 })
        				 var option = {
             		            title: {
             		                text: '该试卷的作对情况'
             		            },
             		            tooltip: {},
             		            legend: {
             		                data:['作对人数']
             		            },
             		            xAxis: {
             		                data: s
             		            },
             		            yAxis: {},
             		            series: [{
             		                name: '作对人数',
             		                type: 'bar',
             		                data: msg
             		            }]
             		        };
        			 
        		        // 指定图表的配置项和数据
        		        

        		        // 使用刚指定的配置项和数据显示图表。
        		        myChart.setOption(option);
        		}
        	})
        })
       
    </script>
    

</body>
</html>