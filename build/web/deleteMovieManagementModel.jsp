<%-- 
    Document   : deleteMovie
    Created on : 28/05/2019, 11:04:07 AM
    Author     : Minh
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
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Success!</title>
    </head>
    <body>
        <% 
            DBManager db = (DBManager) session.getAttribute("manager");
            
            String movieID = (String) session.getAttribute("ID");
            
            db.deleteMovie(movieID);
            session.removeAttribute("ID");
            response.sendRedirect("movieManagement.jsp");
        %>
    </body>
</html>
