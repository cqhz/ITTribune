package com.po;
import java.sql.*;
public class UsersDao {
    public boolean usersLogin(Users u) throws SQLException{
    	String username="root";//���ݿ��û���
    	String password="123456";//���ݿ�����
    	boolean a=false;
    	//jsp�����а������ϵ�Exception��NonePointerException,����������ʱ����һ����ʼֵ�������̵���ʱ��
    	ResultSet rs=null;//���ݿ��ѯ�����
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
    	  System.err.println("���ݿ����Ӵ���:"+e.getMessage());
    	}
    	try
    	{
    	rs=(ResultSet)stmt.executeQuery("select * from admin");
    	}catch(SQLException ex)
    	{
    	   System.err.println("���ݿ�����:"+ex);
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
