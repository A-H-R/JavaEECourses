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
            background-color: black;
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
        .liang{
            background-color: #eaa52c;
        }

    </style>


<script type="text/javascript">
    function loaddata(city){
        if (!city){
            city = "nanjing";
        }
        $.ajax({
            url : "yearAQI/query",
            type : "post",
            data : {
                cityname : city
            },
            success : function (data) {
                showTable(data);
                var AQI = [];
                var PM25 = [];
                var SO2 = [];
                var NO2 = [];
                var time = [];
                for (var i = 0; i < data.length;i++){
                    AQI[i] = parseInt(data[i].aqi);
                    PM25[i] = parseInt(data[i].pm25);
                    SO2[i] = parseInt(data[i].so2);
                    NO2[i] = parseInt(data[i].no2);
                    time.push(data[i].data);
                }
                showHistory(AQI,PM25,SO2,NO2,time);
            }
        });
    }
    function showTable(items){
        items.forEach(function (item) {
            $("table tbody").append('<tr>' +
                '<td>'+item.data+'</td>' +
                '<td>'+item.aqi+'</td>' +
                '<td>'+item.range+'</td>' +
                '<td><span class="tablespan liang">'+item.level+'</span></td>' +
                '<td>'+item.pm25+'</td>' +
                '<td>'+item.pm10+'</td>' +
                '<td>'+item.so2+'</td>' +
                '<td>'+item.co+'</td>' +
                '<td>'+item.no2+'</td>' +
                '<td>'+item.o3+'</td>' +
                '</tr>')
        })
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
                    name : 'CO',
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






































<script type="text/javascript">






    $(function () {

    });
    var success =[];
    $(document).ready(function() {

        $("#btn").click(function() {
            alert(123);
            $.ajax({
                url : "yearAQI/query",   //这个就是填相应的action
                type : "POST",         //数据发送方
                // 要传递的数据
                data : {
                    name:'123456',
                    phone:'123456789'
                },

                // 回调函数，接受服务器端返回给客户端的值，即result值
                success : function(data) {      //后台传回json
                    alert("返回东西了");

                    alert(data);
                    success = data;
                    console.info(data);
                }

            });
        });
    });

</script>
</body>
</html>