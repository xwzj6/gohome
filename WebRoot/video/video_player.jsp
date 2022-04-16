<%@ page language="java" import="java.util.*,com.zufe.bean.*,com.zufe.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="description" content="">
    <meta name="keywords" content="thema bootstrap template, thema admin, bootstrap, admin template, bootstrap admin">

    <meta name="author" content="LanceCoder">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="">
    <title>Thema Admin Boostrap Template</title>

    <!-- Start Global plugin css -->
    <link href="assets/css/global-plugins.css" rel="stylesheet">
    <link href="assets/vendors/jquery-icheck/skins/all.css" rel="stylesheet" />
    

    <!--This css plugins uses on this page only-->
    <link href="assets/vendors/select2/select2.css" rel="stylesheet" />

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
						<li><a href='video/video_list.jsp' class="active">教学视频</a>
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
                                <li><a href="#">详细信息</a></li>
                                <li><a href="#">救援视频</a></li>
                                <li class="active"><a href="#">视频播放</a></li>
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

                <!--======== START USER MANAGEMENT ========-->
                <div class="row users">

                    <div class="col-md-12">

                        <div class="row">

                            <div class="col-md-12">
                            
                                <div class="pull-left margin-bottom-10"><h3>救援视频</h3></div>

                                <form class="form-inline pull-right user-top-bar">
                                    <a href="" class="btn btn-green btn-flat btn-add-new-user" data-toggle="modal" data-target="#modal-pull-right-add"><span class="icon-user-follow"></span> 添加视频</a>
                                    <div class="form-group">
                                        <div class="inner-addon left-addon">
                                            <i class="icon-magnifier"></i>
                                            <input type="text" class="form-control txt-search-user" placeholder="Search user"/>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-silver btn-flat">Search</button>
                                    <div class="btn-group">
                                        <button class="btn btn-silver" id="grid-view" type="button"><span class="icon-grid"></span></button>
                                        <button class="btn btn-silver" id="list-view" type="button"><span class="icon-list"></span></button>
                                    </div>
                                </form>

                            </div><!--/col-md-12-->

                        </div><!--/row-->

                        <hr/>

                        <div id="user-view" class="row list-group">
							<% 
								
								int videoId=Integer.valueOf(request.getParameter("videoId")) ;
								Video video=new Video();
								VideoDao videoDao=new VideoDao();
								video=videoDao.getVideoById(videoId);
								if(video==null);
								else{
							 %>
                            <div class="item col-md-6">
                                	<video src="videos/<%=video.getVideoAddr() %>" controls="controls">您的浏览器不支持 video 标签。</video>
                                </div>
                            </div>
                           <%} %>
                            
                        </div>

                        <!--======== START ADD USER ========-->
                        <%@ include file="video_add.jsp"%>
                        <!--======== END ADD USER ========-->

                        <!--======== START VIEW USER ========-->
                        <div class="modal modal-pull-right"  data-easein="fadeInRight" data-easeout="fadeOutRight" id="modal-pull-right-view" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="user-header" style="background-image:url(assets/images/user-view-cover-md.jpg)">
                                                    <div class="row dialog-close">
                                                        <div class="col-md-12">
                                                            <ul class="list-unstyled list-inline text-right">
                                                                <li><span class="fa fa-trash"></span></li>
                                                                <li><span class="fa fa-times" data-dismiss="modal"></span></li>
                                                            </ul>
                                                        </div>
                                                    </div>

                                                    <div class="row user-info">
                                                        <div class="col-md-12 text-center">
                                                            <p class="user-name">John Doe</p>
                                                            <!-- <p class="user-skills">
                                                                <ul class="list-unstyled list-inline">
                                                                    <li>Design</li>
                                                                    <li>Photoshop</li>
                                                                    <li>Backend</li>
                                                                </ul>
                                                            </p>    --> 
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <div class="profile-image-container">
                                                                <img src="assets/images/users/img4.jpg" alt="image">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="user-view-content">
                                                    <p class="user-view-action pull-right">
                                                        <button type="button" class="btn btn-green btn-raised btn-edit"><i class="fa fa-edit"></i> Edit</button>
                                                        <button type="button" class="btn btn-silver btn-raised btn-cancel" style="display:none"><i class="fa fa-times"></i> Cancel</button>
                                                    </p>
                                                    
                                                    
                                                    <section class="user-info-container">
                                                        <table class="table user-view-table-info">
                                                            <tbody>
                                                                <tr>
                                                                    <th>Fullname</th>
                                                                    <td><span class="info">John Doe</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Email</th>
                                                                    <td><span class="info">jdoe@domain.com</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Phone</th>
                                                                    <td><span class="info">+639-151-2345</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Position</th>
                                                                    <td><span class="info">Web Designer</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Status</th>
                                                                    <td><span class="info">Employee</span></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </section>

                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--======== END VIEW USER ========-->


                    </div><!--/col-md-12-->

                </div><!--/row-->
                <!--======== END USER MANAGEMENT ========-->


            </section>
        </section>
        <!--======== Main Content End ========-->


        <!--===== Right sidebar nofications start ========-->
        <%@ include file="../right.jsp"%>
        <!--===== Right sidebar nofications end ========-->

    </section><!--/.container-->

    <!--===== Footer Start ========-->

    <!-- Placed js at the end of the document so the pages load faster -->

    <!--##################################################################################
    #
    # Thema GLOBAL JS PLUGINS
    # 
    # NOTE: These libraries are neccessary to run the template so don't remove one of these libraries. 
    # You can uncomment the following libraries commented and comment the global-plugins.js but it will may cause slow performance of the template because of many links should be load from the server.
    #
    ##################################################################################-->
    <script src="assets/js/global-plugins.js"></script>
   

    <!--common script init for all pages-->
    <script src="assets/js/theme.js" type="text/javascript" ></script>

    <!-- For User Management Page Only -->
    <script src="assets/js/users.js"></script>

    <!-- For for the page that has form only -->
    <script src="assets/js/forms.js"></script>
    <script src="assets/js/form-validation.js"></script>
    <script src="assets/js/form-wizard.js"></script>
    <script src="assets/js/form-plupload.js"></script>
    <script src="assets/js/form-x-editable.js"></script>

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

<!--===== Footer End ========-->