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
    <title>主页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <!--框架-->
    <link rel="stylesheet" href="<%=basePath %>core/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>plugins/bootstrap-dialog/bootstrap-dialog.min.css">
    <!--样式重置库-->
    <link rel="stylesheet" href="<%=basePath %>css/base/reset.css">
    <!--通用库-->
    <link rel="stylesheet" href="<%=basePath %>css/base/common.css">
    <!--基础库-->
    <link rel="stylesheet" href="<%=basePath %>css/base/base.css">
    <!--主页样式-->
    <link rel="stylesheet" href="<%=basePath %>css/index/index.css">
    <link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		.training-camp{
			background:#888;
		}
	</style>
</head>
<body class="index-bg">
<div class="container">
    <!--头部-->
    <header class="header">
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
        </div>
    </header>
    <section class="row index-content js-index-content index-active" id="js-camp1">
        <!--训练营-->
        <ul id='js-camp-ul' class="clearfix">
        
        </ul>

    </section>
</div>
<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-dialog/bootstrap-dialog.min.js"></script>
<script src="<%=basePath %>plugins/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=basePath %>js/nicescroll.js"></script>
<%-- <script src="<%=basePath %>js/index.js"></script> --%>
<script type="text/javascript">
$(function () {
    //加载训练营到主页面
    $.ajax({
    	 type: 'GET',
         url: 'findCamp.do',
         data: {},
         success: function (msg) {
             let html = '';
             for (var i = 0; i < msg.data.length; i++) {
                 var list = msg.data[i];
                 console.log(list);
                 html +=
                 "<li class='list-unstyled item1' >"+
                 "<section class='col-lg-3 col-md-6 col-sm-6 col-xs-12 index-item' data-id='"+list.id+"'>"+
                     "<div class='training-camp'>"+
                         "<div class='training-camp-img'></div>"+
                         "<div class='training-camp-title'>"+
                            " <h3 class='pull-left'>"+list.classType+"</h3>"+
                             "<div class='action text-right mr10'>"+
                                 "<a href='findIdCamp.do?id="+list.id+"' class='btn btn-primary'><i class='fa fa-edit'></i>编辑</a>"+
                                 "<button class='btn btn-danger js-del-train-camp' data-id='"+list.id+"'><i class='fa fa-trash'></i>删除</button>"+
                             "</div>"+
                         "</div>"+
                         "<div class='teacher'>"+
                             "<div class='row'>"+
                                 "<div class='col-xs-12 teacher-info text-left'>"+
                                     "<div class='teacher-item'>"+
                                         "<span class=''>讲 师 姓 名：</span>"+
                                         "<span class=''>"+list.teacherName+"</span>"+
                                     "</div>"+
                                     "<div class='teacher-item'>"+
                                         "<span class=''>讲 师 电 话：</span>"+
                                         "<span>"+list.teacherPhone+"</span>"+
                                     "</div>"+
                                     "<div class='teacher-item'>"+
                                         "<span class=''>所属产品线：</span>"+
                                         "<span>"+list.productLine+"</span>"+
                                    " </div>"+
                                     "<div class='teacher-item'>"+
                                         "<span class=''>创 建 时 间：</span>"+
                                         "<span>"+list.createdTime+"</span>"+
                                     "</div>"+
                                     "<div class='teacher-item'>"+
                                         "<span class=''>班 级 人 数：</span>"+
                                         "<span>"+list.cadetNumber+"</span>"+
                                     "</div>"+
                                 "</div>"+
                             "</div>"+
                        " </div>"+
                     "</div>"+
                " </section>"+
            " </li>";
             }
             $('#js-camp-ul').html(html);
             var con= '${sessionScope.user.position}';
             console.log(con);
             if(con !=="管理员"){
                 $(".action").hide();	
             }else{
             	 $(".action").show();
             }
             $(".index-item").click(function () {
            	 var id=$(this).attr('data-id');
         		location.href = "toCamp.do?id="+id;
         	 })
         	 //点击删除训练营
         	$(".js-del-train-camp").click(function (e) {
        		console.log(1111);
        		var This = $(this);
        		e.stopPropagation();
        		BootstrapDialog.show({
        			title: "删除训练营",
        			message: "确认删除此训练营?",
        			size: BootstrapDialog.SIZE_SMALL,
        			type: BootstrapDialog.TYPE_DANGER,
        			buttons: [
        			          {
        			        	  label: "取消", cssClass: "btn-default",
        			        	  action: function (cancel) {
        			        		  cancel.close();
        			        	  }
        			          }, {
        			        	  label: "确定", cssClass: "btn-primary",
        			        	  action: function (cancel) {
        			        		  var id=This.attr("data-id");
        			        		  location.href="toDelCamp.do?id="+id;
        			        		  cancel.close();
        			        	  }
        			          }]
        		});
        	});
         }
    });
});
</script>
</body>
</html>