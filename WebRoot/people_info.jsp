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

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
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
                
                <%
                {
	                int peopleId=Integer.valueOf(request.getParameter("peopleId")) ;
					PeopleDao peopleDao=new PeopleDao();
					People people=peopleDao.getPeopleByPeopleId(peopleId);
					people=peopleDao.toShowType(people);
					ProvinceDao provinceDao=new ProvinceDao();
				%>
                <!--======== START USER PROFILE MAIN ========-->
                <div class="profile-page">
					
                    <div class="row profile-cover" style="background-image:url(img/top_back.jpg);  background-size:98% 100%;background-origin:content-box;background-position:center;background-repeat:no-repeat; opacity:80%;">
                        <div class="row">
                            <div class="col-md-3 profile-image">
                                <div class="profile-image-container">
                                    <img src="img/oldman.jpg" alt="image">
                                </div>
                            </div>
                        </div>
                    </div>
                    							
                    <div class="row">
                        <div class="col-md-12 profile-under-cover-style">
                            &nbsp;
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div class="row margin-top-70">
                        <!--Left Sidebar-->
                       
--> 
                            <!--Notification-->
                            
                            <!--End Datepicker-->
                        </div><!--/col-md-3-->
                         
                        <!--End Left Sidebar-->

                        <div class="col-md-12" style="background:rgba(255, 255, 255, 0.5);">
                            
                            
										<div class="row">

                                                <div class="col-md-12">
                    <hr>
                                                    <div class="profile-about">
                                                        <h4>基本信息</h4>
                                                        <div class="table-responsive">
                                                            <table class="table about-table">
                                                                <tbody>
                                                                
                                                                    <tr>
                                                                        <th>ID号</th>
                                                                        <td><%=people.getPeopleId() %> <span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>姓名</th>
                                                                        <td><%=people.getPeopleName() %><span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>性别</th>
                                                                        <td><%=people.getPeopleSex() %> <span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <th>生日</th>
                                                                        <td><%=people.getPeopleBirth() %> <span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>家乡</th>
                                                                        <td><%=people.getPeopleHometown() %> <span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>身高</th>
                                                                        <td><%=people.getPeopleHeight() %><span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>文化水平</th>
                                                                        <td><%=people.getPeopleEducation() %><span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>健康程度</th>
                                                                        <td><%=people.getPeopleHealth() %><span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <th>特征</th>
                                                                        <td><%=people.getPeopleFigure() %> <span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>是否失踪</th>
                                                                        <td><%=(people.getIsLost()==1)?"是":"否" %> <span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>所属省份</th>
                                                                        <td><%=provinceDao.getProvinceNameById(people.getProvinceId()) %> <span class="icon-pencil pull-right"></span></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div><!--/profile-about-->
                                                    </div></div>
                            <!--Start Profile Contacts-->
                            <div class="row">   
                                <div class="col-md-12">

                                    <div class="panel panel-profile">
                                        <div class="panel-heading overflow-hidden">
                                            <h2 class="panel-title heading-sm pull-left"><i class="fa fa-tasks"></i>失踪记录</h2>
                                            <a href="page-people-directory.html" class="btn-u btn-brd btn-brd-hover btn-u-dark btn-u-xs pull-right">View All</a>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12 page-people-directory">
                                                    
                                                    <div class="list-group contact-group">
                                                    	<%
                                                    	LostDao lostDao=new LostDao();
                                                    	
                                                    	 %>
                                                        
                                                        <%
                                                        } %>
                                                        
                                                    </div>

                                                </div>   
                                            </div>
                                        </div>        
                                    </div>

                                </div>
                                
                            </div><!--/row-->
                            <!--End Profile Contacts-->

                            <hr/>

                            

                        <hr>

                        

                        </div>
                    </div>

                </div>  
                <!--======== END USER PROFILE MAIN ========-->


            </section>
        </section>
        <!--======== Main Content End ========-->


        <!--===== Right sidebar nofications start ========-->
        <%@ include file="right.jsp"%> 
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
    <!-- <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/vendors/jquery.cookie/jquery.cookie.js"></script>
    <script src="assets/vendors/jquery-ui/jquery-ui.min.js"></script>
    <script src="assets/vendors/jquery-easing/jquery.easing.1.3.js"></script>
    <script src="assets/vendors/bootstrap/js/bootstrap.js"></script>
    <script src="assets/vendors/jquery/dcjqaccordion.2.7.js"></script>
    <script src="assets/vendors/jquery/scrollTo.min.js"></script>
    <script src="assets/vendors/jquery/slimscroll.js"></script>
    <script src="assets/vendors/jquery/nicescroll.js"></script>
    <script src="assets/vendors/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="assets/vendors/counter/waypoints.min.js" type="text/javascript" ></script>
    <script src="assets/vendors/counter/jquery.counterup.min.js" type="text/javascript" ></script>
    <script src="assets/vendors/jquery-icheck/icheck.min.js"></script>
    <script src="assets/vendors/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="assets/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
    <script src="assets/vendors/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script src="assets/vendors/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="assets/vendors/summernote/summernote.min.js"></script>
    <script src="assets/vendors/jquery.autosize/jquery.autosize.js"></script>
    <script src="assets/vendors/jquery.multi-select/js/jquery.multi-select.js"></script>
    <script src="assets/vendors/jquery.multi-select/js/jquery.quicksearch.js"></script>
    <script src="assets/vendors/typeahead/js/typeahead.bundle.js"></script>
    <script src="assets/vendors/typeahead/js/handlebars.min.js"></script>
    <script src="assets/vendors/perfect-scrollbar/js/perfect-scrollbar.min.js"></script>
    <script src="assets/vendors/select2/select2.min.js"></script>
    <script src="assets/vendors/bootstrap-star-rating/js/star-rating.min.js"></script>
    <script src="assets/vendors/bootstrap-fileupload/js/bootstrap-fileupload.js"></script>
    <script src="assets/vendors/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
    <script src="assets/vendors/jquery.validate/jquery.validate.min.js"></script>
    <script src="assets/vendors/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="assets/vendors/dropzone/dropzone.min.js"></script>
    <script src="assets/vendors/plupload/js/plupload.full.min.js"></script>
    <script src="assets/vendors/plupload/js/jquery.plupload.queue/jquery.plupload.queue.min.js"></script>
    <script src="assets/vendors/x-editable/bootstrap3-editable/js/bootstrap-editable.js"></script>
    <script src="assets/vendors/x-editable/inputs-ext/address/address.js"></script>
    <script src="assets/vendors/x-editable/inputs-ext/typeaheadjs/typeaheadjs.js"></script>
    <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
    <script src="assets/vendors/magnific-popup/js/jquery.magnific-popup.js"></script>
    <script src="assets/vendors/masonry/masonry.pkgd.min.js"></script>
    <script src="assets/vendors/moment.min.js"></script>
    <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="assets/vendors/raphael-min.js" charset="utf-8" ></script>
    <script src="assets/vendors/sweetalert/sweetalert.min.js"></script>
    <script src="assets/vendors/word-rotator/jquery.wordrotator.min.js"></script>
    <script src="assets/vendors/wow-animations/js/wow.min.js"></script>
    <script src="assets/vendors/rwd-table/js/rwd-table.min.js?v=5.0.3"></script>
    <script src="assets/vendors/jqueryui.sortable.animation/jquery.ui.sortable-animation.js"></script>
    <script src="assets/vendors/tooltipster/js/jquery.tooltipster.js" type="text/javascript" ></script>
    <script src="assets/vendors/dropdowns-enhancement/js/dropdowns-enhancement.min.js" type="text/javascript"></script>
    <script src="assets/vendors/jquery-notific8/jquery.notific8.js" type="text/javascript"></script>
    <script src="assets/vendors/date.js"></script>
    <script src="assets/vendors/pogo-slider/js/jquery.pogo-slider.min.js" type="text/javascript" ></script>
    <script src="assets/vendors/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript" ></script>
    <script src="../../../vendors/nestable/jquery.nestable.js" type="text/javascript" ></script>
    <script src="assets/vendors/bstooltip/bstooltip.js"></script> -->

    <!--##################################################################################
    #
    # COMMON SCRIPT FOR THIS PAGE
    #
    ##################################################################################-->

    <!--common script init for all pages-->
    <script src="assets/js/theme.js" type="text/javascript" ></script>

    <!-- For User Management Page Only -->
    <script src="assets/js/profile.js"></script>

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