<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%  
   request.setCharacterEncoding("UTF-8");  
   response.setCharacterEncoding("UTF-8");  
   response.setContentType("text/html; charset=utf-8");  
%>
<html>
<head>
<title>add message into table</TITLE>
</head>
<body>
<%
	String username = request.getParameter("username"); //从表单获得 
	String password = request.getParameter("password"); //从表单获得 
	String eamil = request.getParameter("eamil"); //从表单获得 
	session.setAttribute("password", password);
	session.setAttribute("username", username);
	session.setAttribute("eamil", eamil);
	/** 连接数据库参数 **/
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/shopping?user=root&password=&useUnicode=true&characterEncoding=utf-8";
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url);
	PreparedStatement pstat = conn.prepareStatement("select * from user where username=?");
	pstat.setString(1, username);
	ResultSet rs = null;
	rs = pstat.executeQuery();
	if (rs.next()) {
        out.print("<script>alert(\"用户名已存在，请重新输入用户名\");window.history.go(-1);</script>"); 
	} else {
		out.print("<script>alert(\"注册成功！,请登录\");window.history.go(-1);</script>");
		String sql = "Insert into user(username,password,eamil) values(?,?,?)";
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, username);
		pstat.setString(2, password);
		pstat.setString(3, eamil);
		pstat.executeUpdate();
		pstat.close();
	}
	//关闭数据库连接  
	conn.close();
%>
</body>
</html>
