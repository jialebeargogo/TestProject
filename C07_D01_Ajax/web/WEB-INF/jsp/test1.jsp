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
    <body style="background-color: lightblue;">

        <h1>Test1-发送Ajax请求，返回一个字符串</h1>
        <hr>
        <br>

        <form>
            姓名：<input type="text" id="nameText" value="Anna">
            <input type="button" id="submitBtn" value="提交">
        </form>

        <h2 id="msg"></h2>
        
        <!--通过jQuery的ajax函数发送异步请求-->
        <!--使用jQuery是为了编写自己的javascript--> 
        <script>
            //js代码
            //编写jQuery一般需要编写到document的ready事件中
            $(document).ready(function(){

                //处理id为submitBtn按钮的点击事件
                $("#submitBtn").click(function(){
                    
                    //这里当按钮点击后应该执行的代码
                    //调用jQuery的ajax函数，发送异步请求
                    //JSONs
                    //url:指定请求路径
                    //type: 请求提交方式
                    //data:发送给服务器的数据，也就是参数
                    //success: 指定如果ajax请求成功，要执行的操作
                    //error:如果ajax请求失败，要执行的操作
                    $.ajax({
                        url: "testAjax/testString",
                        type: 'POST',
                        data: {"name": $("#nameText").val()},
                        success: function(msg){ //success对应的函数可有参数，该参数表示服务器返回的数据
                            //将id为msg的h2的内容设置为服务器返回的内容
                            $("#msg").html(msg);
                        },
                        error: function(){
                            alert("Ajax请求失败！！！");
                        } //最后一个属性不要加逗号
                    });
                }); 
            });
            
        </script>
    </body>
</html>