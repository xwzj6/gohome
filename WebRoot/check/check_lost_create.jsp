<%@ page language="java" import="java.util.*,com.zufe.bean.*,com.zufe.dao.*"
	pageEncoding="utf-8"%>
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

<title>My JSP 'personal_info_change.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/body.css">
<style type="text/css">
.level1 {
	float: left;
}
</style>
</head>

<body>
	<div>
		<iframe src="top.jsp" width="100%"  scrolling="no"
			frameborder="0"></iframe>

		<div>
			<%
				User user = (User) session.getAttribute("user");
			%>
			<div class="level1">
				<iframe src="check/check_left.html" width="100%" height="100%"
					scrolling="no" frameborder="0"></iframe>
			</div>
			<div class="level1">
				<div class="person_info">

					<div class="resume_left">
						<div class="resume_title">
							<div style="float:left">创建失踪记录</div>
						</div>
						<div class="all_resume">
							<form action="../updateUserInfoServlet" method="post">
								<div class="table_style">
									<table width="300" border="0" cellpadding="3" cellspacing="1"
										bgcolor="">
										<tr>
											<th width="110" align="right" bgcolor="">队伍名：</th>
											<td bgcolor=""><input type="text"
												name="teamName" value=   >
											</td>
										</tr>
									</table>
									<div class="he"></div>
									<table width="300" border="0" cellpadding="3" cellspacing="1"
										bgcolor="">
										<tr>
											<th width="110" align="right" bgcolor="">所属省份：</th>
											<td bgcolor=""><select name="teamProvince">
												<% 
												ProvinceDao provinceDao=new ProvinceDao();
												for(int i=1;i<=34;i++){
													String name=provinceDao.getProvinceNameById(i);
												%>
													<option value=<%=name %> ><%=name %></option>
											<%} %>
											</select></td>
										</tr>
									</table>
									<div class="he"></div>
									
									
									<div style="margin-left:100px;">
										<input name="submit" type="submit" class="save1" value="创建">
										<input name="reset" type="reset" class="cancel2" value="取消">
									</div>
								</div>
							</form>
							<div class="clear"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
</body>
</html>
