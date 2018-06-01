<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>在Spring MVC应用程序中使用Ajax</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href="${pageContext.request.contextPath}/">
        <link rel="stylesheet" href="resources/css/style.css"/>
        <script src="resources/js/jquery-3.3.1.min.js"></script>
    </head>
    <body style="background-color: lightsalmon;">

        <h1>Test4-发送Ajax请求，提交一个注册表单</h1>
        <hr>

        <br><br>

        <form id="regForm">
            学号：<input type="text" name="stuId" value="S005">
            <br><br>
            姓名：<input type="text" name="stuName" value="安娜">
            <br><br>
            性别：
            <select name="stuGender" value="女">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
            <br><br>
            <input type="button" value="提交注册" id="submitBtn">
        </form>

        <h2 id="msg"></h2>

        <script>
            $(document).ready(function () {
                $("#submitBtn").click(function () {
                    $.ajax({
                        url: 'testAjax/testForm',
                        type: 'POST',
                        data: $("#regForm").serialize(), //将一个表单中的表单元素编码成一个字符串提交给服务器
                        success: function (msg) {
                            $("#msg").html(msg);
                        },
                        error: function (req,status,error) {
                            alert("Ajax请求失败!"+error);
                        }
                    });
                });
            });
        </script>

    </body>
</html>