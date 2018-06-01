<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>在Spring MVC应用程序中使用Ajax</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href="${pageContext.request.contextPath}/">
        <link rel="stylesheet" href="resources/css/style.css"/>
    </head>
    <body>
        <div class="container">
            
            <h1>在Spring MVC应用程序中使用Ajax</h1>
            <hr>

            <ul>
                <li><a href="redirect/test1">1.  返回一个字符串</a></li>
                <li><a href="redirect/test2">2.  返回单个对象</a></li>
                <li><a href="redirect/test3">3.  返回一个List集合</a></li>
                <li><a href="redirect/test4">4.  提交一个表单</a></li>
            </ul>
        </div>

    </body>
</html>