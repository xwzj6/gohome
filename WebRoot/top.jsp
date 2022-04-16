<%@ page language="java"
	import="java.util.*,com.zufe.bean.*,com.zufe.dao.*"
	pageEncoding="utf-8"%>
<!--header start-->
<header class="header fixed-top clearfix">

	<%
		User user = (User) session.getAttribute("user");
		if (user == null)
			response.sendRedirect("login.html");
	%>
	<!--logo start-->
	<div class="brand">

		<a href="index.jsp" class="logo"> 智能救援指挥系统 </a>
		<div class="sidebar-toggle-box">
			<div class="fa fa-bars"></div>
		</div>
	</div>
	<!--logo end-->

	<!-- 
                *****************************
                ** Start of top navigation **
                *****************************
             -->
	<div class="top-nav">


		<ul class="nav navbar-nav navbar-right">
			<li class="search-box"><input type="text"
				class="form-control search" placeholder=" Search">
			</li>
			<li role="presentation" class="dropdown"><a
				href="javascript:void(0);" class="dropdown-toggle info-number"
				data-toggle="dropdown" aria-expanded="false"> <span><img src="img/rank.png" style="width:30px;height:20px;"></span> <span
					class="badge bg-color label-danger"></span> </a>
				<ul id="menu"
					class="dropdown-menu list-unstyled msg_list animated fadeInUp"
					role="menu">
					<%
					{
						RecordDao recordDao=new RecordDao();
						List<User> userList=new ArrayList<User>();
						userList=recordDao.getNUser(10);
						int i=0;
		 %>
					<%for(User u:userList){  
		 i++;
		 %>
					<li><a class="hvr-bounce-to-right"> <span class="image">

								<img src="img/boy.png" alt="Profile Image" /> </span> <span> <span><h4>
										第<%=i %>名
									</h4>
							</span> <span><%=u.getUserName() %></span> <span class="time"><strong>任务次数
								</strong> <%=recordDao.getRecordCount(u.getUserId()) %></span> </span> <span
							class="message"> <strong>注册时间 </strong> <small><%=u.getUserRegistDate() %></small>
						</span> </a>
					</li>


					<%}} %>

					<li class='top-nav-li-see-all-alerts'>
						<div class="text-center">
							<a href="inbox.html"> <strong>See All Alerts</strong> <i
								class="fa fa-angle-right"></i> </a>
						</div>
					</li>
				</ul>
			</li>

			<li class="dropdown"><a href="javascript:void(0);"
				class="user-profile dropdown-toggle" data-toggle="dropdown"
				aria-expanded="false"> <img src="assets/images/profile.jpg"
					alt="image"><%=user.getUserName()%> <span
					class=" fa fa-angle-down"></span> </a>
				<ul
					class="dropdown-menu dropdown-usermenu animated fadeInUp pull-right">
					<li><a
						href="manage/user_info.jsp?userId=<%=user.getUserId()%>"
						class="hvr-bounce-to-right"> 个人信息</a>
					</li>
					<li><a href="video/video_player.jsp?videoId=5"
						class="hvr-bounce-to-right">帮助</a></li>
					<li><a href="LogoutServlet" class="hvr-bounce-to-right"><i
							class=" icon-login pull-right"></i>退出</a>
					</li>
				</ul>
			</li>

		</ul>

	</div>

	<!-- 
                *****************************
                *** End of top navigation ***
                *****************************
             -->

</header>
<!--header end-->

