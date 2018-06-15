<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.io.*" 
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%
/**
协议头四行内容
45 -----------------------------7de231211204c4 
80 Content-Disposition: form-data; name="file"; filename="xx.txt" 
26 Content-Type: text/plain 
2 
标记文件结尾
-----------------------------7de231211204c4--
**/
	ServletInputStream sin = request.getInputStream();
	byte[] buffer = new byte[1024 * 8];
	int length = 0, row = 0;
	String mark = "";
	String filename = "";
	while ((length = sin.readLine(buffer, 0, buffer.length)) > 0) {
		out.println(length + "    " + new String(buffer, 0, length, "UTF-8") + "<br>");
		String s = new String(buffer, 0, length, "UTF-8");
		if (row == 0)
			mark = s.trim();
		else if (s.indexOf("filename=") > 0) {
			int end = s.lastIndexOf("\"");
			int start = s.substring(0, end).lastIndexOf("\"");
			filename = s.substring(start + 1, end);
		} else if ("".equals(s.trim()))
			break;
		row ++;
	}
	
	String PathPic= "img/" + filename;
	filename = request.getRealPath("/") + "img/" + filename;
	FileOutputStream fout = new FileOutputStream(filename);
	while ((length = sin.readLine(buffer, 0, buffer.length)) > 0) {
		String s = new String(buffer, 0, length);
		if (s.startsWith(mark))
			break;
		fout.write(buffer, 0, length);
	}
	fout.flush();
	fout.close();
	File f = new File(filename);

	
%>
<%
	String NAME = request.getParameter("name"); //从表单获得 
	String PRICE = request.getParameter("price");
	String INFO = request.getParameter("info");
	out.println(NAME);
	String A = "shangpin1.jsp";
	String PIC = PathPic;
	String PIC1 = PathPic;
	String IMG = PathPic;
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/shopping?user=root&password=&useUnicode=true&characterEncoding=utf-8";
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url);
	PreparedStatement pstat = conn.prepareStatement("select * from shop where SP_NAME=?");
	pstat.setString(1, NAME);
	ResultSet rs = null;
	rs = pstat.executeQuery();
	if (rs.next()) {
        out.print("<script>alert(\"商品已存在，请重新输入商品\");window.history.go(-1);</script>"); 
	} else {
		out.print("<script>alert(\"添加成功！,请返回\");window.history.go(-1);</script>");
		String sql = "Insert into shop(SP_NAME,SP_PRICE,SP_INFO,SP_PIC1,SP_PIC,SP_A,IMG)values(?,?,?,?,?,?,?)";
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, NAME);
		pstat.setString(2, PRICE);
		pstat.setString(3, INFO);
		pstat.setString(4, PIC1);
		pstat.setString(5, PIC);
		pstat.setString(6, A);
		pstat.setString(7, IMG);
		pstat.executeUpdate();
		pstat.close();
	}
	//关闭数据库连接  
	conn.close();
%>
