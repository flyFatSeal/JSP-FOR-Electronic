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
							<th>编号</th>
							<th>商品名</th>
							<th>描述</th>
							<th>价格</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="file" name="file"></td>
							<td><input type="text" name="SP_NO"></td>
							<td><input type="text" name="SP_NAME"></td>
							<td><input type="text" name="SP_INFO"></td>
							<td><input type="text" name="SP_PRICE"></td>
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
  <script src="<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">"></script>
  <script>
    var clean = document.getElementById("clean");
    clean.onclick=function(){
       window.location="clean.jsp"; 
    }
    let btn2 = document.getElementById('btn1')
    let btn1=document.getElementById('btn')
    let btn3=document.getElementById('btn2')
    let change=document.getElementsByClassName('onChange')
    let table=document.getElementById('tableOne')
    let tableTwo=document.getElementById('tableTwo')
    let price=document.getElementsByClassName('price')
    btn2.onclick=function(){
    	table.style.display='none'
    	tableTwo.style.display='block'
    }
    btn3.onclick=function(){
    	table.style.display='block'
    	tableTwo.style.display='none'
    }
    for(let i=0;i<change.length;i++){
    	change[i].onclick=function(){
    	price[i].style.display="block"
    	change[i].style.display="none"
    	}
    }
  </script>
  <script src="js/common.js"></script>
  <script language="javascript"> 
   	let btn=document.getElementById('btnSubmit');
   	let form =document.getElementById('tableTwo');
   	let inputs =form.getElementsByTagName('input');
   	console.log(inputs.length);
   	btn.onclick=function(){
   		let url= getUrl();
   		form.action= url;
   	}
    function updatePrice(id,price){  
        var url = "management.jsp?option=update&id="+id+"&price="+price;  
        window.location = url;  
    }
    function getUrl(){  
        let id = inputs[1].value;
        let name = inputs[2].value;
        let info = inputs[3].value;
        let price = inputs[4].value;
        let url = "pic.jsp?&id="+id+"&name="+name+"&info="+info+"&price="+price;
        console.log(url);
        return url;
    }
     
  </script>   
</html>
