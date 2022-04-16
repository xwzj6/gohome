<%@ page language="java"
	import="java.util.*,com.zufe.bean.*,com.zufe.dao.*"
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

<title>My JSP 'manage_1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/body.css">
<link rel="stylesheet" type="text/css" href="css/table.css">
<style type="text/css">
.table {
	positon: relative;
	align: center;
}

#body {
	width: 70%;
}
</style>



</head>

<body>
	<div>
		<iframe src="top.jsp" width="100%" scrolling="no" frameborder="0"></iframe>
		<div class="">
			<div class="level1" id="left">
				<iframe src="check/check_left.html" width="100%" height="100%"
					scrolling="no" frameborder="0"></iframe>
			</div>
			<div class="level1" align="center" id="body">
				<div class="table">
					<!-- 表格 -->
					<div>
						<jsp:useBean id="lostPage" class="com.zufe.bean.LostPage"></jsp:useBean>
						<!-- 为javabean对象属性指定每页显示的信息数量 -->
						<jsp:setProperty property="pageSize" value="25" name="lostPage" />
						<jsp:setProperty property="pageNo" param="pageNo" name="lostPage" />
						<table id="box-table-a" summary="Employee Pay Sheet">
							<caption>等待审核列表</caption>
							<thead>
							<tr>
								<th>记录ID</th>
								<th>失踪地址</th>
								<th>失踪描述</th>
								<th>报案人姓名</th>
								<th>报案人电话</th>
								<th>报案人关系</th>
								<th>报案人性别</th>
								<th>失踪日期</th>
								<th>失踪时间</th>
								<th>所属省份</th>
								<th>失踪者ID</th>
								<th>失踪者生日</th>
								<th>失踪者文化水平</th>
								<th>失踪者特征</th>
								<th>失踪者健康状况</th>
								<th>失踪者升高</th>
								<th>失踪者家乡</th>
								<th>失踪者姓名</th>
								<th>失踪者性别</th>
								<th>操作</th>
								<th>当前队伍</th>
							</tr>
							</thead>
							<%
								LostDao lostDao = new LostDao();
								List<Lost> list = new ArrayList<Lost>();
								PeopleDao peopleDao = new PeopleDao();
								ProvinceDao provinceDao = new ProvinceDao();
								list = lostPage.getPageDataWaitCheck();
								if (list != null)
									for (Lost l : list) {
										People p = new People();
										p = peopleDao.getPeopleByPeopleId(l.getPeopleId());
										l=lostDao.toShowType(l);
										p=peopleDao.toShowType(p);
							%>
								<tbody>
							<tr>

								<td><%=l.getLostId()%></td>
								<td><%=l.getLostAddr()%></td>
								<td><%=l.getLostDescription()%></td>
								<td><%=l.getRelativesName()%></td>
								<td><%=l.getRelativesPhone()%></td>
								<td><%=l.getRelativesRelationship()%></td>
								<td><%=l.getRelativesSex()%></td>
								<td><%=l.getLostDate()%></td>
								<td><%=l.getLostTime()%></td>

								<td><%=provinceDao.getProvinceNameById(l.getProvinceId())%></td>
								<td><%=p.getPeopleId()%></td>
								<td><%=p.getPeopleBirth()%></td>
								<td><%=p.getPeopleEducation()%></td>
								<td><%=p.getPeopleFigure()%></td>
								<td><%=p.getPeopleHealth()%></td>
								<td><%=p.getPeopleHeight()%></td>
								<td><%=p.getPeopleHometown()%></td>
								<td><%=p.getPeopleName()%></td>
								<td><%=p.getPeopleSex()%></td>
								<td>
									<form action="LostToTeamServlet?lostId=<%=l.getLostId() %>" method="post">
									<div class="login_l">
		
									<select name="teamId">
									<%
										Team team=new Team();
										TeamDao teamDao = new TeamDao();
										LostTeamDao ltDao=new LostTeamDao();
										List<Team> teamList = teamDao.getTeamList();
										LostTeam lt=new LostTeam();
										lt=ltDao.getLostTeamByLostId(l.getLostId());
									 %>
										<%
											for (Team t : teamList) {
										%>
										<option value=<%=t.getTeamId()%>><%=t.getTeamName() %></option>
										<%
											}
										%>
										</select>
									<input name="submit" class="login_box" required type="submit" value="分配">
									</div>
								</form>
								</td>
								<%
										if(lt!=null){
											team=teamDao.getTeamByTeamId(lt.getTeamId()); %>
								<td><%=team.getTeamName() %></td>
								<%}else{ %>
									<td>未分配</td>
								<%} %>
							</tr>

							<%
								}
							%>
</tbody>
						</table>
					</div>
					<!-- 页数信息 -->
					<div align="center">
						<a href="check/check_wait_list.jsp?pageNo=1">首页</a>&nbsp;
						<%
							if (lostPage.isHasPreviousPage()) {
						%>
						<a
							href="check/check_wait_list.jsp?pageNo=<%=lostPage.getPageNo() - 1%>">上一页</a>&nbsp;
						<%
							}
						%>
						<%
							if (lostPage.isHasNextPage()) {
						%>
						<a
							href="check/check_wait_list.jsp?pageNo=<%=lostPage.getPageNo() + 1%>">下一页</a>&nbsp;
						<%
							}
						%>
						<a
							href="check/check_wait_list.jsp?pageNo=<%=lostPage.getTotalPages()%>">尾页</a>&nbsp;
						当前是第<jsp:getProperty property="pageNo" name="lostPage" />页，总共<jsp:getProperty
							property="totalPages" name="lostPage" />页
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

