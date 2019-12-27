<%--
  Created by IntelliJ IDEA.
  User: hurui
  Date: 2019/12/20
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>首页</title>
      <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
      <link rel="stylesheet" type="text/css" href="static/css/nav.css">
  </head>
  <body>
  <div>
      <div class="nav">
          <div class="nav_item"><a href="index.jsp">历史数据</a></div>
          <div class="nav_item"><a href="#">图片定制</a></div>
      </div>

      <div align="center">
          <img src="static/img/air3.jpg" style="display: block;height: auto;width: 100%;line-height: 1;">
      </div>
      <div>
          <p class="title">城市</p>
          <div style="margin: 10px 10%;" id="cityplace"></div>

      </div>
  </div>

  <style type="text/css">
      .title{
          font-weight: 700;
          font-size: x-large;
          margin: 30px 10%;
      }
      .city{
          display: inline-block;
          margin: 10px 25px;
          padding: 4px 10px;
          border: 2px solid #6fa9e3;
          border-radius: 5px;
          box-shadow: 2px 2px #a4a2a2;
      }
      a{
          text-decoration: none;
      }
  </style>
  </body>
  <script type="text/javascript">
      function loaddata() {
          $.ajax({
              url : "city/cityname",
              type : "post",
              data: {},
              success : function (data) {
                  console.info(data);
                  addcity(data);
              }
          });
      }

      function addcity(items){
          items.forEach(function (item) {
              $("#cityplace").append(
                  '<div class="city">'+
                  '<a href="ontime.jsp?name='+item.cityname+'&num='+item.num+'&cityname='+item.tip+'">'+item.cityname+'</a>'+
                  '</div>'
                )
          })
      }
      $(function () {
          loaddata();
      })

  </script>

</html>
