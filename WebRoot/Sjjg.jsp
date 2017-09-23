<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理系统</title>
    <style type="text/css"> 
#search{ 
text-align: center; 
position:absolute; 
top:130px;
left:800px;
} 
.autocomplete{ 
border: 1px solid #9ACCFB; 
background-color: white; 
text-align: left; 
} 
.autocomplete li{ 
list-style-type: none; 
} 
.clickable { 
cursor: default; 
} 
.highlight { 
background-color: #9ACCFB; 
} 
</style> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="jquery-1.6.js"  charset="UTF-8"></script>
<script type="text/javascript" src="jq.js"  charset="UTF-8"></script>
<script type="text/javascript" src="ajax.js"></script>
  </head>
<body>

<div class="nav-top">
	<span>IT客后台管理系统</span>
    <div class="nav-topright">
    	
        <span>欢迎您，admin</span><span><a href="index.jsp">注销</a></span>
    </div>
</div>
<div id = "search"> 
<form action="test.jsp" method="post">
<label for="search-text">请输入标题</label><input type="text" id="search-text" name="search-text" /> 
<input type="submit" id="submit" value="搜索" onclick="tz()"/> 
</form>
</div> 
<div class="nav-down">
	<div class="leftmenu1">
        <div class="menu-oc"><img src="images/a.png" /></div>
    	<ul>
           <li>
            	<a class="a_list a_list1">专业技术</a>
                <div class="menu_list">
                	<a href="Success.jsp">网络技术</a>
                    <a href="Ydwl.jsp">移动开发</a>
                    <a href="Java.jsp">JAVA2E</a>
                    <a href="Czxt.jsp">操作系统</a>
                </div>
            </li>
            <li>
            	<a class="a_list a_list2">专业基础</a>
                <div class="menu_list">
                	<a href="Sx.jsp">数学</a>
                    <a href="Bcyy.jsp">编程语言</a>
                    <a href="Sjjg.jsp">数据结构</a>
                </div>
            </li>
            <li>
            	<a class="a_list a_list3">休闲娱乐</a>
                <div class="menu_list">
                	
                    <a href="Xybg.jsp">校园八卦</a>
                     <a href="Wt.jsp">问题帖</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="leftmenu2">
    	<div class="menu-oc1"><img src="images/logo2.png" /></div>
        <ul>
        	<li>
            	<a class="j_a_list j_a_list1"></a>
                <div class="j_menu_list j_menu_list_first">
                	<span class="sp1"><i></i>专业技术</span>
                	<a class="j_lista_first" href="Success.jsp">网络技术</a>
                    <a href="Ydwl.jsp">移动开发</a>
                    <a href="Java.jsp">JAVA2E</a>
                    <a href="Czxt.jsp">操作系统</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list2"></a>
                <div class="j_menu_list">
                	<span class="sp2"><i></i>专业基础</span>
                	<a href="Sx.jsp">数学</a>
                    <a href="Bcyy.jsp">编程语言</a>
                    <a href="Sjjg.jsp">数据结构</a>
                    
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list3"></a>
                <div class="j_menu_list">
                	<span class="sp3"><i></i>休闲娱乐</span>
                	
                    <a href="Xybg.jsp">校园八卦</a>
                     <a href="Wt.jsp">问题帖</a>
                </div>
            </li>
        </ul>
        
    </div>
    <div class="rightcon">
    	<div class="right_con">
        
        
        	<p style="text-align:left; margin-top:50px;margin-left:300px;font-size:30px">用户论坛管理</p>
        	<p></p>
<%
String username="root";//数据库用户名
String password="123456";//数据库密码

//jsp程序中半数以上的Exception是NonePointerException,在声明变量时赋予一个初始值，能缩短调试时间
ResultSet rs=null;//数据库查询结果集
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
rs=(ResultSet)stmt.executeQuery("select * from ftable where family='sjjg'");
}catch(SQLException ex)
{
   System.err.println("数据库查错误:"+ex);
}
%>

<table style="width:95%; border:1px white solid;">
  <tr bgcolor="#4F81BD"style="color: #fff;">
    <td> ID</td>
    <td>用户名</td>
    <td>账号</td>
    <td> 标题</td>
  </tr>
 
<%
  //利用while循环输出各条记录
   int i=0;
  while(rs.next())
  {
   i++;
%>
<tr bgcolor="#4F81BD"style="color: #fff;">
   <td id="ID<%=i %>"><%=rs.getString("id") %></td>   
  <td><%=rs.getString("usename")%></td>   
   <td> <%=rs.getString("account")%></td>   
  <td><%=rs.getString("tittle")%></td>
  <td class="biaoge"><input type="button" value="删除"  onclick="huoqu<%=i %>()"></td>
  <td class="biaoge"> <input type="button" value="详情" onclick="xiangqing<%=i %>()"></td>   
</tr>

<script>
function huoqu<%=i %>(){
if(window.confirm('你确定删除吗？')){
            
              }else{
                
                 return false;
             }
var b=document.getElementById("ID<%=i %>").valueOf().innerHTML;

window.location="delete.jsp?id="+b;
}
</script>
<script>
function xiangqing<%=i %>(){
      var b=document.getElementById("ID<%=i %>").valueOf().innerHTML;
      window.location="xiangqing.jsp?id="+b;

}
</script>
<%
}

%>
</table>

<%
  rs.close();
  stmt.close();
  conn.close();
  %>
        </div>
    </div>
</div>
</body>
</html>
