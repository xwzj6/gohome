<%@ page language="java" import="java.util.*,com.zufe.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'info_total.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <style type="text/css">
		.top_b1{
			text-align: center;
			font-size: 20px;
			box-shadow: 0 0 20px #03e9f4, 0 0 20px #03e9f4, 0 0 20px #03e9f4,
				0 0 20px #03e9f4;
		}
		.h{
			border: 2px;
			padding: 10px;
			border-radius: 10px;
		}
		span{
			color: #8688AD;
		}
		body{
			
		}
	</style>
</head>

<body>
	<%TotalInfo totalInfo=new TotalInfo();%>
	<div class="top_b1">
		<div class="h">志愿者总数 <span> <%=totalInfo.getTotalUser() %></span>  人</div>
		<div class="h">队伍总数	<span> <%=totalInfo.getTotalTeam() %></span>	队</div>
		<div class="h">进行中任务   <span> <%=totalInfo.getTotalLostNotFind() %></span> 件</div>
		<div class="h">已完成任务   <span> <%=totalInfo.getTotalLostHasFind() %></span> 件</div>
		<div class="h">任务出勤数   <span> <%=totalInfo.getTotalRecord() %></span>  人次</div>

	</div>
</body>
</html>
