<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
 %>
<jsp:useBean id="loginUser" class="com.po.Users" scope="page"/>
<jsp:useBean id="UsersDao" class="com.po.UsersDao" scope="page"/>
<jsp:setProperty property="*" name="loginUser"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
  if(UsersDao.usersLogin(loginUser)){
      session.setAttribute("loginUser",loginUser.getValue_1());
      request.getRequestDispatcher("Success.jsp").forward(request, response);
  }
  else
  {
    response.sendRedirect("Failure.jsp");
  }
   
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dologin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h1>登陆成功</h1>
    <br>
     
  </body>
</html>
