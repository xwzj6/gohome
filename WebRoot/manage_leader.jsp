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
<style type="text/css">
.table {
	positon: relative;
	align:center;
}
#body{
	width:70%;
}
.table2{
	
}
.table3{
	float:left;
}
</style>
</head>

<body>
<%User user=(User)session.getAttribute("user"); %>
	<div>
		<iframe src="top.jsp" width="100%"  scrolling="no"
			frameborder="0"></iframe>
		<div class="">
			<div class="level1" id="left">
			</div>
			<div class="level1" align="center" id="body">
				<div class="table">
					<!-- 表格 -->
					<div>
						<jsp:useBean id="lostPage" class="com.zufe.bean.LostPage"></jsp:useBean>
						<!-- 为javabean对象属性指定每页显示的信息数量 -->
						<jsp:setProperty property="pageSize" value="25" name="lostPage" />
						<jsp:setProperty property="pageNo" param="pageNo" name="lostPage" />
							<%
								LostDao lostDao = new LostDao();
								PeopleDao peopleDao =new PeopleDao();
								ProvinceDao provinceDao=new ProvinceDao();
								List<LostTeam> ltList=new ArrayList<LostTeam>();
								LostTeamDao ltDao=new LostTeamDao();
								ltList=ltDao.getLostTeamByTeamId(user.getTeamId());
								if (ltList != null)
									for (LostTeam lt : ltList) {
										Lost l=new Lost(); 
										l=lostDao.getLostByLostId(lt.getLostId());
										People p=new People();
										p=peopleDao.getPeopleByPeopleId(l.getPeopleId());
							%>
							<div class="table2">
								<div class="table3">
									<div>记录ID</div>
									<div>失踪地址</div>
									<div>失踪描述</div>
									<div>报案人姓名</div>
									<div>报案人电话</div>
									<div>报案人关系</div>
									<div>报案人性别</div>
									<div>失踪日期</div>
									<div>失踪时间</div>
									<div>所属省份</div>
									<div>失踪者ID</div>
									<div>失踪者生日</div>
									<div>失踪者文化水平</div>
									<div>失踪者特征</div>
									<div>失踪者健康状况</div>
									<div>失踪者身高</div>
									<div>失踪者家乡</div>
									<div>失踪者姓名</div>
								</div>
								<div class="table3">
									<div><%=l.getLostId() %></div>
									<div><%=l.getLostAddr()%></div>
									<div><%=l.getLostDescription() %></div>
									<div><%=l.getRelativesName() %></div>
									<div><%=l.getRelativesPhone() %></div>
									<div><%=l.getRelativesRelationship() %></div>
								    <div><%=l.getRelativesSex() %></div>
									<div><%=l.getLostDate() %></div>
									<div><%=l.getLostTime() %></div>
									
									<div><%=provinceDao.getProvinceNameById(l.getProvinceId())  %></div>
									<div><%=p.getPeopleId() %></div>
									<div><%=p.getPeopleBirth() %></div>
									<div><%=p.getPeopleEducation() %></div>
									<div><%=p.getPeopleFigure() %></div>
									<div><%=p.getPeopleHealth()  %></div>
									<div><%=p.getPeopleHeight() %></div>
									<div><%=p.getPeopleHometown() %></div>
									<div><%=p.getPeopleName() %></div>
									
								</div>
								<table border="3" width="20%">
								<caption>接取该任务的队员</caption>
								<%
									List<Record> recordList=new ArrayList<Record>();
									RecordDao recordDao=new RecordDao();
									recordList=recordDao.getUserPageList(1, 100, l.getLostId());
									for(Record r:recordList){
								 %>
								 <div><%=r.getUser().getUserName() %></div>
								 <%} %>
								</table>
								
							</div>
							<%
								}
							%>
						
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

