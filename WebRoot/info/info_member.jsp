<%@ page language="java" import="java.util.*,com.zufe.dao.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'info_member.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<style type="text/css">
.level1 {
	float: left;
}



.info_d {
	float: left;
	width: 500px;
	height: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.top{
	position:fixed;
	width:100%;
	opacity:1;
}

#body{
	position:relative;
	top:120;
	left:240;
}
#left{
	position:fixed;
	top:120;
	height:100%;
}
iframe{
	float:left;
}
</style>



<link rel="stylesheet" type="text/css" href="css/body.css">
<script src="echarts-master/dist/echarts.min.js"></script>
</head>

<body>
	<div>
		<div class="top">
		<iframe src="top.jsp" width="100%" height="120" scrolling="no"
			frameborder="0"></iframe>
		</div>
		<div>
			<div></div>
			<div class="level1" id="left">
				<iframe src="info/info_left.html" width="100%" height="100%"
					scrolling="no" frameborder="0"></iframe>
			</div>
			
			<div class="level1"  id="body">
				<div class="">
					<iframe src="info/views/map_user.jsp" width="100%" height="100%"
						scrolling="no" frameborder="0"></iframe>
					<iframe src="info/views/pie_user.jsp" width="50%" height="100%"
						scrolling="no" frameborder="0"></iframe>
					<iframe src="info/views/radar_user.jsp" width="50%" height="100%"
						scrolling="no" frameborder="0"></iframe>
				</div>
				<div class="info_d">
					<div id="main" style="width: 600px;height:400px;"></div>
					<script type="text/javascript">
						// 基于准备好的dom，初始化echarts实例
						
						var myChart = echarts.init(document
								.getElementById('main'));
								/*
						
						*/
						// 指定图表的配置项和数据
						var option = {
							title : {
								text : '各省份人员统计'
							},
							tooltip : {},
							legend : {
								data : [ '销量' ]
							},
							xAxis : {
								data : [ "衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子" ]
							},
							yAxis : {},
							series : [ {
								name : '销量',
								type : 'bar',
								data : [ 5, 20, 36, 10, 10, 20 ]
							} ]
						};
						//option["xAxis"]["data"][6]="111";
						//option["series"][0]["data"][6]=6;
						
						<%
						ProvinceDao provinceDao=new ProvinceDao();
						 %>
						//document.write(option2["xAxis"]["data"]) ;
						
						 
						 
						 <%
						for(int i=1;i<35;i++){
						%>
							
							option["xAxis"]["data"][<%=i-1%>]="<%=provinceDao.getProvinceNameById(i) %>";
							option["series"][0]["data"][<%=i-1%>]=<%=provinceDao.getUserNumbyProvinceId(i) %>;
						
						<%
						}
						
						%>
						//document.write(option["xAxis"]["data"][0]) ;//可行语句
						// 使用刚指定的配置项和数据显示图表。
						myChart.setOption(option);
						
						
					</script>
				</div>
				<div class="info_d">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
