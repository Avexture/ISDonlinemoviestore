<%-- 
    Document   : userCartDeleteModel
    Created on : 31/05/2019, 2:01:23 PM
    Author     : William
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.dao.*"%>
<%@page import="oms.controller.*"%>
<%@page import="oms.model.*" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String id = request.getParameter("orderLineID");
            DBManager db = (DBManager) session.getAttribute("manager");
            db.deleteOrderLine(id);
            response.sendRedirect("userCart.jsp");
        %>
        
    </body>
</html>
