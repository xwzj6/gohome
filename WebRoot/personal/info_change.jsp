<%@ page language="java"
	import="java.util.*,com.zufe.bean.*,com.zufe.dao.*"
	pageEncoding="UTF-8"%>
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="description" content="">
<meta name="keywords"
	content="thema bootstrap template, thema admin, bootstrap, admin template, bootstrap admin">

<meta name="author" content="LanceCoder">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="shortcut icon" href="">
<title>Thema Admin Boostrap Template</title>

<!-- Start Global plugin css -->
<link href="assets/css/global-plugins.css" rel="stylesheet">
<link href="assets/vendors/jquery-icheck/skins/all.css" rel="stylesheet" />



<!--This css plugins uses on this page only-->
<link href="assets/vendors/summernote/summernote.css" rel="stylesheet" />
<link
	href="assets/vendors/bootstrap-datepicker/css/bootstrap-datepicker.css"
	rel="stylesheet" />
<link
	href="assets/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css"
	rel="stylesheet" />
<link
	href="assets/vendors/bootstrap-colorpicker/css/bootstrap-colorpicker.css"
	rel="stylesheet" />
<link href="assets/vendors/bootstrap-tagsinput/bootstrap-tagsinput.css"
	rel="stylesheet" />
<link href="assets/vendors/summernote/summernote-bs3.css"
	rel="stylesheet" />
<link
	href="assets/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet" />
<link href="assets/vendors/jquery.multi-select/css/multi-select.css"
	rel="stylesheet" />
<link href="assets/vendors/typeahead/css/typeahead.css" rel="stylesheet" />
<link href="assets/vendors/select2/select2.css" rel="stylesheet" />
<link href="assets/vendors/ios-switch/css/switch.css" rel="stylesheet" />
<link href="assets/vendors/bootstrap-star-rating/css/star-rating.css"
	rel="stylesheet" />
<link
	href="assets/vendors/bootstrap-fileupload/css/bootstrap-fileupload.css"
	rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="assets/css/theme.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet" />
<link href="assets/css/class-helpers.css" rel="stylesheet" />

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
<link
	href="assets/fonts/Open-Sans/open-sans.css?family=Open+Sans:300,400,700"
	rel="stylesheet" />

</head>

<body id="default-scheme">

	<!--======== Start Style Switcher ========-->
	<i class="style-switcher-btn fa fa-cogs hidden-xs"></i>
	<div class="style-switcher">
		<div class="style-swticher-header">
			<div class="style-switcher-heading fg-white">Color Switcher</div>
			<div class="theme-close">
				<i class="icon-close"></i>
			</div>
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
	</div>
	<!--/style-switcher-->
	<!--======== End Style Switcher ========-->

	<section id="container"> <%@ include file="../top.jsp"%>

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
						<li><a href='personal/info_change.jsp' class="active">信息修改</a>
						</li>
					</ul>
				</li>
				
				<% if(user.getUserState().equals("超级管理员")||user.getUserState().equals("超级管理员")) { %>
				<li class='sub-menu '><a href="1"
					class="hvr-bounce-to-right-sidebar-parent"><span
						class='icon-sidebar icon-screen-desktop fa-2x'></span><span>成员管理</span>
				</a>
					<ul class='sub'>
						<li><a href='manage/team_list.jsp'>队伍列表</a>
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
						<li><a href='manage/team_info.jsp?id=<%=user.getTeamId() %>'>成员列表</a>
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
	<section id="main-content"> <!--<button class="btn-escape">Escape</button>-->


	<section class="wrapper"> <!--======== Grid Menu Start ========-->
	<div id="grid-menu">
		<div class="color-overlay grid-menu-overlay">
			<div class="grid-icon-wrap grid-icon-effect-8">
				<a href="#" class="grid-icon icon-envelope font-size-50 turquoise"></a>
				<a href="#" class="grid-icon icon-user font-size-50 teal"></a> <a
					href="#" class="grid-icon icon-support font-size-50 peter-river"></a>
				<a href="#" class="grid-icon icon-settings font-size-50 light-blue"></a>
				<a href="#" class="grid-icon icon-picture font-size-50 orange"></a>
				<a href="#"
					class="grid-icon icon-camrecorder font-size-50 light-orange"></a>
			</div>
		</div>
	</div>
	<!--======== Grid Menu End ========--> <!--======== Page Title and Breadcrumbs Start ========-->
	<div class="top-page-header">

		<div class="page-title">
			<h2>归家行动</h2>
			<small>五个哈哈团队</small>
		</div>
		<div class="page-breadcrumb">
			<nav class="c_breadcrumbs">
			<ul>
				<li><a href="#">个人中心</a>
				</li>
				<li><a href="#">信息修改</a>
				</li>
			</ul>
			</nav>
		</div>
		<div class="right-menu pull-right"></div>

		<div class="pull-right toggle-right-sidebar">
			<span class="fa fa-outdent fa-2x title-open-right-sidebar"></span>
		</div>

	</div>
	<!--======== Page Title and Breadcrumbs End ========--> <!--======== START BUG TRACKER FORM ========-->
	<div class="c_panel">
		<%
			UserDao userDao=new UserDao();
		User u=userDao.toShowType(user); %>
		<div class="c_title bg-info padding-top-20 padding-bottom-20">
			<h2>
				<strong>信息修改 </strong>
			</h2>
			<div class="clearfix"></div>
		</div>
		<!--/.c_title-->
		
		<div class="c_content">
			<h5>
				<b>个人信息</b>
			</h5>
			<hr style="margin-top:-10px" />
			<form  action="UserInfoChangeServlet?userId=<%=user.getUserId() %>" method="post">
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
							<label class="control-label">姓名 *</label>
							<div class="row">
								<div class="col-sm-6">
									<input type="text" class="form-control margin-top-5"
										name="userName" value="<%=u.getUserName()%>">
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-12">
						<div class="form-group">
							<label class="control-label">年龄 *</label>
							<div class="row">
								<div class="col-sm-6">
									<input type="text" class="form-control"
										name="userAge" value="<%=u.getUserAge()%>">
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="q2">
							<label class="control-label">性别 *</label>
							<div>
								<label> <input type="radio" name="q2"
									class="icheck-aero" name="userSex" value="男"> 男 </label> <label
									style="margin-left:10px"> <input type="radio" name="q2"
									class="icheck-aero" name="userSex" value="女"> 女 </label>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">

						<div class="form-group">
							<label class="control-label">地址 *</label>
							<div class="row">
								<div class="col-sm-6">
									<input type="text" class="form-control margin-top-7"
										name="userAddr" value="<%=u.getUserAddress() %>">
									<p class="help-block text-muted">Street Address</p>
								</div>


							</div>
						</div>

					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<label class="control-label">政治面貌 *</label> <select
							name="userPolitics" class="margin-top-8" id="s2example-1">
							<option value="<%=u.getUserPolitics() %>"><%=u.getUserPolitics() %></option>
							<option value="群众">群众</option>
													<option value="共青团员">共青团员</option>
													<option value="共产党员">共产党员</option>
													<option value="其他民主党派">其他民主党派</option>

						</select>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">邮箱 *</label> <input type="text"
								class="form-control" id="email" name="userEmail" value="<%=u.getUserEmail() %>">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">电话 *</label> <input type="text"
								class="form-control" name="userPhone" id="Phone" value="<%=u.getUserPhone() %>">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">职业 *</label> <input type="text"
								class="form-control" id="Phone" name="userJob" value="<%=u.getUserJob() %>">
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label class="control-label">微信 *</label> <input type="text"
								class="form-control" name="userWechat" value="<%=u.getUserWechat() %>">
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12">

						<div class="form-group">
							<button type="submit" class="btn btn-info btn-flat">更改信息</button>
						</div>

					</div>
				</div>

			</form>

		</div>
		<!--/.c_content-->
			<div class="c_content">
			<h5>
				<b>密码修改</b>
			</h5>
			<hr style="margin-top:-10px" />
			<form>
				

					<div class="col-sm-12">
						<div class="form-group">
							<label class="control-label">原密码*</label>
							<div class="row">
								<div class="col-sm-6">
									<input type="password" class="form-control"
										name="oldPass" value="">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">新密码 *</label>
							<div class="row">
								<div class="col-sm-6">
									<input type="password" class="form-control"
										name="newPass" value="">
								</div>
							</div>
						</div>
					</div>
					
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<button type="submit" class="btn btn-info btn-flat">更改密码</button>
						</div>

					</div>
				</div>

			</form>

		</div>
	</div>
	<!--/.c_panels--> <!--======== END BUG TRACKER FORM ========--> </section> </section> <!--======== Main Content End ========-->


	<!--===== Right sidebar nofications start ========--> <%@ include
		file="../right.jsp"%> <!--===== Right sidebar nofications end ========-->

	</section>
	<!--/.container-->



	<!--common script init for all pages-->
	<script src="assets/js/theme.js" type="text/javascript"></script>

	<!-- For for the page that has form only -->
	<script src="assets/js/forms.js"></script>
	<script src="assets/js/form-validation.js"></script>
	<script src="assets/js/form-wizard.js"></script>
	<script src="assets/js/form-plupload.js"></script>
	<script src="assets/js/form-x-editable.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
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

<!--===== Footer End ========-->