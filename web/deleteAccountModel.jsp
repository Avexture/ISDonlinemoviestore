<%-- 
    Document   : cancelAccountModel
    Created on : 15/05/2019, 9:58:43 PM
    Author     : Whyte
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
            User user = (User) session.getAttribute("user");
            String id = user.getID();

            db.deleteCustomer(id);
            session.invalidate();
        %>
        <div class="main-container">
            <h1 class="logo">Online Movie Store</h1>
            <div class="container">
                <p> Your account has been successfully Deleted. Please click here <a href="index.jsp">here</a> to return to the main page.</p>
            </div>
        </div>
    </body>
</html>
