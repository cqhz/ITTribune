<%@ page language="java" import="java.util.*" import="java.sql.*" import="net.sf.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("UTF-8");
String username="root";//数据库用户名
String password="123456";//数据库密码
String key = request.getParameter("search-text"); 
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
String []  words = new String[100];
int i=0;
try
{
rs=(ResultSet)stmt.executeQuery("select tittle from ftable ");
}catch(SQLException ex)
{
   System.err.println("数据库查错误:"+ex);
} 
while(rs.next()){
      
   words[i]=rs.getString("tittle");
   if(i == 99){
   	return;
   }
    i++;
}
  rs.close();
  stmt.close();
  conn.close();
if(request.getParameter("search-text") != null) { 

	if(key.length() != 0){ 
		String json="["; 
		for(int j = 0; j < i-1; j++) { 
			
			if(words[j].startsWith(key)){ 
				json += "\""+ words[j] + "\"" + ","; 
			} 
		} 
		
json = json.substring(0,json.length()-1>0?json.length()-1:1); 
json += "]"; 
out.println(json); 
} 
}
%> 
