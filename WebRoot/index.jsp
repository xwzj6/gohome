<%@ page language="java" import="java.util.*,com.zufe.bean.*,com.zufe.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
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
    
    

    <!-- This page plugin css start -->
    <link href="assets/vendors/maps/css/jquery-jvectormap-2.0.1.css" rel="stylesheet" type="text/css"/>
    <link href="assets/vendors/morris-chart/morris.css" rel="stylesheet" >
    <link href="assets/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="assets/vendors/jquery-ricksaw-chart/css/rickshaw.css" rel="stylesheet"/>
    <link href="assets/css/flot-chart.css" rel="stylesheet"/>
    <!-- This page plugin css end -->

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
    	
		<%@ include file="top.jsp"%>
		
        <%@ include file="left.jsp"%>
      

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
                    <%TotalInfo totalInfo=new TotalInfo();%>
                    <div class="page-title">
                        <h2>信息总览</h2>
                    </div>
                    

                    <div class="pull-right toggle-right-sidebar">
                        <span class="fa fa-outdent fa-2x title-open-right-sidebar"></span>
                    </div>

                </div>
                <!--======== Page Title and Breadcrumbs End ========-->


                <div class="row">

                    <div class="col-md-3">

                        <div class="widget">
                            <div class="widget-content bg-white">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3 class="counter font-bold font-size-38"><%=totalInfo.getTotalUser() %></h3>
                                    </div>
                                    <div class="col-xs-6">
                                        <p class="font-size-38"><img style="width:40px;" src="img/user.png"></p>
                                    </div>
                                </div>
                                <p>成员人数</p>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="74"></div>
                                </div>
                                <a href="manage/user_list.jsp" class="padding-8 hvr-bounce-to-right bg-green" style="width:100%;">成员详情 <i class="fa fa-arrow-circle-right"></i></a>
                            </div><!--/widget-content--> 
                        </div><!--/widget-->

                    </div>

                    <div class="col-md-3">

                        <div class="widget">
                            <div class="widget-content bg-white">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3 class="counter font-bold font-size-38"><%=totalInfo.getTotalTeam() %></h3>
                                    </div>
                                    <div class="col-xs-6">
                                        <p class="font-size-38"><img style="width:40px;" src="img/team.png"></p>
                                    </div>
                                </div>
                                <p>队伍数量</p>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-green-sea" role="progressbar" data-transitiongoal="57"></div>
                                </div>
                                <a href="manage/team_list.jsp" class="padding-8 hvr-bounce-to-right bg-green-sea" style="width:100%;">队伍详情 <i class="fa fa-arrow-circle-right"></i></a>
                            </div><!--/widget-content--> 
                        </div><!--/widget-->

                        
                    </div>

                    <div class="col-md-3">

                        <div class="widget">
                            <div class="widget-content bg-white">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3 class="counter font-bold font-size-38"><%=totalInfo.getTotalLostHasFind() %></h3>
                                    </div>
                                    <div class="col-xs-6">
                                        <p class="font-size-38"><img style="width:40px;" src="img/task.png"></p>
                                    </div>
                                </div>
                                <p>完成任务数</p>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-sun-flower" role="progressbar" data-transitiongoal="90"></div>
                                </div>
                                <a href="check/hava_list.jsp" class="padding-8 hvr-bounce-to-right bg-sun-flower" style="width:100%;">任务详情 <i class="fa fa-arrow-circle-right"></i></a>
                            </div><!--/widget-content--> 
                        </div><!--/widget-->
                        
                    </div>

                    <div class="col-md-3">

                        <div class="widget">
                            <div class="widget-content bg-white">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3 class="counter font-bold font-size-38"><%=totalInfo.getTotalPeople() %></h3>
                                    </div>
                                    <div class="col-xs-6">
                                        <p class="font-size-38"><img style="width:40px;" src="img/old.png"></p>
                                    </div>
                                </div>
                                <p>登记老人</p>
                                <div class="progress progress-xs">
                                    <div class="progress-bar bg-alizarin" role="progressbar" data-transitiongoal="45"></div>
                                </div>
                                <a href="#" class="padding-8 hvr-bounce-to-right bg-alizarin" style="width:100%;">老人详情 <i class="fa fa-arrow-circle-right"></i></a>
                            </div><!--/widget-content--> 
                        </div><!--/widget-->
                        
                    </div>


                </div><!-- .row -->

                    <%
	RecordDao recordDao=new RecordDao();
		List<User> userList=new ArrayList<User>();
		userList=recordDao.getNUser(3);
		LostDao lostDao=new LostDao();
 %>
                <!--======== Transaction Summary Start ========-->
                <div class="row">

                    <div class="col-md-12">

                        <div class="widget">
                            <div class="widget-header bg-white">
                                <h3 class="fg-gray">任务统计</h3>

                                <div class="daterange daterange-text add-date-ranges pull-right" id="daterange-4" data-format="MMMM D, YYYY" data-start-date="February 19, 2015" data-end-date="March 19, 2015" style="    margin-top: -24px;">
                                    <i class="fa fa-calendar"></i>
                                    <span>February 19, 2015 - March 19, 2015</span>
                                </div>
                            </div>
                            <div class="widget-content bg-white">
                                
                                <div class="row">
                                    <div class="col-md-8 col-sm-12 col-xs-12">
                                        <div class="chart-widget">
                                            <div class="chart-widget-content wow zoomIn" id="transaction-summary"></div>
                                        </div>
                                        <div class="row" style="border-top:1px solid #eee;">
                                            <div style="margin-top:10px;">
                                                <div class="col-md-4 mobile-text-center">
                                                    <span>任务总数</span>
                                                    <h2 class="counter"><%=lostDao.getRecordCount() %></h2>
                                                    <span class="widget-total-sessions graph" style="height: 160px;">
                                                        <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                                    </span>
                                                </div><!--/.col-md-4-->
                                                <div class="col-md-4 mobile-text-center">
                                                    <span>任务增长</span>
                                                    <h2><span class="counter"><%=recordDao.getRecordCount() %></span></h2>
                                                    <span class="widget-total-revenue graph" style="height: 160px;">
                                                        <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                                    </span>
                                                </div><!--/.col-md-4-->
                                                <div class="col-md-4 mobile-text-center">
                                                    <span>任务完成率</span>
                                                    <h2><span class="counter"><%=lostDao.getRecordCountHasFind()*100/ lostDao.getRecordCount() %></span>%</h2>
                                                    <span class="widget-speed-sessions graph" style="height: 160px;">
                                                        <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                                    </span>
                                                </div><!--/.col-md-4-->
                                            </div>
                                            
                                        </div>

                                    </div><!--/.col-md-8-->

                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                        <div>
                                            <div class="top-profile-heading">
                                                <h3>光荣榜</h3>
                                                
                                                <div class="clearfix"></div>
                                            </div><!--/.c_title-->

                                            <div class="top-profiles-wrapper"> 

                                                <ul class="list-unstyled top_profiles">
                                                <%{
                                                int i=0;
                                                for(User u:userList){i++;  %>
                                                    <li class="media event">
                                                        <div class="pull-left thumbnail-hover margin-left-28">
                                                            <div class="overflow-hidden">
                                                                <img src="img/boy.png" width="80" alt="image"/>
                                                            </div>
                                                        </div>
                                                        <div class="media-body">
                                                        <h3>第<%=i %>名</h3>
                                                            <a class="title" href="#"><%=u.getUserName() %></a>
                                                            <p><strong>任务次数 </strong> <%=recordDao.getRecordCount(u.getUserId()) %> </p>
                                                            <p><strong>注册时间 </strong> <small><%=u.getUserRegistDate() %></small>
                                                            </p>
                                                        </div>
                                                    </li>
                                                 <%} }%>
                                                    <nav class="c_breadcrumbs">
							                            <a href="user_rank.jsp" class="btn btn-green btn-flat btn-add-new-user" data-toggle="modal" ><span class="icon-user-follow"></span> 查看全部</a>
							                        </nav>
                                                </ul>

                                            </div><!--/.top-profiles-wrapper-->    
                                            
                                        </div>
                                    </div><!--/.col-md-4-->

                                </div><!--/row-->

                            </div><!--/widget-content--> 
                        </div><!--/widget-->

                    </div><!--/.col-md-12-->
                </div><!--/.row-->
                <!--======== Transaction Summary End ========-->


                <div class="row">

                    <div class="col-md-4">

                        <!--======== Server Load Start ========-->
                        <div class="row">
					<div class="col-md-12">

                        <div class="widget">
                            <div class="widget-header bg-white">
                                <h3 class="fg-gray">能力分布</h3>
                            </div>
                            <div class="widget-content bg-white">
                                
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="row" style="text-align: center;">
                                            <div class="col-md-12 wow zoomIn">
                                                <div id="radar1">
													<iframe src="info/views/radar_user.jsp"  width="100%" height="50%"
																scrolling="no" frameborder="0"></iframe>
												</div>	
                                            </div>
                                        </div>
                                    </div>
                                </div><!--/row-->

                            </div><!--/widget-content--> 
                        </div><!--/widget-->

                    </div>
                            
                            
                        </div><!--/.row-->
                        <!--======== Server Load End ========-->


                        <!--======== Weather Forecast Start ========-->
                        <div class="row">

                            <div class="col-md-12">
                                
                                <div class="widget">
                                    <div class="widget-header bg-white">
                                        <h3 class="fg-gray">天气</h3>
                                    </div>
                                    <div class="widget-content bg-white">
                                        
                                        <div class="row">
                                            <div class="col-md-12 text-center padding-10">
                                                <div class="weather-icon">
                                                    <span>
                                                        <canvas height="84" width="84" id="partly-cloudy-day"></canvas>
                                                    </span>
                                                </div>
                                                <div class="weather-temperature">
                                                    <b>周一</b>, 07:30 AM
                                                    <span>F</span>
                                                    <span><b>C</b></span>
                                                </div>
                                                <div class="weather-text">
                                                    <h2>江干区</h2>
                                                    <p class="text-muted">多云</p>
                                                </div>

                                            </div>
                                        </div><!--/row-->

                                        <div class="clearfix"></div>
                                        <div class="row weather-days padding-left-10 padding-right-10">
                                            <div class="col-xs-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">周一</h2>
                                                    <h3 class="degrees">25</h3>
                                                    <span>
                                                        <canvas id="clear-day" width="32" height="32"></canvas>
                                                    </span>
                                                    <h5>15
                                                        <i>km/h</i>
                                                    </h5>
                                                </div>
                                            </div><!--/col-xs-2-->
                                            <div class="col-xs-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">周二</h2>
                                                    <h3 class="degrees">25</h3>
                                                    <canvas height="32" width="32" id="rain"></canvas>
                                                    <h5>12
                                                        <i>km/h</i>
                                                    </h5>
                                                </div>
                                            </div><!--/col-xs-2-->
                                            <div class="col-xs-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">周三</h2>
                                                    <h3 class="degrees">27</h3>
                                                    <canvas height="32" width="32" id="snow"></canvas>
                                                    <h5>14
                                                        <i>km/h</i>
                                                    </h5>
                                                </div>
                                            </div><!--/col-xs-2-->
                                            <div class="col-xs-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">周四</h2>
                                                    <h3 class="degrees">28</h3>
                                                    <canvas height="32" width="32" id="sleet"></canvas>
                                                    <h5>15
                                                        <i>km/h</i>
                                                    </h5>
                                                </div>
                                            </div><!--/col-xs-2-->
                                            <div class="col-xs-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">周五</h2>
                                                    <h3 class="degrees">28</h3>
                                                    <canvas height="32" width="32" id="wind"></canvas>
                                                    <h5>11
                                                        <i>km/h</i>
                                                    </h5>
                                                </div>
                                            </div><!--/col-xs-2-->
                                            <div class="col-xs-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">周六</h2>
                                                    <h3 class="degrees">26</h3>
                                                    <canvas height="32" width="32" id="cloudy"></canvas>
                                                    <h5>10
                                                        <i>km/h</i>
                                                    </h5>
                                                </div>
                                            </div><!--/col-xs-2-->
                                        </div><!--/row-->

                                    </div><!--/widget-content--> 
                                </div><!--/widget-->

                            </div>
                            
                        </div><!--/.row-->
                        <!--======== Weather Forecast End ========-->


                    </div><!--/.col-md-4-->
                    

                    <div class="col-md-8 col-sm-8 col-xs-12">

                        <!--======== Visitors Location Start ========-->
                        <div class="row">

                            <div class="col-md-12 col-sm-12 col-xs-12">

                                <div class="widget">
                                    <div class="widget-header bg-white">
                                        <h3 class="fg-gray">全国信息</h3>
                                    </div>
                                    <div class="widget-content bg-white">
                                        
                                        <div class="row">
                                            <div class="col-md-4">
                                                <h4 class="margin-left-10">部分省份信息</h4>

                                                <table class="countries_list wow zoomIn">
                                                    <tbody>
                                                    <%{
                                                    	ProvinceInfo provinceInfo=new ProvinceInfo();
                                                    	ProvinceDao provinceDao=new ProvinceDao();
                                                    	for(int i=1;i<=6;i++){
                                                    		provinceInfo=provinceDao.getProvinceInfoByProvinceId(i);
                                                    		String name=provinceDao.getProvinceNameById(i);
                                                     %>
                                                        <tr>
                                                        <th>
                                                                
                                                                </th>
                                                            	<div>
                                                            	<p><%=name %></p>
                                                                    <p class="badge bg-lightgray fg-gray">男性成员<span class="counter"><%=provinceInfo.getMen() %></span></p>
                                                             	<p class="badge bg-lightgray fg-gray">女性成员<span class="counter"><%=provinceInfo.getWomen() %></span></p>
                                                                <p class="badge bg-lightgray fg-gray">队伍数量<span class="counter"><%=provinceInfo.getTeam() %></span></p>
                                                             	<p class="badge bg-lightgray fg-gray">报案数量<span class="counter"><%=provinceInfo.getLost() %></span></p>
                                                          
                                                             	<p class="badge bg-lightgray fg-gray">完成数量<span class="counter"><%=provinceInfo.getLostFound() %></span></p>
                                                                  
                                                                </div>
                                                            <td >
                                                                
                                                             </td>
                                                        </tr>
                                                        <%}} %>
                                                        
                                                        
                                                    </tbody>
                                                </table>
                                                <div class="right-menu pull-right">

							                        <nav class="c_breadcrumbs">
							                            <a href="" class="btn btn-green btn-flat btn-add-new-user" data-toggle="modal" data-target="#modal-pull-right-add"><span class="icon-user-follow"></span> 查看全部</a>
							                        </nav>
							                    </div>
                                            </div>
                                            <div class="col-md-8 col-sm-12 col-xs-12  wow zoomIn">
                                                <iframe src="info/views/map_user.jsp"  class="img1" id="id1" width="100%" height="90%" scrolling="yes" frameborder="0"></iframe>
                                            </div>
                                        </div><!--/row-->

                                    </div><!--/widget-content--> 
                                </div><!--/widget-->

                            </div>

                        </div><!--/.row-->
                        <!--======== Visitors Location End ========-->
<!--======== START ADD USER ========-->
                        <%@ include file="index_add.jsp"%>
                        <!--======== END ADD USER ========-->
                        <!--======== Bandwidth Start ========-->
                        <div class="row">

                            <div class="col-md-6">

                                <div class="widget">
                                    <div class="widget-header bg-white">
                                        <h3 class="fg-gray">男女比例</h3>
                                    </div>
                                    <div class="widget-content bg-white">
                                        
                                        <div class="text-center padding-10 wow zoomIn">
				<iframe src="info/views/pie_user.jsp"  width="100%" height="35%"
							scrolling="no" frameborder="0"></iframe>

                                        </div>

                                    </div><!--/widget-content--> 
                                </div><!--/widget-->

                            </div>

                            <div class="col-md-6">
                                
                                <div class="widget">
                                    <div class="widget-header bg-white">
                                        <h3 class="fg-gray">任务完成率</h3>
                                    </div>
                                    <div class="widget-content bg-white">
                                        
                                        <div class="text-center padding-10 wow zoomIn" style="height:280px;">
                                            <span class="pie-chart-memory" data-percent="<%=lostDao.getRecordCountHasFind()*100/ lostDao.getRecordCount() %>">
                                                <span class="percent"></span>
                                            </span>

                                            <p><%=lostDao.getRecordCountHasFind()%>/ <%=lostDao.getRecordCount() %></p>

                                        </div>

                                    </div><!--/widget-content--> 
                                </div><!--/widget-->
                                
                            </div>

                        </div><!--/.row-->
                        <!--======== Bandwidth End ========-->


                    </div><!--/.col-md-8-->
                        
                </div><!--/.row-->


            </section>
            
        </section>
        <!--======== Main Content End ========-->

		<%@ include file="right.jsp"%>
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
   

    <!--##################################################################################
    #
    # DASHBOARD AND WIDGET PAGE PLUGINS
    #
    ##################################################################################-->
    <!-- Chart JS -->
    <script src="assets/vendors/chartjs/chart.min.js"></script>
    <!--jQuery Flot Chart-->
    <script src="assets/vendors/flot/jquery.flot.full.min.js" type="text/javascript"></script>
    <!--jQuery Ricksaw Chart-->
    <script src="assets/vendors/jquery-ricksaw-chart/js/rickshaw.min.js" type="text/javascript" ></script>
    <script src="assets/vendors/jquery-ricksaw-chart/js/d3.v2.js" type="text/javascript" ></script>
    <!-- Easy Pie JS -->
    <script src="assets/vendors/easypie/jquery.easypiechart.min.js"></script>
    <!--Sparkline JS-->
    <script src="assets/vendors/sparkline/index.js"></script>
    <!--Morris Chart-->
    <script src="assets/vendors/morris-chart/morris.min.js"></script>
    <!--Skycons JS-->
    <script src="assets/vendors/skycons/skycons.js"></script>
    <!-- World Map JS -->
    <script src="assets/vendors/maps/js/jquery-jvectormap-2.0.1.min.js" type="text/javascript" ></script>
    <script src="assets/vendors/maps/js/gdp-data.js" type="text/javascript" ></script>
    <script src="assets/vendors/maps/js/jquery-jvectormap-world-mill-en.js" type="text/javascript" ></script>
    <script src="assets/vendors/maps/js/jquery-jvectormap-us-aea-en.js" type="text/javascript" ></script>
    <script src="assets/vendors/video-js/video.js"></script>
    <script>
        videojs.options.flash.swf = "assets/vendors/video-js/video-js.swf";
    </script>


    <!--##################################################################################
    #
    # COMMON SCRIPT FOR THIS PAGE
    #
    ##################################################################################-->
    <!--common script init for all pages-->
    <script src="assets/js/theme.js" type="text/javascript" ></script>

    <!--script for this page-->
    <script src="assets/js/dashboard-green.js" type="text/javascript" ></script>
    <script src="assets/js/forms.js" type="text/javascript" ></script>

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
            App.initEmail();
            App.initSummernote();
            App.initAccordion();
            App.initModal();
            App.initPopover();
            App.initOwlCarousel();
            App.initSkyCons();
            App.initWidgets();

            DashboardGreen.initRickShawGraph();
            DashboardGreen.initFlotGraph();
            DashboardGreen.initChartGraph();
            DashboardGreen.initSparklineGraph();
            DashboardGreen.initDateRange();
            DashboardGreen.initWorldMap();
            DashboardGreen.initEasyPieChart();
            DashboardGreen.initMorrisChart();
            DashboardGreen.initTodoList();

        });
    </script>


</body>

</html>

<!--===== Footer End ========-->
  
  <!--
  <body>
  	
    <iframe src="top.jsp" width="100%" scrolling="no"
		frameborder="0"></iframe>
	<div>
		<div id="left">
			<div></div>
			<div>
				<iframe src="info/info_total.jsp"  width="100%" height="50%"
							scrolling="no" frameborder="0"></iframe>
			</div>
			<div id="radar1">
				<iframe src="info/views/radar_user.jsp"  width="100%" height="50%"
							scrolling="no" frameborder="0"></iframe>
			</div>	
		</div>
		<div id="map" >
			<a href="#id1" >志愿者分布</a>
			<a href="#id2" >队伍地图</a>
			<a href="#id3" >报案地图</a>
			<a href="#id4" >救援地图</a>
			<a href="eduVideo.jsp">救援教学</a>
			<div class="map">
					<iframe src="info/views/map_user.jsp"  class="img1" id="id1" width="100%" height="100%"
						scrolling="yes" frameborder="0"></iframe>
					<iframe src="info/views/map_team.jsp"  class="img1" id="id2" width="100%" height="100%"
						scrolling="no" frameborder="0"></iframe>
					<iframe src="info/views/map_lost.jsp"  class="img1" id="id3" width="100%" height="100%"
						scrolling="no" frameborder="0"></iframe>
					<iframe src="info/views/map_doing.jsp"  class="img1" id="id4" width="100%" height="100%"
						scrolling="no" frameborder="0"></iframe>
			</div>
		</div>
		<div id="right">
			<div id="pie1">
				<iframe src="info/views/pie_user.jsp"  width="100%" height="40%"
							scrolling="no" frameborder="0"></iframe>
			</div>
			<div id="radar2">
				<iframe src="info/views/radar2.jsp"  width="100%" height="50%"
							scrolling="no" frameborder="0"></iframe>
			</div>		
		</div>
	</div>
  	
  </body>
</html>
-->
