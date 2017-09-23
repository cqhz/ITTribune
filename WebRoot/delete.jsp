<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>正在删除</title>
    
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
    <%
   String a=request.getParameter("id");
   int b=new Integer(a);
String username="root";//数据库用户名
String password="123456";//数据库密码

//jsp程序中半数以上的Exception是NonePointerException,在声明变量时赋予一个初始值，能缩短调试时间
int rs=0;//数据库查询结果集
Connection conn=null;
Statement stmt=null;
try
{
  Class.forName("com.mysql.jdbc.Driver");
}catch(java.lang.ClassNotFoundException e)
{
  System.err.println("Driver Error"+e.getMessage());
}
String url="jdbc:mysql://182.254.145.68:3306/ruipinft";
try
{
conn=DriverManager.getConnection(url,username,password);
stmt=(Statement)conn.createStatement();
}catch(Exception e)
{
  System.err.println("数据库连接错误:"+e.getMessage());
}
try
{
rs= stmt.executeUpdate("delete from ftable where id=\'"+b+"\'");
  //rs.close();
  stmt.close();
  conn.close();
}catch(SQLException ex)
{
   System.err.println("数据库查错误:"+ex);
}

%>
<script>
window.onload=function(){
 window.location="Success.jsp";
}
</script>
  </body>
</html>
