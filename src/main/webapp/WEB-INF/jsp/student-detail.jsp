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
    <title>创建学员</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <link rel="stylesheet" href="<%=basePath %>css/base/base.css">
    <link rel="stylesheet" href="<%=basePath %>core/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/common.css">
    <link rel="stylesheet" href="<%=basePath %>css/add-training-camp/add-training-camp.css">
    <link rel="stylesheet" href="<%=basePath %>css/user-manager/user-manager.css">
    <link rel="stylesheet" href="<%=basePath %>css/base/reset.css">
    <link rel="stylesheet" href="<%=basePath %>css/add-student/add-student.css">
    <link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body class="add-student-bg">
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
<div class="clearfix student-wrap container">
    <header class="header text-right " id="js-u-m-header">
        <img class="header-logo pull-left" src="<%=basePath %>img/small-logo.png" alt="logo">
        <div class="btn-action">
        <c:if test='${sessionScope.user.position=="管理员"}'>
            <a href="toUserMge.do" class="btn btn-primary"><i class="fa fa-user-o"></i>用户管理</a>
            <a href="toAddCamp.do" class="btn btn-primary ml10"><i class="fa fa-plus"></i>添加训练营</a>
         </c:if>  
            <div class="btn-group">
                <button type="button" id="staffId" class="btn btn-primary dropdown-toggle" data-id='${sessionScope.user.id}' data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
    <div class="mt30 w clearfix">
        <div class="seat  col-xs-12">
            <h2 class="text-center seat-title mb30 mt30">座位表</h2>

            <div class="list-unstyled seat-list clearfix" id="js-seat-list">
                <ul class="seat-left pull-left list-unstyled" id="js-seat-left">
                </ul>
                <ul class="seat-right pull-right list-unstyled" id="js-seat-right">
                </ul>

            </div>
        </div>
        <div class="student-detail col-xs-12">
            <h2 class="text-center mb30 mt30 student-info-title js-info-title">学员详细信息</h2>
            <section id="js-student-detail">
                <div class="student-detail-txt">
                    <span>座位编号：</span>
                    <input type="text"  class="js-seat-num" disabled>
                </div>
                <input type="hidden" name="id"  id="id"/>
                <div class="hidden js-select-stage mb10">
                    <span class="w100 text-right " style="display: inline-block">学员类型：</span>
                    <select class="dropdown js-student-type">
                        <option value="">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                </div>
                <div class="student-detail-txt">
                    <span>学员姓名：</span>
                    <input type="text" class="js-student-name" maxlength="4" placeholder="给我个账号" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>咨询师：</span>
                    <input type="text" class="js-teacher-name" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>学&emsp;&emsp;历：</span>
                    <input type="text"  class="js-certificate" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>专&emsp;&emsp;业：</span>
                    <input type="text"  class="js-major" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>是否有基础：</span>
                    <input type="text"  class="js-is-primary" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>信息来源：</span>
                    <input type="text"  class="js-source" disabled>
                </div>
                <div class="hidden js-select-stage " >
                    <span class="w100 text-right " style="display: inline-block">信息来源：</span>
                    <select class="dropdown " id="tt">
                        <option value="求职">求职</option>
                        <option value="竞价">竞价</option>
                        <option value="口碑">口碑</option>
                    </select>
                </div>
                <div class="student-detail-txt">
                    <span>面资情况：</span>
                    <input type="text" class="js-situation" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>学习时长：</span>
                    <input type="text"  class="js-study-time" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>阶&emsp;&emsp;段：</span>
                    <input type="text"  class="js-stage" disabled>

                </div>
                <div class="hidden js-select-stage " >
                    <span class="w100 text-right " style="display: inline-block">阶&emsp;&emsp;段：</span>
                    <select class="dropdown " id="dd">
                        <option value="试听">试听</option>
                        <option value="关单">关单</option>
                        <option value="报名">报名</option>
                        <option value="缴费">缴费</option>
                    </select>
                </div>
                <div class="mt30 text-center">
                	<c:if test='${sessionScope.user.position=="课程顾问"}'>
                    <button class="btn btn-primary b  btn-sm" id="js-edit-seat-info"><i class="edit-icon"></i>编辑订座</button>
                   	</c:if>
                   	<c:if test='${sessionScope.user.position!="管理员"}'>
                    <button class="btn btn-danger  btn-sm" id="js-del-seat-info"><i class="cancel-seat-icon"></i>取消订座</button>
                	</c:if>
                </div>
            </section>
        </div>
    </div>
</div>
<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>plugins/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath %>js/nicescroll.js"></script>
<script src="<%=basePath %>js/student-detail.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script>
    $(function () {
        //日历控件
       /*  var data = new Date();
        $(".js-study-time").datetimepicker({
            format: 'yyyy-mm-dd ',//显示的日期时间格式,
            language: 'zh-CN',//中文
            autoclose:true,//自动关闭
            todayBtn: true,
            minView:2,
            startData:data
        }); */

        //获取下拉框选中的值
        $(".js-student-type").change(function () {
            var studentTypeVal = $(this).children('option:selected').val();
            console.log(studentTypeVal);
        })
        
        $("#dd").change(function () {
            var selectStageVal = $("#dd").children('option:selected').val();
            console.log(selectStageVal);
        })
        
       /*  console.log($("form").serialize()); */
       /*  $.ajax({
        	url:'',
        	type:"POST",
        	data:{
        		$("form").serialize()
        	},
        })   */
    });
</script>
</body>
</html>