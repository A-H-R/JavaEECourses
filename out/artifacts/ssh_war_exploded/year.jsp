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
    <link rel="stylesheet" type="text/css" href="static/css/nav.css">
    <%
        String cityname = request.getParameter("cityname");
    %>
</head>
<body>
<!-- 总体 -->
<div>
    <div class="nav">
        <div class="nav_item"><a href="index.jsp">历史数据</a></div>
        <div class="nav_item"><a href="#">图片定制</a></div>
    </div>
    <div align="center">
        <img src="static/img/air3.jpg" style="display: block;height: auto;width: 100%;line-height: 1;">
    </div>

    <!-- 图例 -->
    <div class="container">
        <div align="center" class="mycharts" id="historypopu"></div>
    </div>
    <!-- 表格 -->
    <div>
        <div class="container">
            <table class="table table-striped table-hover size">
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

    <div id="container" style="width: 400px;height: 300px;"></div>
</div>

<style type="text/css">
    /*.mycharts{*/
    /*    min-width: 650px;*/
    /*    min-height: 395px;*/
    /*    max-width: 804px;*/
    /*    max-height: 468px;*/
    /*    margin: auto;*/
    /*}*/
    .size{
        height: 500px;
        overflow: hidden;
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
    var alfa = 0.8;
    var valuePlotBaud = [{
        from: 0,
        to: 50,
        color: 'rgba(0, 254, 3, ' + alfa + ')',
        label: {
            text: '优',
            style: {
                color: "#606060"
            }
        }
    }, {
        from: 51,
        to: 100,
        color: 'rgba(254, 245, 0, ' + alfa + ')',
        label: {
            text: '良',
            style: {
                color: '#606060'
            }
        }
    }, {
        from: 101,
        to: 150,
        color: 'rgba(254, 125, 0, ' + alfa + ')',
        label: {
            text: '轻度污染',
            style: {
                color: '#606060'
            }
        }
    }, {
        from: 151,
        to: 200,
        color: 'rgba(255, 3, 3, ' + alfa + ')',
        label: {
            text: '中度污染',
            style: {
                color: '#606060'
            }
        }
    }, {
        from: 201,
        to: 300,
        color: 'rgba(188, 3,205 , ' + alfa + ')',
        label: {
            text: '重度污染',
            style: {
                color: '#606060'
            }
        }
    }, {
        from: 301,
        to:600,
        color: 'rgba(72, 0, 78, ' + alfa + ')',
        label: {
            text: '严重污染',
            style: {
                color: '#606060'
            }
        }
    }];
    function loaddata(){
        $.ajax({
            url : "yearAQI/querybyname",
            type : "post",
            data : {
                name : '<%=cityname%>'
            },
            success : function (data) {
                var time = [];
                var max = [];
                var min = [];
                var avg = [];
                var spanclass = [];
                for (var i = 0; i < data.length;i++){
                    // AQI[i] = parseInt(data[i].aqi);
                    var x = data[i].range.split("~");
                    max.push(parseInt(x[0]));
                    min.push(parseInt(x[1]));
                    avg.push((parseInt(x[0])+parseInt(x[1]))/2);
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
                showHistory(max,min,avg,time);
            }
        });
    }
    function showTable(items,spanclass){
        for (var i = 0; i<items.length;i++){
            var time = items[i].data;
            var month = time.substring(0,time.lastIndexOf("/"));
            $("table tbody").append('<tr>' +
                '<td><a href="month.jsp?name=nanjing&month='+month+'">'+month+'</a></td>'+
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

    function showHistory(max,min,avg,time){
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
                min:0,
                plotBands:valuePlotBaud
            },
            tooltip: {
                shared: true,
                enabled: true,
                useHTML: true,
                formatter: function() {
                    tip = ''
                        + "<table width='160px' class='table-condensed table-bordered table-striped' style='margin:0px'>"
                    for (i=this.points.length-1;i>=0;i--)
                    {
                        color = this.points[i].series.color;
                        names = this.points[i].series.name;
                        y = this.points[i].y;
                        level = this.points[i].point.level;
                        tip = tip +  "<tr><td width='80px' style='color:" + color + "'>" + names +"</td><td align='right'><b>"+ y + "</b></td><td align='center' style='" + getAQIStyle(y) + "'>"+ level + "</td></tr>";
                    }
                    tip = tip + "</table>";
                    return tip;
                }
            },
            series : [
                {
                    name : 'MAX',
                    type : 'spline',
                    color : '#a94442',
                    data : max
                },{
                    name : 'MIN',
                    type : 'spline',
                    color : '#470756',
                    data : min
                },{
                    name : 'AVG',
                    type : 'spline',
                    color : '#123456',
                    data : avg
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