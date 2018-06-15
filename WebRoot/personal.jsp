<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%  
    String driverName = "com.mysql.jdbc.Driver";
			String useName = "root";
			String usePwd = "";
			String dbName = "shopping";
			String url1 = "jdbc:mysql://localhost:3306/" + dbName;
			String url2 = "?user=" + useName + "&password=" + usePwd;
			String url = url1 + url2;
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);  
            PreparedStatement pstat = null;  
            ResultSet rs = null;   
            String sql = null; 
            String name = (String) session.getAttribute("username");
            String password1 = (String) session.getAttribute("password");
            String username=null,eamil=null;  
            sql = "select * from user where username=?";  
            pstat = conn.prepareStatement(sql);  
            pstat.setString(1,name);  
            rs = pstat.executeQuery();  
            if (rs.next()){  
            username = rs.getString("username").trim();  
            eamil = rs.getString("eamil").trim(); 
     
            }  
            rs.close();  
            pstat.close();  
          
 
      
%>   

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>shop</title>
	  <link rel="stylesheet" type="text/css" href="css/personal.css">
	  <link rel="stylesheet" type="text/css" href="css/common.css">
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
            <div>
            	<div id="xiaoshi">
                    <img class="dianji1" src="img/nav1.png">
                    <a href="login.jsp"><img src="img/nav2.png"></a>
                    <a href="cart.jsp"><img src="img/nav3.png"></a>
                </div>
            </div>
        </div>
	</header>
	<section class="banner">
		<section>
			<section>
				<li><p>个人资料</p></li>
				<li><p>我的订单</p></li>
				<li><p>订单地址</p></li>
				<li><p>使用帮助</p></li>
				<li id="clean"><p>安全退出</p></li>
			</section>
			<section>
				<h1></h1>
				
			</section>
			<section>
				<div>
					<p>资料明细</p>
				</div>
				<table>
					<tr>
						<td>用户名</td>
						<td colspan="2"><%=name%></td>
					</tr>
					<tr>
						<td>密码</td>
						<td colspan="2"><%=password1%></td>
						
					</tr>
					<tr>
						<td>姓名</td>
						<td colspan="2">这是一个秘密</td>
						
					</tr>
					<tr>
						<td>爱好</td>
						<td colspan="2">做一个安静的大学生</td>
						
					</tr>
					<tr>
						<td>性别</td>
						<td colspan="2">男</td>
						
					</tr>
					<tr>
						<td>我很烦</td>
						<td ></td>
						<td></td>
					</tr>
				</table>
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
  <script>
    var clean = document.getElementById("clean");
    clean.onclick=function(){
       window.location="clean.jsp"; 
    }
  </script>
  <script src="js/common.js"></script>
</html>