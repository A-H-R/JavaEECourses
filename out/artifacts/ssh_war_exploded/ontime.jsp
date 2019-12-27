<%@ page import="jdk.nashorn.internal.ir.RuntimeNode" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    String num = request.getParameter("num");
    String sqlname = request.getParameter("cityname");
%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
        <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
    </head>
<body>
<style>
    .ti{

    }
    .tit{
        font-size: 30px;
    }
</style>
<div>
    <div class="container">
        <p class="tit"><%=name%>实时AQI数据</p>
        <p id="time">123</p>
        <a href="year.jsp?cityname=<%=sqlname%>"><%=name%>历史数据</a>
    </div>
    <!-- 表格 -->

    <div>
        <div class="container">
            <table class="table table-striped table-hover">
                <thead class="thead-light">
                <tr>
                    <th>AQI</th>
                    <th>PM2.5</th>
                    <th>PM10</th>
                    <th>SO2</th>
                    <th>CO</th>
                    <th>NO2</th>
                    <th>O3</th>
                </tr>
                </thead>
                <tbody>

                <tr>
                    <td id="aqi"></td>
                    <td id="pm25"></td>
                    <td id="pm10"></td>
                    <td id="so2"></td>
                    <td id="co"></td>
                    <td id="no2"></td>
                    <td id="o3"></td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="container" id="container">
        </div>
    </div>
</div>
</body>
    <script type="text/javascript">

        $(function () {
            var shuju = loaddata();
            console.info(shuju);
            // showTable(shuju);
        })
        function loaddata() {
            var daydata = [];
            $.ajax({
                url : 'dayAQI/getdata',
                type : "post",
                data : {
                    name : '<%=sqlname%>'
                },
                success : function (data) {
                    console.info(data);
                    data.forEach(function (item) {
                        daydata.push(parseInt(item.aqi));
                    })
                    showTable(daydata);
                },
                error : function () {
                    alert("错误了");
                }
            });
            return daydata;
        }
        function showTable(shuju) {

            var chart = Highcharts.chart('container',{
                chart : {
                    type : 'spline',
                    marginRight : 10,
                    events : {
                        load : function () {
                                var aqi = [];
                                setInterval(function () {
                                //请求最新数据
                                $.ajax({
                                    url : 'https://api.waqi.info/api/feed/@'+'<%=num%>'+'/obs.en.json',
                                    type : "post",
                                    success : function (data) {
                                        //一条数据
                                        aqi.push(data.rxs.obs[0].msg.aqi);
                                        aqi.push(data.rxs.obs[0].msg.iaqi[0].v[0]);
                                        aqi.push(data.rxs.obs[0].msg.iaqi[1].v[0]);
                                        aqi.push(data.rxs.obs[0].msg.iaqi[4].v[0]);
                                        aqi.push(data.rxs.obs[0].msg.iaqi[5].v[0]);
                                        aqi.push(data.rxs.obs[0].msg.iaqi[3].v[0]);
                                        aqi.push(data.rxs.obs[0].msg.iaqi[2].v[0]);
                                        aqi.push(data.rxs.obs[0].msg.iaqi[0].h[0]);
                                        //更新表
                                        $("#aqi").text(data.rxs.obs[0].msg.aqi);
                                        $("#pm25").text(data.rxs.obs[0].msg.iaqi[0].v[0]);
                                        $("#pm10").text(data.rxs.obs[0].msg.iaqi[1].v[0]);
                                        $("#so2").text(data.rxs.obs[0].msg.iaqi[4].v[0]);
                                        $("#co").text(data.rxs.obs[0].msg.iaqi[5].v[0]);
                                        $("#no2").text(data.rxs.obs[0].msg.iaqi[3].v[0]);
                                        $("#o3").text(data.rxs.obs[0].msg.iaqi[2].v[0]);
                                        $("#time").text(data.rxs.obs[0].msg.iaqi[0].h[0]);
                                        console.info(aqi);

                                        chart.series[0].addPoint(parseInt(data.rxs.obs[0].msg.aqi),true,true);
                                    },
                                    error : function () {
                                        alert("错误了");
                                    }
                                });

                            },2000);
                        }
                    }
                },
                title : {
                    text : '<%=name%>实时AQI数据'
                },
                xAxis : {
                    type: 'datetime',
                    tickPixelInterval: 150
                },
                series : [{
                    name : 'AQI',
                    data : shuju
                }]
            })

        }


    </script>
</html>