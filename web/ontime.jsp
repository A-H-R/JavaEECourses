<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div>
    <div>
        <p>南京实时AQI数据</p>
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
                    <td>179</td>
                    <td>142</td>
                    <td>142</td>
                    <td>142</td>
                    <td>142</td>
                    <td>142</td>
                    <td>142</td>
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
                    name : "nanjing"
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
            // $("#container").highcharts({
            //     chart : {
            //         type : 'spline',
            //         marginRight : 10,
            //         events : {
            //             load : function () {
            //                 // var series = this.series[0],
            //                 console.info(this.series[0]);
            //                 //     chart = this;
            //                 setInterval(function () {
            //                     //请求最新数据
            //                     // var x = Math.random();
            //                     // series.addPoint(12, true, true);
            //                     this.series[0].addPoint(12,true,true);
            //                 },1000);
            //             }
            //         }
            //     },
            //     title : {
            //         text : '南京实时AQI数据'
            //     },
            //     xAxis : {
            //         type: 'datetime',
            //         tickPixelInterval: 150
            //     },
            //     series : [{
            //         name : 'AQI',
            //         data : data
            //     }]
            // })

            var chart = Highcharts.chart('container',{
                chart : {
                    type : 'spline',
                    marginRight : 10,
                    events : {
                        load : function () {
                            // var series = this.series[0],
                            //     chart = this;
                            setInterval(function () {
                                //请求最新数据
                                // var x = Math.random();
                                // series.addPoint(12, true, true);
                                $.ajax({
                                    url : 'dayAQI/getnewone',
                                    type : 'post',
                                    data : {
                                        name : "nanjing"
                                    },
                                    success : function (data) {
                                        console.info(data[0]);

                                        chart.series[0].addPoint(parseInt(data[0].aqi),true,true);
                                    },
                                    error : function () {
                                        alert("错了");
                                    }
                                })
                                // chart.series[0].addPoint(12,true,true);
                            },2000);
                        }
                    }
                },
                title : {
                    text : '南京实时AQI数据'
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