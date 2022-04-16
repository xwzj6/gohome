<%@ page language="java"
	import="java.util.*,com.zufe.dao.*,com.zufe.bean.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="description" content="">
<meta name="keywords"
	content="thema bootstrap template, thema admin, bootstrap, admin template, bootstrap admin">

<meta name="author" content="LanceCoder">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="shortcut icon" href="">
<title>Thema Admin Boostrap Template</title>



<link href="assets/css/global-plugins.css" rel="stylesheet">
    <link href="assets/vendors/jquery-icheck/skins/all.css" rel="stylesheet" />
    

    <!--For this page uses this css plugin only-->
    <link href="assets/css/table-responsive.css" rel="stylesheet"/>
    <link href="assets/vendors/datatable/bootstrap/dataTables.bootstrap.css" rel="stylesheet">
    <link href="assets/vendors/rwd-table/css/rwd-table.min.css?v=5.0.3" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet"/>
    <link href="assets/css/class-helpers.css" rel="stylesheet"/>

    <!--Color schemes-->
    <link href="assets/css/colors/green.css" rel="stylesheet">
    <link href="assets/css/colors/turquoise.css" rel="stylesheet">
    <link href="assets/css/colors/blue.css" rel="stylesheet">
    <link href="assets/css/colors/amethyst.css" rel="stylesheet">
    <link href="assets/css/colors/cloud.css" rel="stylesheet">
    <link href="assets/css/colors/sun-flower.css" rel="stylesheet">
    <link href="assets/css/colors/carrot.css" rel="stylesheet">
    <link href="assets/css/colors/alizarin.css" rel="stylesheet">
    <link href="assets/css/colors/concrete.css" rel="stylesheet">
    <link href="assets/css/colors/wet-asphalt.css" rel="stylesheet">

    <!--Fonts-->
    <link href="assets/fonts/Indie-Flower/indie-flower.css" rel="stylesheet" />
    <link href="assets/fonts/Open-Sans/open-sans.css?family=Open+Sans:300,400,700" rel="stylesheet" />

    
</head>





<body id="default-scheme">

    <!--======== Start Style Switcher ========-->    
    <i class="style-switcher-btn fa fa-cogs hidden-xs"></i>
    <div class="style-switcher">
        <div class="style-swticher-header">
            <div class="style-switcher-heading fg-white">Color Switcher</div>            
            <div class="theme-close"><i class="icon-close"></i></div>
        </div>

        <div class="style-swticher-body">
            <ul class="list-unstyled">
                <li class="theme-default theme-active" data-style="default"></li>
                <li class="theme-turquoise" data-style="turquoise"></li>
                <li class="theme-blue" data-style="blue"></li>
                <li class="theme-amethyst" data-style="amethyst"></li>
                <li class="theme-cloud" data-style="cloud"></li>
                <li class="theme-sun-flower" data-style="sun-flower"></li>
                <li class="theme-carrot" data-style="carrot"></li>
                <li class="theme-alizarin" data-style="alizarin"></li>
                <li class="theme-concrete" data-style="concrete"></li>
                <li class="theme-wet-ashphalt" data-style="wet-ashphalt"></li>
            </ul>         
        </div>
    </div><!--/style-switcher-->
    <!--======== End Style Switcher ========-->
    <section id="container">

       <%@ include file="../top.jsp"%>

	<!--sidebar start-->
<aside>
	<div id="sidebar" class="nav-collapse md-box-shadowed">
		<!-- sidebar menu start-->
		<div class="leftside-navigation leftside-navigation-scroll">
			<ul class="sidebar-menu" id="nav-accordion">
				<li class="sidebar-profile">

					<div class="profile-options-container">
						<p class="text-right profile-options">
							<span class="profile-options-close pe-7s-close fa-2x font-bold"></span>
						</p>

						<div class="profile-options-list animated zoomIn">
							<p>
								<a href="manage/user_info.jsp?userId=<%=user.getUserId()%>">个人信息</a>
							</p>
							<p>
								<a   href="video/video_player.jsp?videoId=5">帮助</a>
							</p>
							<p>
								<a  href="LogoutServlet" >退出</a>
							</p>
							
						</div>

					</div>

					<div class="profile-main">
						<p class="text-right profile-options">
							<i class="profile-options-open icon-options-vertical fa-2x"></i>
						</p>
						<p class="image">
							<img alt="image" src="img/boy.png" width="80"> <span
								class="status"><i class="fa fa-circle text-success"></i>
							</span>
						</p>
						<p>
							<span class="name"><%=user.getUserName()%></span><br> <span
								class="position" style="font-family: monospace;"><%=user.getUserState()%></span>
						</p>
					</div>
				</li>
				<li class=' '><a href="#"
					class="hvr-bounce-to-right-sidebar-parent active"><span
						class='icon-sidebar icon-home fa-2x'></span><span>收起</span> </a>
				</li>
				<li class='sub-menu '><a href="1"
					class="hvr-bounce-to-right-sidebar-parent"><span
						class='icon-sidebar pe-7s-portfolio fa-2x'></span><span>个人中心<span class="badge label-info"></span></span> </a>
					<ul class='sub'>
						<li><a href="manage/user_info.jsp?userId=<%=user.getUserId()%>">详细信息<span class="badge label-info"></span></a>
						</li>
						<li><a href='personal/info_change.jsp'>信息修改</a>
						</li>
					</ul>
				</li>
				
				<% if(user.getUserState().equals("超级管理员")||user.getUserState().equals("超级管理员")) { %>
				<li class='sub-menu '><a href="1"
					class="hvr-bounce-to-right-sidebar-parent"><span
						class='icon-sidebar icon-screen-desktop fa-2x'></span><span>成员管理</span>
				</a>
					<ul class='sub'>
						<li><a href='manage/team_list.jsp' class="active" >队伍列表</a>
						</li>
						<li><a href='manage/user_list.jsp'>成员列表</a>
						</li>
					</ul>
				</li>
				<li class='sub-menu '><a href="1"
					class="hvr-bounce-to-right-sidebar-parent"><span
						class='icon-sidebar pe-7s-portfolio fa-2x'></span><span>任务管理<span class="badge label-info"></span></span> </a>
					<ul class='sub'>
						<li><a href='check/wait_list.jsp'>待审核<span class="badge label-info"></span></a>
						</li>
						<li><a href='check/have_list.jsp'>已审核</a>
						</li>
						<li><a href='check/admin_distribution.jsp'>任务分配</a>
						</li>
					</ul>
				</li>
				<%}else if(user.getUserState().equals("队长")){ %>
				<li class='sub-menu '><a href="1"
					class="hvr-bounce-to-right-sidebar-parent"><span
						class='icon-sidebar icon-screen-desktop fa-2x'></span><span>队长操作</span>
				</a>
					<ul class='sub'>
						<li><a href='manage/team_info.jsp?id=<%=user.getTeamId() %>' class="active" >成员列表</a>
						</li>
						<li><a href='check/leader_distribution.jsp'>任务分配</a>
						</li>
					</ul>
				</li>
				<%} %>
				<li class='sub-menu '><a href="1"
					class="hvr-bounce-to-right-sidebar-parent"><span><img src="img/info.png" style="width:20px;height:15px;"></span><span>详细信息<span class="badge label-info"></span></span> </a>
					<ul class='sub'>
						<li><a href='user_rank.jsp'>光荣榜</a>
						</li>
						<li><a href='video/video_list.jsp'>教学视频</a>
						</li>
					</ul>
				</li>
				<li class='sub-menu '><a href="https://cli.im/"
					class="hvr-bounce-to-right-sidebar-parent"><span><img src="img/conn.png" style="width:20px;height:15px;"></span><span>草料二维码<span class="badge label-info"></span></span> </a>
				</li>
			</ul>
		</div>
		<!-- sidebar menu end-->
	</div>
</aside>
<!--sidebar end-->


        <!--main content start-->
        <section id="main-content">

                
            <section class="wrapper">
                    
                <!--======== Grid Menu Start ========-->
                <div id="grid-menu">
                    <div class="color-overlay grid-menu-overlay">
                        <div class="grid-icon-wrap grid-icon-effect-8">
                            <a href="#" class="grid-icon icon-envelope font-size-50 turquoise"></a>
                            <a href="#" class="grid-icon icon-user font-size-50 teal"></a>
                            <a href="#" class="grid-icon icon-support font-size-50 peter-river"></a>
                            <a href="#" class="grid-icon icon-settings font-size-50 light-blue"></a>
                            <a href="#" class="grid-icon icon-picture font-size-50 orange"></a>
                            <a href="#" class="grid-icon icon-camrecorder font-size-50 light-orange"></a>
                        </div>
                    </div>
                </div>                
                <!--======== Grid Menu End ========-->

                <!--======== Page Title and Breadcrumbs Start ========-->
                <div class="top-page-header">
                    
                    <div class="page-title">
			<h2>归家行动</h2>
			<small>五个哈哈团队</small>
		</div>
                    <div class="page-breadcrumb">
                        <nav class="c_breadcrumbs">
                            <ul>
                                <li><a href="#">成员管理</a></li>
                                <li><a href="#">队伍列表</a></li>
                                <li class="active"><a href="#">队伍信息</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="right-menu pull-right">

                    </div>

                    <div class="pull-right toggle-right-sidebar">
                        <span class="fa fa-outdent fa-2x title-open-right-sidebar"></span>
                    </div>

                </div>
                <!--======== Page Title and Breadcrumbs End ========-->
						<jsp:useBean id="userPage" class="com.zufe.bean.UserPage"></jsp:useBean>
						<!-- 为javabean对象属性指定每页显示的信息数量 -->
						<jsp:setProperty property="pageSize" value="25" name="userPage" />
						<jsp:setProperty property="pageNo" param="pageNo" name="userPage" />
                <!--======== Table Content Start ========-->
                
                <%
							int teamId=Integer.valueOf(request.getParameter("id"));
								TeamDao teamDao=new TeamDao();
								List<User> list = new ArrayList<User>();
								list = userPage.getPageDataByTeamId(teamId);
								userPage.getTotalPagesByTeamId(teamId);
								UserDao userDao=new UserDao();
				%>
                <div class="row">

                    <div class="col-md-12">

                        <div class="c_panel">

                            <div class="c_title">
                                <h2>队伍信息</h2>
                                <!-- 页数信息 -->
                                <div align="center">
							<a href="manage/team_info.jsp?id=<%=teamId %>&pageNo=1"><i  class="glyphicon glyphicon-step-backward" style="font-size: 15px;"></i></a>&nbsp;
							<%
								if (userPage.isHasPreviousPage()) {
							%>
							<a
								href="manage/team_info.jsp?id=<%=teamId %>&pageNo=<%=userPage.getPageNo() - 1%>"><i  class="glyphicon glyphicon-chevron-left" style="font-size: 15px;"></i></a>&nbsp;
							<%
								}
							%>
							<%
								if (userPage.isHasNextPage()) {
							%>
							<a
								href="manage/team_info.jsp?id=<%=teamId %>&pageNo=<%=userPage.getPageNo() + 1%>"><i  class="glyphicon glyphicon-chevron-right" style="font-size: 15px;"></i></a>&nbsp;
							<%
								}
							%>
							<a
							href="manage/team_info.jsp?id=<%=teamId %>&pageNo=<%=userPage.getTotalPagesByTeamId(teamId) %>"><i  class="glyphicon glyphicon-step-forward" style="font-size: 15px;"></i></a>&nbsp;
						当前是第<jsp:getProperty property="pageNo" name="userPage" />页，总共<%=userPage.getTotalPagesByTeamId(teamId) %>页
					</div>
                                <ul class="nav navbar-right panel_options">
                                    <li>
                                        <a class="full-screen">
                                            <span class="icon-size-fullscreen"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div><!--/.c_title-->

                            <div class="c_content">

                                
                                <div class="table-responsive" data-pattern="priority-columns">
                                   <table style="border-spacing:0px;" id="tech-companies-1" class="table table-small-font table-bordered table-striped">
                                      <thead>
                                         <tr>
                                         <th>ID号</th>
								<th data-priority="1">姓名</th>
								<th data-priority="3">年龄</th>
								<th data-priority="3">职位</th>
								<th data-priority="3">性别</th>
								<th data-priority="3">队伍</th>
								<th data-priority="1">电话</th>
								<th data-priority="3">注册时间</th>
								<th data-priority="3" class="text-center"
									style="width:20%; text-align:center; text-align:center">操作</th>
							
                                      </tr>
                                      </thead>
                            
								<%
								
								if (list != null)
									for (User u : list) {
									u=userDao.toShowType(u);
							%>
						<tbody>
							<tr>
								<th> <span class="co-name"><%=u.getUserId()%></span></th>
								<td><%=u.getUserName()%></td>
								<td><%=u.getUserAge()%></td>
								<td><%=u.getUserState()%></td>
								<td><%=u.getUserSex()%></td>
								<%
									if (u.getUserState().equals("超级管理员")|| u.getUserState().equals("管理员")) {
								%>
								<td>无</td>
								<%
									} else {
								%>
								<td><%=teamDao.getTeamByTeamId(u.getTeamId())
								.getTeamName()%></td>
								<%
									}
								%>
								<td><%=u.getUserPhone()%></td>
								<td><%=u.getUserRegistDate()%></td>
								<td class="text-center"><a
									href="manage/user_info.jsp?userId=<%=u.getUserId()%>"><img src="img/info.png" style="width:20px;height:20px;"></a>
									<a href="<%=path %>/UpdateTeamLeaderServlet?userId=<%=u.getUserId() %>&teamId=<%=teamId %>" target="#">设为队长</a> 
									<a
									href="<%=path%>/UserPassResetServlet?userId=<%=u.getUserId()%>"
									target="#">重置密码</a> 
									<a
									class="delete btn btn-sm btn-danger btn-raised rippler rippler-inverse"
									href="<%=path%>/UserDeleteServlet?id=<%=u.getUserId()%>&teamId=<%=u.getTeamId()%>"><i
										class="fa fa-trash"></i> </a></td>
							</tr>


							<%
								}
							%>
                                      </tbody>
                                   </table>
                                </div>  
                                
                                
                            </div><!--/.c_content-->

                        </div><!--/.c_panels-->


                    </div><!--/col-md-12-->

                </div><!--/row-->

                <!--======== Table Content End ========-->


            </section>
        </section>
        <!--======== Main Content End ========-->


        <!--===== Right sidebar nofications start ========-->
        <%@ include file="../right.jsp"%>
        <!--===== Right sidebar nofications end ========-->

    </section><!--/.container-->

   
    <script src="assets/js/global-plugins.js"></script>
   

    <!--common script init for all pages-->
    <script src="assets/js/theme.js" type="text/javascript" ></script>

    <!-- For the page has tooltipslter only -->
    <script src="assets/js/tooltipster.js" type="text/javascript" ></script>

    <!-- For this page only -->
    <script src="assets/js/tables.js"></script>
    <script src="assets/js/table_editable.js"></script>

    <script type="text/javascript">


        $(document).ready(function(){
            new WOW().init();

            App.initPage();
            App.initLeftSideBar();
            App.initCounter();
            App.initNiceScroll();
            App.initPanels();
            App.initProgressBar();
            App.initSlimScroll();
            App.initNotific8();
            App.initTooltipster();
            App.initStyleSwitcher();
            App.initMenuSelected();
            App.initRightSideBar();
            App.initSummernote();
            App.initAccordion();
            App.initModal();
            App.initPopover();

        });
    </script>


</body>

</html>
