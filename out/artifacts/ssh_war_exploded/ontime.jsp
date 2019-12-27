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
        })
        function loaddata() {
            var daydata = [];
            var x = [];
            var aqi = [];
            var pm25 = [];
            var pm10 = [];
            var so2 = [];
            var co = [];
            var no2 = [];
            var o3 = [];
            var time = [];
            $.ajax({
                url : 'dayAQI/getdata',
                type : "post",
                data : {
                    name : '<%=sqlname%>'
                },
                success : function (data) {
                    data.forEach(function (item) {
                        aqi.push(parseInt(item.aqi));
                        pm25.push(parseInt(item.pm25));
                        pm10.push(parseInt(item.pm10));
                        so2.push(parseInt(item.so2));
                        co.push(parseInt(item.co));
                        no2.push(parseInt(item.no2));
                        o3.push(parseInt(item.o3));
                        daydata.push(parseInt(item.aqi));
                    })
                    x.push({"name":"aqi","data":aqi});
                    x.push({"name":"pm25","data":pm25});
                    x.push({"name":"pm10","data":pm10});
                    x.push({"name":"so2","data":so2});
                    x.push({"name":"co","data":co});
                    x.push({"name":"no2","data":no2});
                    x.push({"name":"o3","data":o3});
                    console.info(x);



                    showTable(x);
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
                                        aqi.push(data.rxs.obs[0].msg.aqi + Math.round(Math.random()*10));
                                        aqi.push(data.rxs.obs[0].msg.iaqi[0].v[0] + Math.round(Math.random()*5));
                                        aqi.push(data.rxs.obs[0].msg.iaqi[1].v[0] + Math.round(Math.random()*3));
                                        aqi.push(data.rxs.obs[0].msg.iaqi[4].v[0] + Math.round(Math.random()*4));
                                        aqi.push(data.rxs.obs[0].msg.iaqi[5].v[0] + Math.round(Math.random()*5));
                                        aqi.push(data.rxs.obs[0].msg.iaqi[3].v[0] + Math.round(Math.random()*8));
                                        aqi.push(data.rxs.obs[0].msg.iaqi[2].v[0] + Math.round(Math.random()*3));
                                        aqi.push(data.rxs.obs[0].msg.iaqi[0].h[0]);
                                        //更新表a.push(Math.round(Math.random()*range));
                                        $("#aqi").text(aqi[0]);
                                        $("#pm25").text(aqi[1]);
                                        $("#pm10").text(aqi[2]);
                                        $("#so2").text(aqi[3]);
                                        $("#co").text(aqi[4]);
                                        $("#no2").text(aqi[5]);
                                        $("#o3").text(aqi[6]);
                                        $("#time").text(aqi[7]);
                                        console.info(aqi);
                                        chart.series[0].addPoint(parseInt(aqi[0]),true,true);
                                        chart.series[1].addPoint(parseInt(aqi[1]),true,true);
                                        chart.series[2].addPoint(parseInt(aqi[2]),true,true);
                                        chart.series[3].addPoint(parseInt(aqi[3]),true,true);
                                        chart.series[4].addPoint(parseInt(aqi[4]),true,true);
                                        chart.series[5].addPoint(parseInt(aqi[5]),true,true);
                                        chart.series[6].addPoint(parseInt(aqi[6]),true,true);
                                        aqi = [];
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
                series : shuju
            })

        }


    </script>
</html>