<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%> 
<%@ page contentType="text/html;charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
     String driverName = "com.mysql.jdbc.Driver";
			 String url ="jdbc:mysql://localhost:3306/shopping?user=root&password=&useUnicode=true&characterEncoding=utf-8"; 
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);
    //建立一个Statement对象，用于执行SQL语句  
    Statement stat = conn.createStatement();  
    //执行查询并得到查询结果  
    String sql = "select * from cart";  
    ResultSet rs = stat.executeQuery(sql);   
    String name1 = (String) session.getAttribute("name1"); 
  %>     
  
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>shop</title>
	  <link rel="stylesheet" type="text/css" href="css/cart.css">
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
		<section>
		    <section>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%out.println(name1);%>成功加入购物车</section>
			<table >
				<thead>
					<tr>
						<th>商品</th>
						<th></th>
						<th>价格</th>
						<th>数量</th>
						<th>合计</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					
					<%  
		  
            String id,name,price,num,count,IMG;  
            //将查询结果集中的记录输出到页面上  
            while (rs.next()){  
                //从当前记录中读取各字段的值  
                id = rs.getString("SP_NO").trim();  
                name = rs.getString("SP_NAME").trim();  
                price = rs.getString("SP_PRICE").trim();  
                num = rs.getString("BUY_NUM").trim();  
                count = rs.getString("COUNT").trim();  
                IMG = rs.getString("IMG").trim();
                out.println("<tr >");  
                out.println("<td ><img width=90px height=90px src='"+ IMG +"' ></td>"); 
                out.println("<td>"+ name +"</td>");  
                out.println("<td>"+ price +"</td>");  
                out.println("<td><input type=number width=60px value="+ num +" onChange=\"updateNum('"+id+"',this.value,'"+price+"')\"></td>");  
                out.println("<td>"+ count +"</td>");  
                out.println("<td><a href='buy.jsp?op=del&id="+id+"'>删除商品</a></td>");  
                out.println("</tr>");  
            }  
        %>  
					
				</tbody>
				<tfoot>
					<tr>
						<td><a href="index.jsp"><button>接着购物</button></a></td>
						
					</tr>
				</tfoot>

			</table>
			<table id="table">
				<thead>
					<tr>
						<th>购物车总计</th>
						<th></th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>购物车小计</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>运费</td>
						<td></td>
						<td>免费运输</td>
					</tr>
					<tr>
						<td>购物车总计</td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td><button>前往收银台</button></td>
						
					</tr>
				</tfoot>

			</table>
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
<script language="javascript">  
    function updateNum(id,num,price){  
    	console.log('2');
        var url = "buy.jsp?op=update&id="+id+"&num="+num+"&price="+price;  
        window.location = url;  
    }  
  </script>   
</html>
