<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>修改密码</title>
    <!--框架-->
    <link rel="stylesheet" href="<%=basePath %>core/bootstrap/bootstrap.css">
    <!--样式重置库-->
    <link rel="stylesheet" href="<%=basePath %>css/base/reset.css">
    <!--通用库-->
    <link rel="stylesheet" href="<%=basePath %>css/base/common.css">
    <!--基础库-->
    <link rel="stylesheet" href="<%=basePath %>css/base/base.css">
    <link rel="stylesheet" href="<%=basePath %>css/modify-password/modify-password.css">
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
<div class="container ">
    <header class="header">
        <img class="header-logo pull-left" src="<%=basePath %>img/small-logo.png" alt="logo">
        <div class="btn-action pull-right">
         <c:if test='${sessionScope.user.position=="管理员"}'>
            <a href="toUserMge.do" class="btn btn-primary"><i class="fa fa-user-o"></i>用户管理</a>
            <a href="toAddCamp.do" class="btn btn-primary ml10"><i class="fa fa-plus"></i>添加训练营</a>
         </c:if>
            <div class="btn-group">
                <button type="button" id="staffId"  class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-id='${sessionScope.user.id}'>
                    ${sessionScope.user.name}<span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="tochangePwd.do"><i class="fa fa-edit"></i>修改密码</a></li>
                    <li><a href="logOut.do"><i class="fa  fa-sign-out"></i>退出登录</a></li>
                </ul>
            </div>
        </div>
    </header>
    <div class="row">
        <div class="modify-password ">
            <form class="js-validation-material" id="form-modify-password">
                <img class="modify-password-logo" src="<%=basePath %>img/small-logo.png" alt="">
                <div class="form-group">
                    <label for="old-password">旧密码：</label>
                    <input type="text" class="form-control" name="oldPwd" id="old-password" placeholder="请输入旧密码"
                           autofocus  minlength="6" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="new-password">新密码：</label>
                    <input type="password" class="form-control  input-pwd" id="new-password" name="newPwd"
                           placeholder="请输入新密码" minlength="6" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="conform-password">确认密码：</label>
                    <input type="password" class="form-control  input-pwd" id="conform-password" name="conformPwd"
                           placeholder="请输入确认密码" minlength="6" maxlength="20"></div>
                <button type="button" class="btn btn-primary" id="changePwd">确认</button>
                <a type="button" class="btn btn-default " href="index.do">取消</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.js"></script>
<script src="<%=basePath %>plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="<%=basePath %>js/login-form.js"></script>
<script>
    $(function () {
    	$('#changePwd').on('click',function(){
    		var url="realChange.do";
    		var params={
    			"id":$("#staffId").attr("data-id"),
    			"oldPwd":$('#old-password').val(),
    			"newPwd":$('#new-password').val()	
    		}
    		console.log(params);
    		 $.post(url,params,function(result){ 
    			 if(result.state==1){
    				location.href="index.do";
    			}
    		}) 
    	});
        jQuery('#form-modify-password').validate({
            errorClass: 'help-block text-right animated fadeInDown',
            errorElement: 'div',
            errorPlacement: function (error, e) {
                jQuery(e).parents('.form-group').append(error);
            },
            highlight: function (e) {
                jQuery(e).closest('.form-group').removeClass('has-error').addClass('has-error');
                jQuery(e).closest('.help-block').remove();
            },
            success: function (e) {
                jQuery(e).closest('.form-group').removeClass('has-error');
                jQuery(e).closest('.help-block').remove();
            },
            rules: {
                'oldPwd': {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                'newPwd': {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                'conformPwd': {
                    required: true,
                    equalTo: '#new-password'
                }
            },
            messages: {
                'oldPwd': {
                    required: '旧密码不能为空',
                    minlength: '密码不能小于6个字符',
                    maxlength: '密码不能大于30个字符'
                },
                'newPwd': {
                    required: '新密码不能为空',
                    minlength: '密码不能小于6个字符',
                    maxlength: '密码不能大于20个字符'
                },
                conformPwd: '两次输入的密码不相同'
            }
        });
    });
</script>