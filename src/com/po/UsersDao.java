package com.po;
import java.sql.*;
public class UsersDao {
    public boolean usersLogin(Users u) throws SQLException{
    	String username="root";//数据库用户名
    	String password="123456";//数据库密码
    	boolean a=false;
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
    	String url="jdbc:mysql://182.254.145.68:3306/ruipinuser";
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
    	rs=(ResultSet)stmt.executeQuery("select * from admin");
    	}catch(SQLException ex)
    	{
    	   System.err.println("数据库查错误:"+ex);
    	}
    	while(rs.next()){
    	if(rs.getString("name").equals(u.getValue_1())&&rs.getString("scrert").equals(u.getValue_2())){
    	  rs.close();
      	  stmt.close();
      	  conn.close();
    		a=true;
    		break;
    	 } 	
    	  
    	}
    	return a;
    }
 
}
