<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
    <meta charset="UTF-8">
    <title>创建训练营</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <link rel="stylesheet" href="<%=basePath %>css/base/base.css">
    <link rel="stylesheet" href="<%=basePath %>core/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/common.css">
    <link rel="stylesheet" href="<%=basePath %>css/add-training-camp/add-training-camp.css">
    <link rel="stylesheet" href="<%=basePath %>css/user-manager/user-manager.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/reset.css">
</head>
<body class="index-bg">
<div class="container">
    <header class="header">
        <img class="header-logo pull-left" src="<%=basePath %>img/small-logo.png" alt="logo">
    </header>
    <div class="row">
        <div class="create-wrap">
        <form action="toChgCamp.do"method="post">
            <input type="hidden" name="id" id="" value="${camp.id }"/>
            <div class="input-bg mt20">
                <span>教 师 编 号：</span>
                <input type="text" class="input-txt" name="classroomNumber" value="${camp.classroomNumber }" placeholder="请输入教师编号">
            </div>
            <div class=" input-bg">
                <span>教 师 姓 名：</span>
                <input type="text" class="input-txt" name="teacherName" value="${camp.teacherName }" placeholder="请输入教师姓 名">
            </div>
            <div class="input-bg">
                <span>讲 师 电 话：</span>
                <input type="text" class="input-txt" name="teacherPhone" value="${camp.teacherPhone }" placeholder="请输入教师电话">
            </div>
            <div class="input-bg">
                <span>所属产品线：</span>
                <input type="text" class="input-txt" name="productLine" value="${camp.productLine }" placeholder="请输入所属产品线">
            </div>
            <div class="input-bg">
                <span>创 建 时 间：</span>
                <input type="text" class="input-txt" name="createdTime" value="${camp.createdTime }" placeholder="请输入创建时间">
            </div>
            <div class="input-bg">
                <span>班 级 人 数：</span>
                <input type="text" class="input-txt" name="cadetNumber" value="${camp.cadetNumber }" placeholder="0" readonly="readonly">
            </div>
            <div class="text-center mt20">
                <button id="creat-click" class="btn btn-primary mr20">创建</button>
                <a href="index.do" class="btn btn-primary ml20">取消</a>
            </div>
        </form>
        </div>
    </div>
</div>
</div>

<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>plugins/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=basePath %>js/nicescroll.js"></script>
<script type="text/javascript">
	/* $("#creat-click").click(function(){
		document.fileForm.submit();
	}) */
</script>
</body>
</html>