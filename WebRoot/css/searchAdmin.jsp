<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
%>

<%
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/shopping?user=root&password=&useUnicode=true&characterEncoding=utf-8";
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url);

	//建立一个Statement对象，用于执行SQL语句  

	//执行查询并得到查询结果  
	String NAME = request.getParameter("SP_NAME"); //从表单获得 
	String sql = "select * from shop WHERE SP_NAME LIKE '%" + NAME + "%'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(sql);
%>
