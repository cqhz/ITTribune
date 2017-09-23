package util;

import java.sql.*;

public class DBHelper {

	// 数据库驱动类型
	private static final String Driver = "com.mysql.jdbc.Driver";
	// 数据库地址
	private static final String url = "jdbc:mysql://localhost:3306/jd?useUnicode=true&characterEncoding=utf8";
	// 用户
	private static final String user = "root";
	// 密码
	private static final String pwd = "123456";
	private static Connection conn = null;
	// 静态代码块负责加载驱动
	static {
		try {
			Class.forName(Driver);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// 单例模式返回数据库连接对象
	public static Connection getConnection() throws Exception {
		if (conn == null) {
			conn = DriverManager.getConnection(url, user, pwd);
			return conn;
		}
		return conn;
	}

	public static void main(String[] args) {
		try {
			Connection conn = DBHelper.getConnection();
			if (conn != null) {
				System.out.println("数据库连接成功");
			} else {
				System.out.println("数据库连接异常");
			}
		} catch (Exception ex) {
			ex.getStackTrace();
		}
	}
	
	public boolean shanchu(int a) throws SQLException{
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
	 	rs=(ResultSet)stmt.executeQuery("delete * from ftable where id=a");
	 	}catch(SQLException ex)
	 	{
	 	   System.err.println("数据库查错误:"+ex);
	 	}
	 
	 	
	 		rs.close();
	   	  stmt.close();
	   	  conn.close();
		 
		 return true;
	 }
}
