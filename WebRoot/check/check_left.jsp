<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'check_left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="../css/left.css">
  </head>
  
  <body>
    <div class="left_a">
	      <div class="left_b"><a  href="LostListSearchServlet?isCheck=0&pageNo=1&provinceId=0" target="#">未审核</a></div>
	      <div class="left_b"><a  href="LostListSearchServlet?isCheck=1&pageNo=1&provinceId=0" target="#">已审核</a></div>
	      <div class="left_b"><a  href="check/lost_distribution.jsp" target="#">分配任务</a></div>
	      <div class="left_b"><a  href="check/check_lost_create.jsp" target="#">创建记录</a></div>
	    </div>
  </body>
</html>
