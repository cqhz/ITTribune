<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%
   String a=request.getParameter("id");
    int b=new Integer(a);
String username="root";//数据库用户名
String password="123456";//数据库密码
//jsp程序中半数以上的Exception是NonePointerException,在声明变量时赋予一个初始值，能缩短调试时间
ResultSet rs=null;//数据库查询结果集
ResultSet rs1=null;
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
rs=(ResultSet)stmt.executeQuery("select * from ftable where id=\'"+b+"\'");
}catch(SQLException ex)
{
   System.err.println("数据库查错误:"+ex);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>详情</title>
<style type="text/css">
a:link{color:#000}
a:visited{color:#000}
body {
background-image:url("./images/beijing.jpg");
}
</style>
</head>

<body>

<image src="./images/tianjia.jpg" style="z-index:-1;position:absolute;left:60px;"></image>
<table width="1024"  border="0" align="right" cellpadding="1" cellspacing="1" rules="none">

<tr>
  <td height="186" colspan="3" align="center" scope="col" > <h1>标题:<% 
while(rs.next()){
%>
  <%=rs.getString("tittle")%></h1> </td><% %>
  </tr>
  <tr>
  <td height="400" width="450" style="position:absolute;top:100px;right:250px;letter-spacing: 8px; line-height: 22px; font-size:20px; "><h4>帖子：</h4><%=rs.getString("content") %>
  <br><br><br>
</td>
  </tr>
  
<tr>
  <td width="353" height="400" valign="top">
 
 <p class="p2">ID:</p><%=rs.getString("id") %><p>
<br />
 <p class="p2">用户名:</p><%=rs.getString("usename")%><p>
<br />
<p class="p2">账号:</p><%=rs.getString("account")%><p>
<br />
<p class="p2">类型:</p><%=rs.getString("family") %><p>
<br />
   

 <td >

</td>
  </tr>

</table>
<%
} %>
<table style="width:40%; height:60px;text-align:center; border:1px white solid; position:absolute;top:600px;right:200px">
<%


  rs1=(ResultSet)stmt.executeQuery("select * from gztable where mainid=\'"+b+"\'");
while (rs1.next()){ %>
<tr bgcolor="#C7C7E2" style="color: #484891;">
  <h4 style="position:absolute;top:540px;right:638px">回&nbsp帖:</h4><td><%=rs1.getString("hfcontent")%></td>
</tr>
<%} %>
</table>
<%

rs.close();
conn.close();
stmt.close();
 %>
</body>
</html>