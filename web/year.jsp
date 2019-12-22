<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史AQI</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <%
        String cityname = request.getParameter("cityname");
    %>
</head>
<body>
<!-- 总体 -->
<div>
    <div align="center">
        <img src="static/img/air3.jpg" style="display: block;height: auto;width: 100%;line-height: 1;">
    </div>
    <!-- 表格 -->
    <div>
        <div class="container">
            <table class="table table-striped table-hover">
                <thead class="thead-light">
                <tr>
                    <th>时间</th>
                    <th>AQI</th>
                    <th>范围</th>
                    <th>质量等级</th>
                    <th>PM2.5</th>
                    <th>PM10</th>
                    <th>SO2</th>
                    <th>CO</th>
                    <th>NO2</th>
                    <th>O3</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>


    <!-- 图例 -->
    <div>
        <div align="center" class="mycharts" id="historypopu"></div>
    </div>


    <div id="container" style="width: 400px;height: 300px;"></div>
</div>

<style type="text/css">
    .mycharts{
        min-width: 650px;
        min-height: 395px;
        max-width: 804px;
        max-height: 468px;
        margin: auto;
    }
    .tablespan{
        padding: 5px 10px;
        border-radius: 5px;
        box-shadow: 2px 2px 10px grey;
    }
    .serious{
        background-color: #EA3F05;
    }
    .moderate{
        background-color: #f88612;
    }
    .mild{
        background-color: #f6c98d;
    }
    .good{
        background-color: aquamarine;
    }
    .excellent{
        background-color: darkgreen;
    }


</style>


<script type="text/javascript">
    function loaddata(){
        $.ajax({
            url : "yearAQI/querybyname",
            type : "post",
            data : {
                name : '<%=cityname%>'
            },
            success : function (data) {

                var AQI = [];
                var PM25 = [];
                var SO2 = [];
                var NO2 = [];
                var time = [];
                var spanclass = [];
                for (var i = 0; i < data.length;i++){
                    AQI[i] = parseInt(data[i].aqi);
                    PM25[i] = parseInt(data[i].pm25);
                    SO2[i] = parseInt(data[i].so2);
                    NO2[i] = parseInt(data[i].no2);
                    time.push(data[i].data);

                    //spanclass
                    switch (data[i].level) {
                        case "严重污染" : spanclass.push("serious"); break;
                        case "中度污染" : spanclass.push("moderate"); break;
                        case "轻度污染" : spanclass.push("mild"); break;
                        case "良" : spanclass.push("good"); break;
                        case "优" : spanclass.push("excellent"); break;
                        default : break;

                    }
                }
                showTable(data,spanclass);
                showHistory(AQI,PM25,SO2,NO2,time);
            }
        });
    }
    function showTable(items,spanclass){
        for (var i = 0; i<items.length;i++){
            $("table tbody").append('<tr>' +
                '<td><a href="month.jsp?name=nanjing&month='+items[i].data+'">'+items[i].data+'</a></td>'+
                '<td>'+items[i].aqi+'</td>' +
                '<td>'+items[i].range+'</td>' +
                '<td><span class="tablespan '+ spanclass[i]+'">'+items[i].level+'</span></td>' +
                '<td>'+items[i].pm25+'</td>' +
                '<td>'+items[i].pm10+'</td>' +
                '<td>'+items[i].so2+'</td>' +
                '<td>'+items[i].co+'</td>' +
                '<td>'+items[i].no2+'</td>' +
                '<td>'+items[i].o3+'</td>' +
                '</tr>')
        }
    }

    function showHistory(AQI,PM25,CO,NO2,time){
        $('#historypopu').highcharts({
            chart : {
                zoomType: '',
                spacingRight: 0
            },
            title :{
                text : '南京空气质量指数变化趋势'
            },
            xAxis: {
                type: 'datetime',
                categories: time,
            },
            yAxis: {
                title: {
                    text: '空气质量指数'
                },
                min:0
            },
            series : [
                {
                    name : 'AQI',
                    type : 'spline',
                    color : '#a94442',
                    data : AQI
                },{
                    name : 'PM25',
                    type : 'spline',
                    color : '#470756',
                    data : PM25
                },{
                    name : 'SO2',
                    type : 'spline',
                    color : '#123456',
                    data : CO
                },{
                    name : 'NO2',
                    type : 'spline',
                    color : '#560741',
                    data : NO2
                }
            ]
        })
    }

    $(function () {
        loaddata();
    })
</script>
</body>
</html>