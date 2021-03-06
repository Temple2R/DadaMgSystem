<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>达内登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <!--框架-->
    <link rel="stylesheet" href="<%=basePath %>core/bootstrap/bootstrap.css">
    <!--基础库-->
    <link rel="stylesheet" href="<%=basePath %>css/base/base.css">
    <!--样式重置库-->
    <link rel="stylesheet" href="<%=basePath %>css/base/reset.css">
    <!--登录样式-->
    <link rel="stylesheet" href="<%=basePath %>css/login/login.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/common.css">
    <link rel="stylesheet" href="<%=basePath %>plugins/sweetalert/sweet-alert.css">

</head>
<body class="login-bg" onkeydown="keyLogin();">
<div class="container">
    <div class="row">
        <div class="login text-center">
            <img class="logo" src="<%=basePath %>img/small-logo.png" alt="">
            <div class="text-right">
                <span style="font-size: 14px;color: red;" class="error-msg"></span>
            </div>
            <form  class="js-form-validate" method="post">
                <!--账号-->
                <div class="form-group">
                    <div class="input-content">
                        <img class="account-img" src="<%=basePath %>img/account.png" alt="账号">
                        <input type="text" class="form-control" name="uname" id="js-input-account" placeholder="请输入账号！">
                    </div>
                </div>
                <!--密码-->
                <div class="form-group">
                    <div class="input-content">
                        <img class="pwd-img" src="<%=basePath %>img/password.png" alt="密码">
                        <input type="password" class="form-control  input-pwd" id="js-input-pwd"  name="password" placeholder="请输入密码！">
                        <img class="browse" src="<%=basePath %>img/off-browse.png" id="js-browse">
                    </div>
                </div>
                <button type="button" class="btn btn-primary btn-block" id="js-login">登录</button>
            </form>
        </div>

    </div>
</div>
<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>plugins/sweetalert/sweet-alert.min.js"></script>
<script src="<%=basePath %>plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="<%=basePath %>js/login-form.js"></script>
<script src="<%=basePath %>js/login.js"></script>
<script type="text/javascript">
function keyLogin(){
	  if (event.keyCode==13)   //回车键的键值为13
	     document.getElementById("js-login").click();  //调用登录按钮的登录事件
	  }
</script>
</body>
</html>