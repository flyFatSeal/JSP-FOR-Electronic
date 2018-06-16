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
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>shop</title>
	  <link rel="stylesheet" type="text/css" href="css/admin.css">
	  <link rel="stylesheet" type="text/css" href="css/common.css">
	  <link rel="stylesheet" type="text/css" href="css/admit1.css">
	  <script src="script/xuanfa.js"></script>
</head>
<body>
	<header>
		 <div class="container">
            <a href="index.html">
            	<div><img src="img/logo1.png"></div>
            </a>
            <nav>
               <a href="index.jsp">商城首页</a>
                <a href="clothes.jsp">外套精选</a>
                <a href="shoes.jsp">优质女鞋</a>
                <a href="story.jsp">品牌故事</a>
                <a href="backpack.jsp">时尚背包</a>
            </nav>
        </div>
	</header>
	<section class="banner">
		<section>
			<section>
				<ul>
					<li><p>个人资料</p></li>
					<li><p>已有订单</p></li>
					<li><p>订单地址</p></li>
					<li><p>使用帮助</p></li>
					<li id="clean"><p>安全退出</p></li>
				</ul>
			</section>
			<section>
				<h1></h1>
				
			</section>
			<section>
				<div>
					<form action="Administrator.jsp" method="post">
						<input type="text" placeholder="请输入商品名" name="SP_NAME" id="input">
						<input type="submit" id='btn' value="搜索">
						<input type="button" id='btn1' value="添加">
						<input type="button" id='btn2' value="返回">
					</form>
				</div>
				<table id='tableOne' >
				<thead>
					<tr>
						<th>图片</th>
						<th>商品名</th>
						<th>价格</th>
						<th>修改</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
						<%  
		  
            String id,name,price,count,IMG;  
            //将查询结果集中的记录输出到页面上  
            while (rs.next()){  
                //从当前记录中读取各字段的值  
                id = rs.getString("SP_NO").trim();  
                name = rs.getString("SP_NAME").trim();  
                price = rs.getString("SP_PRICE").trim();     
                IMG = rs.getString("IMG").trim();
                out.println("<tr >");  
                out.println("<td ><img width=90px height=90px src='"+ IMG +"' ></td>"); 
                out.println("<td>"+ name +"</td>");  
                out.println("<td>"+ price +"</td>");
                out.println("<td><p class=\"onChange\">修改商品</p><input type=number class=\"price\" value="+ price +" onChange=\"updatePrice('"+id+"',this.value)\"  ></td>");     
                out.println("<td><a href='management.jsp?option=del&id="+id+"'>删除商品</a></td>");  
                out.println("</tr>");  
            }  
        %>  
				</tbody>
			</table>
			<form id='tableTwo' action="" enctype="multipart/form-data" method="post">
				<table  >
					<thead>
						<tr>
							<th>商品图片</th>
							<th>商品名</th>
							<th>描述</th>
							<th>价格</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="file" name="file" required="required"></td>
							<td><input type="text" name="SP_NAME" required="required"></td>
							<td><input type="text" name="SP_INFO" required="required"></td>
							<td><input type="number" name="SP_PRICE" required="required"></td>
							<td><input type="button" value="清空"></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" id='btnSubmit' value="提交">
			</form>
			</section>
		</section>
	</section>
	<section class="bottom">
		<section>
			
		</section>	
	</section>
	<footer>
        <div class="container">
            <p>Copyright © 2017 CTBU DIANSHAN2 CLASS All Rights Reserved.</p>
        </div>
    </footer>
</body>
  <script src="js/Admin.js"></script>
  <script src="js/common.js"></script>

</html>
