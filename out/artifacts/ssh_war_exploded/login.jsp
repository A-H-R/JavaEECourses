<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <script type="text/javascript">

        $(document).ready(function() {
            $("#btn").click(function() {
                alert(123);
                $.ajax({
                    url : "addresslist/query",   //这个就是填相应的action
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
                        console.info(data);
                    }

                });
            });
        });

    </script>
</head>
<body>
<form id="form1">
    用户名：<input type="text" name="name"><br />
    密&nbsp;&nbsp;码：<input type="text" name="phone"><br />
    <input type="button" id = "btn" value="登录" >
</form>
</body>
</html>