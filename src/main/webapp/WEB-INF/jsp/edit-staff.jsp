<%@page   pageEncoding="utf-8"   contentType="text/html; charset=utf-8" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib   prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--添加员工dialog-->
<div class="form-horizontal">
<form action='toChgStaff.do' method="post" id="formPost">
    <input type="hidden" name="id"  value="${staff.id }"/> 
    <div class="form-group">
        <label for="uname" class="col-sm-4 control-label">姓&emsp;&emsp;名:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="name" value="${staff.name }" placeholder="给我个名字">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label">性&emsp;&emsp;别:</label>
        <div class="col-sm-8">
            <label class="radio-inline">
                <input type="radio" name="sex" <c:if test="${staff.sex=='男'}"> checked='checked'</c:if>  value="男"> 男
            </label>
            <label class="radio-inline">
                <input type="radio" name="sex" <c:if test="${staff.sex=='女'}"> checked='checked'</c:if> value="女"> 女
            </label>
            <label class="radio-inline">
                <input type="radio" name="sex" <c:if test="${staff.sex=='保密'}"> checked='checked'</c:if>  value="保密"> 保密
            </label>
        </div>
    </div>
     <div class="form-group">
        <label for="login-account" class="col-sm-4 control-label" >登录账号:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="account" value="${staff.account }" placeholder="给我个账号">
        </div>
    </div>
    <div class="form-group">
        <label for="login-pwd" class="col-sm-4 control-label">登录密码:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="password" value="${staff.password }"placeholder="给我个密码">
        </div>
    </div>
    <div class="form-group">
        <label for="job" class="col-sm-4 control-label">职&emsp;&emsp;位:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="position" value="${staff.position }" placeholder="给我个职位">
        </div>
    </div>
     <div class="form-group">
        <label for="technical-direction" class="col-sm-4 control-label">技术方向:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="skillDirection" value="${staff.skillDirection }"
                   placeholder="我是学什么的">
        </div>
    </div>
    <div class="form-group">
        <label for="entry-time" class="col-sm-4 control-label">入职时间:</label>
        <div class="col-sm-8">
        	<fmt:formatDate value="${staff.entryTime }" pattern="yyyy-MM-dd" var="time"/>
            <input type="text" class="form-control form-datetime"  name="entryTime" value="${time }" placeholder="我什时候进来的">
        </div>
    </div> 
   <div class="form-group">
        <label for="relution" class="col-sm-4 control-label">部&emsp;&emsp;门:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="deptno" value="${staff.deptno }"
                   placeholder="我属于哪里">
        </div>
    </div>
	
    <div class="form-group">
        <label for="staff-num" class="col-sm-4 control-label">员&nbsp;&nbsp;工&nbsp;&nbsp;号:</label>
        <div class="col-sm-8">
            <input type="number" class="form-control" name="enumber" value="${staff.enumber }" placeholder="给我个编号" require>
        </div>
    </div>
    
    <div class="form-group">
        <label for="phone" class="col-sm-4 control-label">联系电话:</label>
        <div class="col-sm-8">
            <input type="phone" class="form-control" name="userPhone" value="${staff.userPhone }"placeholder="我的电话是什么" require>
        </div>
    </div>
     <div class="form-group">
        <label for="email" class="col-sm-4 control-label">邮&emsp;&emsp;箱:</label>
        <div class="col-sm-8">
            <input type="email" class="form-control" name="email"value="${staff.email }" placeholder="我的易麦鸥是什么">
        </div>
    </div> 
     
    </form>
</div>

<script src="<%=basePath %>core/jquery-1.11.3.js"></script>
<script src="<%=basePath %>core/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath %>plugins/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=basePath %>js/nicescroll.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
//提交表单
$(".btn-primary").click(function(){
	postForm();
})
function postForm(){
	document.getElementById("formPost").submit();
}
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


</script>
