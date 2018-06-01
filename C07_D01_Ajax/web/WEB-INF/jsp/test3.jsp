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
    <body style="background-color: lightgreen;">

        <h1>Test3-发送Ajax请求，返回一个List集合</h1>
        <hr>

        <br>

        <form>
            <input type="button" id="submitBtn" value="查询学生列表">
        </form>

        <br><br>

        <table id="studentTable">

        </table>
        
        <script>
            //自己定义一个函数，根据学号删除学生
            function deleteStudent(stuId){
                $.ajax({
                    url:'testAjax/testDelete',
                    type:'POST',
                    data: {"stuId":stuId}, //将传入的学号的值提交给服务器
                    success: function(){
                        //成功说明服务器已经处理完
                        $("#"+stuId).remove(); //删除选中元素和其内容
                    },
                    error: function(request,status,error){
                        //error对应的函数可接受三个参数
                        //1.请求对象
                        //2.请求状态
                        //3.错误对象
                        alert("Ajax请求失败！"+error);
                    }
                });
            }
            $(document).ready(function () {
                $("#submitBtn").click(function () {
                    $.ajax({
                        url: 'testAjax/testList',
                        success: function (list) {
                            //在每次添加数据之前先清空表格
                            $("#studentTable").empty(); //清空表格中的所有内容
                            //append函数用于向选中的元素内部最后追加内容
                            $("#studentTable").append("<tr><th>学号</th><th>姓名</th><th>性别</th><th>操作</th></tr>");
                            $.each(list, function (index, student) {
                                var str = "<tr id="+student.stuId+"><td>" + student.stuId + "</td><td>" + student.stuName
                                        + "</td><td>" + student.stuGender + "</td><td><a href=\"javascript:deleteStudent('"+student.stuId+"');\">删除</a></td></tr>";
                                $("#studentTable").append(str); //将当前学生作为一行添加到表格中
                            });
                        },
                        error: function () {
                            alert("Ajax请求失败!");
                        }
                    });
                });
            });
        </script>

    </body>
</html>