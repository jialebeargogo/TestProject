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
    <body style="background-color: lightpink;">

        <h1>Test2-发送Ajax请求，返回一个对象</h1>
        <hr>
        <br>

        <form>
            学号：<input type="text" id="stuid" value="S001">
            <input type="button" id="submitBtn" value="查询">
        </form>

        <br>

        <div id="studentInfo">
            <p>学号：<span id="sid"></span> </p>
            <p>姓名：<span id="sname"></span> </p>
            <p>性别：<span id="sgender"></span> </p>
        </div>

        <script>
            $(document).ready(function () {
                $("#submitBtn").click(function () {
                    $.ajax({
                        url: 'testAjax/testObject',
                        type: 'POST',
                        data: {"stuId":$("#stuid").val()},
                        success: function(student){ //返回的数据是一个学生对象
                            //改变id为sid,sname,sgender的三个元素的内容
                            //分别显示学号，姓名和性别
                            $("#sid").html(student.stuId); //获取学生对象的学号
                            $("#sname").html(student.stuName); //stuName等是类中的属性名
                            $("#sgender").html(student.stuGender);
                        },
                        error: function(){
                            alert("Ajax请求失败！");
                        }
                    });
                });
            });
        </script>

    </body>
</html>