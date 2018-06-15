<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ page import="java.sql.*"%>  

    <%  
     String driverName = "com.mysql.jdbc.Driver";
			 String url ="jdbc:mysql://localhost:3306/shopping?user=root&password=&useUnicode=true&characterEncoding=utf-8"; 
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);
    PreparedStatement pstat = null;  
    ResultSet rs = null;  
      
    String sql = null;  
    String option = request.getParameter("option");  
      
    //将商品放入购物车  
    if (option.equals("add")){  
        //从商品库中取出所选购商品的数据  
        String bm = request.getParameter("bm");  
        String name=null,price=null,img=null;  
        
        sql = "select * from shop where SP_NO=?";  
        pstat = conn.prepareStatement(sql);  
        pstat.setString(1,bm);  
        rs = pstat.executeQuery();  
        if (rs.next()){  
            name = rs.getString("SP_NAME").trim();  
            session.setAttribute("name1",name);  
            price = rs.getString("SP_PRICE").trim();  
            img = rs.getString("IMG").trim();  
        }  
        rs.close();  
        pstat.close();  
        //将所选购商品加入到购物车中  
        sql = "insert into cart(SP_NAME,SP_PRICE,BUY_NUM,COUNT,IMG) values(?,?,?,?,?)";  
        pstat = conn.prepareStatement(sql);  
        pstat.setString(1,name);  
        pstat.setString(2,price);  
        pstat.setInt(3,1);  
        pstat.setString(4,price); 
        pstat.setString(5,img); 
        pstat.executeUpdate();  
        pstat.close();    
        //关闭数据库连接  
        conn.close();   
        //重定向到购物车页面  
        response.sendRedirect("Administrator.jsp");  
    }  
      
    //更改商品的价格 
    if (option.equals("update")){  
        int id = Integer.parseInt(request.getParameter("id"));    
        double price=Double.parseDouble(request.getParameter("price"));  
        sql = "update shop set SP_PRICE =? where SP_NO=?";  
        pstat = conn.prepareStatement(sql);  
        pstat.setString(1,new Double(price).toString());  
        pstat.setInt(2,id);  
        pstat.executeUpdate();  
        pstat.close();  
        //关闭数据库连接  
        conn.close();  
          
        //重定向到购物车页面  
        response.sendRedirect("Administrator.jsp");  
    }     
      
    //将商品退回到商品架(将商品从购物车中删除)  
    if (option.equals("del")){  
        int id = Integer.parseInt(request.getParameter("id"));  
        sql = "delete from shop where SP_NO=?";  
        pstat = conn.prepareStatement(sql);  
        pstat.setInt(1,id);  
        pstat.executeUpdate();  
        pstat.close();    
          
        //关闭数据库连接  
        conn.close();  
          
        //重定向到购物车页面  
        response.sendRedirect("Administrator.jsp");  
    }  
      
    //清空购物车  
    if (option.equals("clear")){  
        sql = "delete from cart";  
        pstat = conn.prepareStatement(sql);  
        pstat.executeUpdate();  
        pstat.close();  
          
        //关闭数据库连接  
        conn.close();  
          
        //重定向到购物车页面  
        response.sendRedirect("Administrator.jsp");  
    }  
%>   


