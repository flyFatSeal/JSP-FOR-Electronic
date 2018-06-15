<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>  
<%@ page import="java.sql.*"%>
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
    String bm = request.getParameter("bm"); 
      
    //将商品放入购物车  
    
        //从商品库中取出所选购商品的数据  
        String name=null,price=null,IMG=null;  
        sql = "select * from shop where SP_NO=?";  
        pstat = conn.prepareStatement(sql);  
        pstat.setString(1,bm);  
        rs = pstat.executeQuery();  
        if (rs.next()){  
            name = rs.getString("SP_NAME").trim();  
            price = rs.getString("SP_PRICE").trim(); 
            IMG = rs.getString("IMG").trim();
        }  
        rs.close();  
        pstat.close();  
          
 
      
%>   
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>shop</title>
	  <link rel="stylesheet" type="text/css" href="css/shangpin.css">
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
                <div id="disappear">
                    <img class="dianji1" src="img/nav1.png">
                    <a id="login1"  href="login.jsp"><img class="dianji1" src="img/nav2.png"></a>
                    <a id="cart1"  href=""><img class="dianji1" src="img/nav3.png"></a>
                </div>
            </div>
        </div>
        <div id="search">
             <p>搜索</p>
             <form action="search.jsp" method="post">
                <div>
                 <input type="text" name="SP_NAME" placeholder="商品名" autofocus="autofocus">
                   <div>
                       <input type="text" name="SP_PRICE" placeholder="价格低">
                       <input type="text"  name="SP_PRICE1"  placeholder="价格高">
                   </div>
                </div>
                <div>
                    <button type="submit">搜索</button>
                    <button><a href="index.jsp">返回</a></button>
                </div>
             </form>
        </div>
		<%
			String username = (String) session.getAttribute("username");
			if (username != null) {
				out.println("<input id=\"state\" value=\"1\" type=\"hidden\" >");
				out.println("<div id=\"login\">");
				out.println("<p>你已登录，进入个人中心</p>");
				out.println("<div></div>");
				out.println("</div>");
				out.println("<div id=\"cart\">");
				out.println("<p>点击进入购物车</p>");
				out.println("<div></div>");
				out.println("</div>");
			} else {
				out.println("<div id=\"login\">");
				out.println("<p>你还没有登录，请先登录</p>");
				out.println("<div></div>");
				out.println("</div>");
				out.println("<div id=\"cart\">");
				out.println("<p>你还没有登录，请先登录</p>");
				out.println("<div></div>");
				out.println("</div>");
			}
		%>
	</header>
    <div id="beijing"></div>
	<section class="banner">
		<div>
			<div>
				<div><%out.println("<img src='"+ IMG +"' >");%></div>
				<div>
				    <h1><%out.println(name);%></h1>
					<div></div>
					<p>￥<%out.println(price); %></p>
					<button id='submitCart'><%out.println("<a href='buy.jsp?op=add&bm="+bm+"'>加入购物车</a>"); %></button>
					<span>商品编号：<%out.println(bm); %></span>
					<span>分类：外套</span>
				</div>
			</div>
			<div>
				
			</div>
			<div>
				
			</div>
		</div>
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
<script src="js/common.js"></script>
</html>
