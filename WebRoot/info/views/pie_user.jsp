<%@ page language="java" import="java.util.*,com.zufe.dao.*,com.zufe.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath + "echarts-master/test/"%>">
    
    <title>My JSP 'pie_user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script src="lib/esl.js"></script>
    <script src="lib/config.js"></script>
    <script src="lib/jquery.min.js"></script>
    <script src="lib/facePrint.js"></script>
    <script src="lib/testHelper.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
  </head>
  
  <body>
    <style>
            h1 {
                line-height: 60px;
                height: 60px;
                background: #146402;
                text-align: center;
                font-weight: bold;
                color: #eee;
                font-size: 14px;
            }
            .chart {
                height: 300px;
            }
        </style>

        <div id="main" class="chart"></div>
        <script>

        require(
            (testHelper.hasURLParam('en')
                ? [
                    'echarts',
                    // 'echarts/lang/en',
                ]
                : [
                    'echarts'
                ]
            ).concat(
                [
                    // 'echarts/chart/bar',
                    // 'echarts/chart/line',
                    // 'echarts/component/legend',
                    // 'echarts/component/graphic',
                    // 'echarts/component/grid',
                    // 'echarts/component/tooltip',
                    // 'echarts/component/brush',
                    // 'echarts/component/toolbox',
                    // 'echarts/component/title',
                    // 'zrender/vml/vml'
                ]
            ),
            function (echarts) {

                var chart = echarts.init(document.getElementById('main'));
				
                chart.setOption({
                    aria: {
                        enabled: true
                    },
                    title : {
                        text: '成员男女比例',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['男性成员','女性成员','未填写']
                    },
                    series : [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            selectedMode: 'single',
                            data:[
                            	<% 
                            	ProvinceDao provinceDao=new ProvinceDao();
                            	int man=0,woman=0;
                            	for(int i=1;i<=34;i++){
                            		man+=provinceDao.getProvinceInfoByProvinceId(i).getMen();
                            		woman+=provinceDao.getProvinceInfoByProvinceId(i).getWomen();
                            	}
                            	UserDao userDao=new UserDao();
                            	int all=userDao.getAllUser().size();
                            	%>
                            	{value:<%=man%>,name:'男性成员'},
                            	{value:<%=woman%>,name:'女性成员'},
                            	{value:<%=all-man-woman%>,name:'未填写'}
                            ],
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                });
				
				
                chart.on('pieselectchanged', function (e) {
                    console.log(e);
                });

                window.onresize = chart.resize;
            }
        );
        </script>
  </body>
</html>
