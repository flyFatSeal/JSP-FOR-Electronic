<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%> 
<%@ page contentType="text/html;charset=utf-8"%> 
<%  
   request.setCharacterEncoding("UTF-8");  
   response.setCharacterEncoding("UTF-8");  
   response.setContentType("text/html; charset=utf-8");  
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>shop</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
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
            <div></div>
            <div></div>
            <div></div>
        </section>
    </section>
    <section class="three">
        <section>
            <div>
                <div>
                    <img src="img/banner4.jpg" alt="">
                </div>
            </div>
            <article>
                <h1>品牌故事</h1>
                <p>香奈儿代表的是一种风格、一种历久弥新的独特风格”，Chanel女士如此形容自己的设计，并不是思索接下来要做什么，而是自问接下来要以何种方式表现</p>
                <button>MORE</button>
            </article>
        </section>
    </section>
    <section class="four">
        <section>
            <div>
                <p>ONLINE STORE</p>
                <p>fashion show</p>
            </div>
        </section>
    </section>
    <section class="five">
        <section>
            <aside>
                <h1>ONLINE STORE</h1>
                <h2>fashion show</h2>
            </aside>
            <div class="img">
                <p>Clothing Products#01</p>
            </div>
            <div class="img">
                <p>Clothing Products#02</p>
            </div>
            <div class="img">
                <p>Clothing Products#03</p>
            </div>
        </section>
    </section>
    <section class="six">
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
