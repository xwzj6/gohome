<%@ page language="java" import="java.util.*,com.zufe.dao.*,com.zufe.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath + "echarts-master/test/"%>">
    
    <title>My JSP 'map_lost.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<script src="lib/esl.js"></script>
	<script src="lib/config.js"></script>
	<script src="lib/jquery.min.js"></script>
	<script src="lib/facePrint.js"></script>
	<script src="lib/testHelper.js"></script>
	<!-- <script src="ut/lib/canteen.js"></script> -->
	<link rel="stylesheet" href="lib/reset.css" />
  </head>
  
  <body>
    <div id="main0"></div>



	<script>
            require(
            [ 'echarts' ], function (echarts) {

                require(['map/js/china'], function () {
                    var itemStyle = {
                        normal:{
                            borderColor: 'rgba(0, 0, 0, 0.2)'
                        },
                        emphasis:{
                            shadowOffsetX: 0,
                            shadowOffsetY: 0,
                            shadowBlur: 20,
                            borderWidth: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    };

                    var option = {
                        tooltip: {},
                        title : {
                            text: '全国成功救援地图',
                            left: 'center'
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data:['Men','Women']
                        },
                        visualMap: {
                            min: 0,
                            max: 20,
                            left: 'left',
                            top: 'bottom',
                            text: ['高','低'],
                            calculable : true
                        },
                        selectedMode: 'single',
                        series : [
                            {
                                name: 'Men',
                                type: 'map',
                                map: 'china',
                                itemStyle: itemStyle,
                                showLegendSymbol: true,
                                // zoom: 10,
                                // center: [115.97, 29.71],
                                roam: true,
                                markPoint: {
                                    data: [{
                                        coord: [115.97, 29.71]
                                    }]
                                },
                                label: {
                                    normal: {
                                        show: true,
                                        rotate: 40,
                                        formatter: '{b}：{value|{c}}',
                                        // position: 'inside',
                                        backgroundColor: '#fff',
                                        padding: [3, 5],
                                        borderRadius: 3,
                                        borderWidth: 1,
                                        borderColor: 'rgba(0,0,0,0.5)',
                                        color: '#777',
                                        rich: {
                                            value: {
                                                color: '#019D2D',
                                                fontSize: 14,
                                                // fontWeight: 'bold'
                                                // textBorderWidth: 2,
                                                // textBorderColor: '#000'
                                            }
                                        }
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                data:[]
                            },
                            {
                                name: 'Women',
                                type: 'map',
                                mapType: 'china',
                                itemStyle: itemStyle,
                                showLegendSymbol: true,
                                label: {
                                    normal: {
                                        show: true
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                data:[
                                ]
                            }
                        ]
                    };
                    //option["series"][0]["data"][0]={name:'北京',value:20};
                    //document.write(option["series"][0]["data"][0]["name"]);
                    <%
						ProvinceDao provinceDao=new ProvinceDao();
						ProvinceInfo provinceInfo=new ProvinceInfo();
						for(int i=1;i<=27;i++){
							provinceInfo=provinceDao.getProvinceInfoByProvinceId(i);
							String name=provinceInfo.getProvinceName();
					%>
							option["series"][0]["data"][<%=i-1%>]={name:'<%=name.substring(0, name.length()-1) %>',value:<%=provinceInfo.getLost_Men() %>};
							option["series"][1]["data"][<%=i-1%>]={name:'<%=name.substring(0, name.length()-1) %>',value:<%=provinceInfo.getLost_Women()%>};
                    <%}%>
                    
                    
                    
                    var chart = testHelper.create(echarts, 'main0', {
                        option: option,
                        height: 550
                    });

                    if (chart) {
                        chart.on('click', function (param) {
                            console.log(param);
                        });
                    }
						//document.write(option["series"][1]["data"][5]["name"]);
                });
            });

        </script>
  </body>
</html>
