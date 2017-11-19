<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
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
<div class="clearfix student-wrap">
    <header class="header text-right header-container">
        <img class="header-logo pull-left" src="<%=basePath %>img/small-logo.png" alt="logo">
      	<!-- <a href="index.do"type="button" class="btn btn-primary ml10">返回主页</a> -->
       <!--  <button class="btn btn-primary " id="js-change-room">切换教室类型</button> -->
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
                    <input type="text" value="0001" class="js-seat-num" disabled>
                </div>
                <div class="hidden js-select-stage mb10">
                    <span class="w100 text-right " style="display: inline-block">学员类型：</span>
                    <select class="dropdown js-student-type">
                        <option value="">请选择学员类型</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                </div>
                <div class="student-detail-txt">
                    <span>学员姓名：</span>
                    <input type="text" value="张飞" class="js-student-name" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>咨询师：</span>
                    <input type="text" value="刘备" class="js-teacher-name" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>学&emsp;&emsp;历：</span>
                    <input type="text" value="小学" class="js-certificate" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>专&emsp;&emsp;业：</span>
                    <input type="text" value="武术" class="js-major" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>是否有基础：</span>
                    <input type="text" value="是" class="js-is-primary" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>信息来源：</span>
                    <input type="text" value="google" class="js-source" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>面资情况：</span>
                    <input type="text" value="0001" class="js-situation" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>学习时长：</span>
                    <input type="text" value="3小时04分" class="js-study-time" disabled>
                </div>
                <div class="student-detail-txt">
                    <span>阶&emsp;&emsp;段：</span>
                    <input type="text" value="第二阶段" class="js-stage" disabled>

                </div>
                <div class="hidden js-select-stage ">
                    <span class="w100 text-right " style="display: inline-block">阶&emsp;&emsp;段：</span>
                    <select class="dropdown ">
                        <!--<option >请选择阶段</option>-->
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                        <option value="4">Option 4</option>
                    </select>
                </div>
                <div class="mt30 text-center">
                    <button class="btn btn-primary b  btn-sm" id="js-edit-seat-info"><i class="edit-icon"></i>编辑座位信息
                    </button>
                    <button class="btn btn-danger  btn-sm"><i class="cancel-seat-icon"></i>取消订座</button>
                    <button class="btn btn-danger  btn-sm"><i class="cancel-seat-icon"></i>移除该座位</button>
                </div>
            </section>
        </div>
    </div>
</div>
<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath %>plugins/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath %>js/nicescroll.js"></script>
<%-- <script src="<%=basePath %>js/add-student.js"></script> --%>
<script src="<%=basePath %>js/student-detail.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
$(function () {
    //日历控件
    $(".js-study-time").datetimepicker({
        format: 'yyyy-mm-dd',//显示的日期时间格式,
        language: 'zh-CN',//中文
        autoclose:true,//自动关闭
        todayBtn: true,
    });
    //获取下拉框选中的值
    $(".js-student-type").change(function () {
        var studentTypeVal = $(this).children('option:selected').val();
//        console.log(studentTypeVal);
    })
});
</script>
</body>
</html>