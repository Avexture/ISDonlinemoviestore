<%-- 
    Document   : anonymousUserDetails
    Created on : 30/05/2019, 2:03:06 PM
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
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Register</title>
    </head>
    <body>
        <div class="login-container">

            <h1>Add Anonymous Details</h1>
            <div class="form">
                <form action="anonymousUserDetailsModel.jsp" method="POST">
                    <input type="hidden" name="movieid" value="<%= (request.getParameter("movieid"))%>"/>
                    <input type="hidden" name="quantity" value="<%= (request.getParameter("quantity"))%>"/>
                    <input type="text" name="email" placeholder="Anonymous email" required>
                    <input type="text" name="address" placeholder="Anonymous address" required>
                    <input class="button" type="submit" value="Create">
                </form>
                <form action="movieCustomerSearch.jsp">
                        <input class="cancel" type="submit" value="Cancel">
                </form>
            </div>
        </div>
    </body>
</html>