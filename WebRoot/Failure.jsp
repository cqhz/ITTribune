<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href=" <%= basePath %> ">
    <title>My JSP 'Login.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/Failure.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
<div class="img"></div>
<div class="txt">
    <hr>
   登录失败，请检查用户名或密码!
   <a href="index.jsp">返回登录</a>
    <br>
  </div>
  </body>
</html>
