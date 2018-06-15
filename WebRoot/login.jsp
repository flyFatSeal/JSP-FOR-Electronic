<%@ page language="java" pageEncoding="utf-8"%> 
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
	<title>登陆页面</title>
	  <link rel="stylesheet" type="text/css" href="css/common.css">
	  <link rel="stylesheet" type="text/css" href="css/logIn.css">
	  <script src="script/login.js"></script>
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
			<aside>
				<h1>用户登陆/注册说明：</h1>
				<h2 class="h2">1、演示用户名：demouser；密码： demo1234</h2>
				<h2>2、实际使用之前，需配置用户管理组件中的相关邮件。详情请参考教程：《用户管理中相关邮件的配置》</h2>
				<h2>3、新用户注册后的审核方式有三种：自动核准、邮件激活、需要管理员批准（即人工审核），详情可参考教程《如何设置用户注册后的审核方式》</h2>
			</aside>
			<div id="div1">
				<div >
					<form action="verify.jsp" method="post">
						<fieldset>
						<label for="">用户:&nbsp;&nbsp;&nbsp;</label><input type="text" name="username" autofocus="autofocus" required="required"><br><br>
					    <label for="">密码:&nbsp;&nbsp;&nbsp;</label><input type="password" name="password"  required="required">

					    </fieldset>
					    <div></div>
					    <input type="submit" class="login" value="登录">
					    <button type="button" id="a">注册</button>
					</form>
				</div>
				
			
			</div>
			<div id="div2">
					<div >
					<form action="mysql_insert.jsp" method="post"> 
						<fieldset>
						<label for="">用户:&nbsp;&nbsp;&nbsp;</label><input type="text" name="username" autofocus="autofocus"  required="required"><br><br>
					    <label for="">电子邮件:&nbsp;</label><input type="text" name="eamil" required="required"><br><br>
                        <label for="">密码:&nbsp;&nbsp;&nbsp;</label><input type="password" id="pass" name="password" required="required"><br><br>
					    <label for="">确认密码:&nbsp;</label><input type="password" id="pass1" required="required">
					    </fieldset>
					 <div></div>
					    <input type="submit" class="login" value="注册">
					    <a href="login.jsp"><button type="button">返回</button></a>
					</form>
				</div>
					
			</div>
			
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
<script src='js/login.js'>
</script>
<script src="js/common.js"></script>
</html>


