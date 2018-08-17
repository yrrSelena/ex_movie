<%@page language="java" contentType="text/html; chatset=UTF-8"
        pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%--
<jsp:forward page="/movies"></jsp:forward>
--%>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    out.print(basePath);
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Movie管理系统|后台登录</title><meta name="keywords" content="Movie后台登录界面" /><meta name="description" content="后台登录" />

    <link href="http://cn.inspinia.cn/html/inspiniaen/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cn.inspinia.cn/html/inspiniaen/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="http://cn.inspinia.cn/html/inspiniaen/css/animate.css" rel="stylesheet">
    <link href="http://cn.inspinia.cn/html/inspiniaen/css/style.css" rel="stylesheet">

</head>


<body class="gray-bg">


<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">Movie</h1>

        </div>
        <h3>欢迎登录Movie后台管理系统</h3>
        <p>
        </p>
        <form class="m-t" role="form" action="${APP_PATH}/login" method="post">
            <div class="form-group">
                <input id="username" name="username" type="text" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input id="password" name="password" type="password" class="form-control" placeholder="密码" required="">
            </div>
            <button id="login_btn" type="submit" class="btn btn-primary full-width m-b"> 登录</button>

            <a href="#"><small>忘记密码?</small></a>
            <p class="text-muted text-center"><small>还没有账号?</small></p>
            <a class="btn btn-sm btn-white btn-block" href="${APP_PATH}/movies">创建一个帐户</a>

        </form>



        <p class="m-t"> <small>Copyright</strong> Selena &copy; 2018-8</small> </p>
    </div>

</div>

<!-- Mainly scripts -->
<script src="${APP_PATH}/inspinia/js/jquery/jquery-3.1.1.min.js"></script>
<script src="${APP_PATH}/inspinia/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${APP_PATH}/inspinia/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${APP_PATH}/inspinia/js/bootstrap/bootstrap.min.js"></script>

<script src="${APP_PATH}/inspinia/js/plugins/dataTables/datatables.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${APP_PATH}/inspinia/js/inspinia.js"></script>
<script src="${APP_PATH}/inspinia/js/plugins/pace/pace.min.js"></script>
<!-- Page-Level Scripts -->
<script type="text/javascript">

    $("#login_btn").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        $.ajax({
            url:"${APP_PATH}/login",
            type:"POST",
            data:{"username":username,"password":password},
            //dataType:"json",
            success:function (result) {
                if(result.code == 100)
                {
                    window.location="${APP_PATH}/admin_home.jsp";
                }

            }

        });
        
    });
</script>

</body>



</html>
