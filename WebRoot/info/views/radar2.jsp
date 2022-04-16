<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath + "echarts-master/test/"%>">
    
    <title>My JSP 'radar_user.jsp' starting page</title>
        <meta charset="utf-8">
        <script src="lib/esl.js"></script>
        <script src="lib/config.js"></script>
        <!-- <script src="ut/lib/canteen.js"></script> -->
        
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
    <body>
		<style>
            html, body, #main {
                width: 100%;
                height: 100%;
            }
        </style>
        <div id="main"></div>
        <script>

            require([
                'echarts'
            ], function (echarts) {

                var chart = echarts.init(document.getElementById('main'));

                chart.setOption({
                    aria: {
                        show: true
                    },
                    tooltip: {},
                    legend: {
                        data: ['男性', '女性']
                    },
                    radar: {
                        radius: [50, '70%'],
                        name: {
                            formatter:'【{value}】',
                            color:'#72ACD1'
                        },
                        triggerEvent: true,
                        // shape: 'circle',
                        indicator: [
                           { text: '城搜', max: 100},
                           { text:'综合', max: 16000},
                           { text: '安置', max: 30000},
                           { text: '急救', max: 38000},
                           { text: '现场', max: 52000},
                           { text:'水域', max: 25000}
                           ]
                    },
                    series: [{
                        name: '',
                        type: 'radar',
                        label: {
                            normal: {
                                show: true
                            }
                        },
                        // areaStyle: {normal: {}},
                        data : [
                            {
                                value : [0, 10000, 28000, 35000, 50000, 19000],
                                name : '男性'
                            },
                             {
                                value : [50, 14000, 28000, 31000, '-', 21000],
                                name : '女性'
                            }
                        ],
                        symbol: 'triangle',
                        symbolSize: 20,
                        symbolRotate: function(value, params) {
                            return ~~(360 * Math.random());
                        }
                    }]
                });
                var theIndex = 2;
                chart.on('click', function (params) {
                    console.log(params);
                    if (theIndex < 0) {
                        theIndex = 2;
                    }
                    chart.dispatchAction({
                        type: 'showTip',
                        seriesIndex: 0,
                        dataIndex: theIndex
                    });
                    theIndex--;
                });
            });

        </script>

        

    </body>
</html>
