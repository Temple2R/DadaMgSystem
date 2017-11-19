<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <link rel="stylesheet" href="<%=basePath %>css/base/base.css">
    <link rel="stylesheet" href="<%=basePath %>core/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>plugins/bootstrap-dialog/bootstrap-dialog.min.css">
    <!--<link rel="stylesheet" href="core/bootstrap-table/bootstrap-table.css">-->
    <link rel="stylesheet" href="<%=basePath %>css/base/common.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/reset.css">
    <link rel="stylesheet" href="<%=basePath %>css/user-manager/user-manager.css">
	<link href="<%=basePath %>plugins/iChecks/skins/square/blue.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
</head>

<body class="index-bg">
<div class="container">
    <header class="header" id="js-u-m-header">
        <img class="header-logo pull-left" src="<%=basePath %>img/small-logo.png" alt="logo">
   		<!-- <a href="index.do"type="button" class="btn btn-primary ml10">返回主页</a> -->
    </header>
    <div class="wrap" id="js-wrap">
        <div class="user-manager-action text-right">
            <button class="btn btn-primary" id="js-add-staff">添加员工</button>
            <button class="btn btn-danger">全部删除</button>
        </div>
        <div class="table-responsive">
            <table class="table table-hover table-bordered table-condensed">
                <thead>
                <tr>
                    <th>
                        <div>
                            <input type="checkbox">
                            <span>全选</span>
                        </div>
                    </th>
                    <th>员工号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>技术方向</th>
                    <th>部门</th>
                    <th>职位</th>
                    <th>入职时间</th>
                    <th>邮箱</th>
                    <th>电话</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id='js-user1'>
                
           

                </tbody>
            </table>

        </div>
        <div class="pull-right">
            <ul class="pagination page ">
                <li><a href="#">首页</a></li>
                <li><a href="#">上一页</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">下一页</a></li>
                <li><a href="#">尾页</a></li>
            </ul>
        </div>
    </div>
</div>

<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.js"></script>
<script src="<%=basePath %>plugins/bootstrap-dialog/bootstrap-dialog.min.js"></script>
<script src="<%=basePath %>plugins/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=basePath %>js/nicescroll.js"></script>
<script src="<%=basePath %>js/loaduser.js"></script>
<script src="<%=basePath %>js/add-staff.js"></script>
<%-- <script src="<%=basePath %>js/chg-staff.js"></script> --%>
<!--<script src="core/bootstrap-table/bootstrap-table.js"></script>-->
<script>
    var screenH = document.body.clientHeight || document.documentElement.clientHeight;
    var header = document.querySelector("#js-u-m-header");
    var wrap = document.querySelector("#js-wrap");
    function getTableH() {
        var headerH = header.clientHeight;
        wrap.style.height = screenH - headerH - 30 + "px";
    }
    getTableH();
    window.onresize = getTableH;
</script>
<%-- <script src="<%=basePath %>js/chg-staff.js"></script> --%>
</html>