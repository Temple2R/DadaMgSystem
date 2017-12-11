<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<html>
	<head></head>
	<body style="font-size: 30px;">
			<form action="doFindPageObjects.do?pageCurrent=1" method="post">
			<fieldset>
				<legend>登录</legend>
				用户名：<input name="username"/>
				<br/>
				密   码：<input type="password" name="password"/>
				<br/>
				<input type="submit" value="确定"/>
			</fieldset>
		</form>
	</body>
</html>