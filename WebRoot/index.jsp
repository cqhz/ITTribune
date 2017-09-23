<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>App后台管理系统</title>

<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="in.js"></script>
</head>
<body>


<div class="login">
    <div class="box png" id="box">
		<div class="logo png"></div>
		<div class="input" id="input">
			<div class="log">
			<form action="dologin.jsp" name="loginform" method="post">
				<div class="name">
					<label>用户名</label><input type="text" class="text" id="value_1" placeholder="用户名" name="value_1" tabindex="1">
				</div>
				<div class="pwd">
					<label>密　码</label><input type="password" class="text" id="value_2" placeholder="密码" name="value_2" tabindex="2">
					<input type="submit" class="submit" tabindex="3" value="登录">
					</form>
					<div class="check"></div>
				</div>
				<div class="tip"></div>
			</div>
		</div>
	</div>

    <div class="footer"></div>
</div>


</body>
</html>
