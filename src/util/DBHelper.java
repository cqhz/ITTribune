package util;

import java.sql.*;

public class DBHelper {

	// ���ݿ���������
	private static final String Driver = "com.mysql.jdbc.Driver";
	// ���ݿ��ַ
	private static final String url = "jdbc:mysql://localhost:3306/jd?useUnicode=true&characterEncoding=utf8";
	// �û�
	private static final String user = "root";
	// ����
	private static final String pwd = "123456";
	private static Connection conn = null;
	// ��̬����鸺���������
	static {
		try {
			Class.forName(Driver);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// ����ģʽ�������ݿ����Ӷ���
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
				System.out.println("���ݿ����ӳɹ�");
			} else {
				System.out.println("���ݿ������쳣");
			}
		} catch (Exception ex) {
			ex.getStackTrace();
		}
	}
	
	public boolean shanchu(int a) throws SQLException{
		 String username="root";//���ݿ��û���
	 	String password="123456";//���ݿ�����
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
	 	String url="jdbc:mysql://182.254.145.68:3306/ruipinft";
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
	 	rs=(ResultSet)stmt.executeQuery("delete * from ftable where id=a");
	 	}catch(SQLException ex)
	 	{
	 	   System.err.println("���ݿ�����:"+ex);
	 	}
	 
	 	
	 		rs.close();
	   	  stmt.close();
	   	  conn.close();
		 
		 return true;
	 }
}
