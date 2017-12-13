<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <link rel="stylesheet" href="<%=basePath %>css/base/base.css">
    <link rel="stylesheet" href="<%=basePath %>core/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>plugins/bootstrap-dialog/bootstrap-dialog.min.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/common.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/reset.css">·
    <link rel="stylesheet" href="<%=basePath %>css/user-manager/user-manager.css">
    <link href="<%=basePath %>plugins/iChecks/skins/square/blue.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
</head>

<body class="index-bg">
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
<div class="container">
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
    <div class="wrap" id="js-wrap">
        <div class="user-manager-action text-right" id="js-user-manager">
            <button class="btn btn-primary" id="js-add-staff">添加员工</button>
            <button class="btn btn-danger js-batch-del">全部删除</button>
        </div>
        <div class="table-responsive" id="js-table-responsive">
            <table class="table table-hover  table-bordered table-condensed" id="js-table">
                <thead>
                <tr>
                    <th>
                        <div>
                            <input type="checkbox" class="js-all-select">
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
                <tbody class="js-tbody">
                
                </tbody>
            </table>

        </div>
        <div class="text-right" id="js-pagination">
            <ul class="pagination page " id="pageId">
                <li><a class="first">首页</a></li>
                <li><a class="pre">上一页</a></li>
                <li><a class="next">下一页</a></li>
                <li><a class="last">尾页</a></li>
                <li><a class="pageCount">总页数(1)</a></li>
                <li><a class="pageCurrent">当前页(1)</a></li>
            </ul>
        </div>
    </div>
</div>

<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.js"></script>
<script src="<%=basePath %>plugins/bootstrap-dialog/bootstrap-dialog.min.js"></script>
<script src="<%=basePath %>plugins/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=basePath %>js/nicescroll.js"></script>
<script src="<%=basePath %>plugins/iChecks/js/icheck.js"></script>
<script src="<%=basePath %>js/user-manager.js"></script>

<!--<script src="core/bootstrap-table/bootstrap-table.js"></script>-->
<script>
    window.onload = function () {
        var wrap = document.querySelector("#js-wrap");
        var header = document.querySelector("#js-u-m-header");
        var page = document.querySelector("#js-pagination");
        var table = document.querySelector("#js-table-responsive");
        var userManager = document.querySelector("#js-user-manager");
        //屏幕高度
        var screenH = document.body.clientHeight || document.documentElement.clientHeight;
        //头部高度
        var headerH = header.clientHeight;
        var userManagerH = userManager.clientHeight;
        var pageH = page.clientHeight;

        function getTableH() {
            table.style.height = screenH - headerH - userManagerH - pageH - 60 + "px";
            wrap.style.height = screenH - headerH - 30 + "px";
        }

        getTableH();
        window.onresize = getTableH;
    };
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
        //自定义输入框样式
        $(("#js-table input")).iCheck({
            checkboxClass: 'icheckbox_square-blue',
        });
    });

</script>
</body>
</html>