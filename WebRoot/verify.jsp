<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%> 
<%@ page contentType="text/html;charset=utf-8"%> 
<%  
   request.setCharacterEncoding("UTF-8");  
   response.setCharacterEncoding("UTF-8");  
   response.setContentType("text/html; charset=utf-8");  
%>  
<html> 
<head> 
<title>add message into table </TITLE> 
</head> 
<body> 
<% 
String username=request.getParameter("username"); //从表单获得 
String password=request.getParameter("password"); //从表单获得 
String Admin="demouser";

try {  
 // 加载数据库驱动，注册到驱动管理器  
            String driverName = "com.mysql.jdbc.Driver";
			 String url ="jdbc:mysql://localhost:3306/shopping?user=root&password=&useUnicode=true&characterEncoding=utf-8"; 
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);
        // 判断 数据库连接是否为空  
        if(conn != null){             
            String sql="select * from user where username='"+username+"' and password='"+ password + "'";  
            Statement stmt = conn.createStatement();  
            ResultSet rs=stmt.executeQuery(sql);  
            if(rs.next()){
                session.setAttribute("username",username);
                session.setAttribute("password",password);
                if(username.trim().equals(Admin.trim())){
                	response.sendRedirect("Administrator.jsp");  
                }
                else {response.sendRedirect("personal.jsp");}            
            }else{  
                out.print("<script>alert(\"密码或用户名错误\");window.history.go(-1);</script>"); 
                
                %>  
              
                <%   
            }             
            // 输出连接信息  
            //out.println("数据库连接成功！");  
            // 关闭数据库连接  
            conn.close();  
        }else{  
            // 输出连接信息  
            out.println("数据库连接失败！");                          
        }  
    } catch (ClassNotFoundException e) {  
        e.printStackTrace();  
    } catch (SQLException e) {  
        e.printStackTrace();  
    }  
%>  
</body> 
</html> 
