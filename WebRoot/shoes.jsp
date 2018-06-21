<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%> 
<%@ page contentType="text/html;charset=utf-8"%> 
<%  
   request.setCharacterEncoding("UTF-8");  
   response.setCharacterEncoding("UTF-8");  
   response.setContentType("text/html; charset=utf-8");  
%>  

<%  
            String driverName = "com.mysql.jdbc.Driver";
			 String url ="jdbc:mysql://localhost:3306/shopping?user=root&password=&useUnicode=true&characterEncoding=utf-8"; 
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);

    //建立一个Statement对象，用于执行SQL语句  
    
    //执行查询并得到查询结果  
         String sql="select * from shop WHERE SP_NO>1006 and SP_NO<=1012;";    
         PreparedStatement pstmt=conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery(sql);
        
  %>
      
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>shop</title>
    <link rel="stylesheet" type="text/css" href="css/commonshow.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
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
        <section>
           <div id="1">
               <div>
                   <div>
                       <h1>女鞋精选</h1>
                       <h2>information</h2>
                   </div>
                   <div>
                       
                   </div>
               </div>
           </div>
           <div id="2">
              <%  
             String name,price,info,img,a,bm;
              
            //将查询结果集中的记录输出到页面上  
            while (rs.next()){  
                //从当前记录中读取各字段的值  
                bm= rs.getString("SP_NO").trim(); 
                name = rs.getString("SP_NAME").trim();  
                price = rs.getString("SP_PRICE").trim();  
                info = rs.getString("SP_INFO").trim();    
                img = rs.getString("SP_PIC").trim();   
                a =rs.getString("SP_A").trim();
                out.println("<div class=\"yifu\">");   
                out.println("<div>");
                out.println("<a href='"+a+"?bm="+bm+"''>");       
                out.println("<img src='"+ img +"' >");
                out.println("</a>");   
                out.println("<p>"+ info +"</p>");  
                out.println("</div>"); 
                out.println("</div>");
               
            }  
        %>         
              
           
           </div>
        </section>
    </section>
    
    <section class="bottom">
        <section>
        </section>
    </section>
    <footer>
        <div class="container">
            <p>Copyright © 2017 CTBU DIANSHAN2 CLASS All Rights 

Reserved.</p>
        </div>
    </footer>
</body>
<script src="js/common.js"></script>
</html>
