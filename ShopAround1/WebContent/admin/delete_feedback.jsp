<%-- 
    Document   : delete_item
    Created on : Apr 10, 2013, 12:59:27 PM
    Author     : user
--%>
<%@page session="true" %>
<%@page contentType="text/html" import="java.sql.*;" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    String f_id=request.getParameter("f_id");
                    
                          Connection con=null;
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        con=DriverManager.getConnection
                       ("jdbc:oracle:thin:@127.0.0.1:1521:xe","eshopping","nolin");
                     
                          PreparedStatement ps= con.prepareStatement("delete from feedback where f_id='"+f_id+"'");
                          ps.executeUpdate();
                     
                        response.sendRedirect("feedback.jsp");
                       
                    }catch(Exception e){
                        session.setAttribute("cant_del", "cant_del");
                       
                         response.sendRedirect("feedback.jsp");
                       
                    }finally{try{con.close();}catch(Exception e){}}
                        %>
    </body>
</html>
