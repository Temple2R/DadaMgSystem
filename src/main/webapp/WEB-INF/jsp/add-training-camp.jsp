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
    <title>创建训练营</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <link rel="stylesheet" href="<%=basePath %>css/base/base.css">
    <link rel="stylesheet" href="<%=basePath %>core/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/common.css">
    <link rel="stylesheet" href="<%=basePath %>css/add-training-camp/add-training-camp.css">
    <link rel="stylesheet" href="<%=basePath %>css/user-manager/user-manager.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/reset.css">
    <link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body class="index-bg">
<div class="container">
	  <%    
          if(session.getAttribute("user") == null) {      
   %>    
          <script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
            top.location.href="toLogin.do";  
           </script>   
   <%    
       }    
   %>
    <header class="header text-right" id="js-u-m-header">
        <img class="header-logo pull-left" src="<%=basePath %>img/small-logo.png" alt="logo">
        <div class="btn-action">
        <c:if test='${sessionScope.user.position=="管理员"}'>
            <a href="toUserMge.do" class="btn btn-primary"><i class="fa fa-user-o"></i>用户管理</a>
            <a href="toAddCamp.do" class="btn btn-primary ml10"><i class="fa fa-plus"></i>添加训练营</a>
         </c:if>  
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${sessionScope.user.name}<span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="tochangePwd.do"><i class="fa fa-edit"></i>修改密码</a></li>
                    <li><a href="logOut.do"><i class="fa  fa-sign-out"></i>退出登录</a></li>
                </ul>
            </div>
            <a href="index.do"  class="btn btn-primary ml10 index-back" ><i class="fa fa-angle-left"></i>返回</a>
        </div>
    </header>
    <div class="row">
        <div class="create-wrap">
        <form action="toChgCamp.do"method="post">
            <input type="hidden" name="id" id="" value="${camp.id }"/>
            <div class="input-bg mt20">
                <span>教 师 编 号：</span>
                <input type="text" class="input-txt" name="classroomNumber" value="${camp.classroomNumber }"  placeholder="请输入教师编号">
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
                <span>班 级 人 数：</span>
                <input type="text" class="input-txt" name="cadetNumber" value="${camp.cadetNumber==null?0:camp.cadetNumber }" placeholder="0" readonly="readonly">
            </div>
            <div class="input-bg">
                <span>班 级 类 型：</span>
                <input type="text" class="input-txt" name="classType" value="${camp.classType }" placeholder="请输入班级类型">
            </div>
            <div class="text-center mt20">
                <input type="submit" class="btn btn-primary mr20" value='${requestScope.camp==null?"创建":"修改"}'>
                <a href="index.do" class="btn btn-primary ml20">取消</a>
            </div>
            </form>
        </div>
    </div>
</div>
</div>

<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath %>plugins/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=basePath %>js/nicescroll.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<!-- <script>
    $(function () {
        //日历控件
        var data=new Date();
        $(".form-datetime").datetimepicker({
            format: 'yyyy-mm-dd',//显示的日期时间格式,
            language: 'zh-CN',//中文
            autoclose:true,//自动关闭
            todayBtn: true,
            minView:2,
            startData:data
        });
    });
</script> -->
</body>
</html>