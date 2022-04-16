<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'info_lost.jsp' starting page</title>

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
</style>
<link rel="stylesheet" type="text/css" href="css/body.css">
</head>

<body>
	<div>
		<iframe src="/gohome/top.jsp" width="100%" height="120" scrolling="no"
			frameborder="0"></iframe>
		<div>
			<div class="level1">
				<iframe src="/gohome/info/info_left.html" width="100%" height="100%"
					scrolling="no" frameborder="0"></iframe>
			</div>
			<div class="level1">
				<div class="">
					<iframe src="info/views/map_lost.jsp" width="100%" height="100%"
						scrolling="no" frameborder="0"></iframe>
				</div>
				<div class="info_d"></div>
			</div>
		</div>
	</div>
</body>
</html>
