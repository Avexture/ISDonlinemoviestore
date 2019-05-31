<%-- 
    Document   : userCartModel
    Created on : 30/05/2019, 11:30:56 PM
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
        <title>Submit Cart</title>
    </head>
    <body>
        <div class="main-container">
            <h1 class="logo">Online Movie Store</h1>
            <div class="container">
                <%
                    DBManager db = (DBManager) session.getAttribute("manager");
                    User user = (User) session.getAttribute("user");
                    if (((String) session.getAttribute("anonEmail")) != null) {
                        db.submitOrder(db.getCart((String) session.getAttribute("anonEmail")));
                %>
                <p>Order submitted. Click <a href="movieCustomerSearch.jsp">here</a> to return to the main page</p>
                <% } else if (user != null) {
                    db.submitOrder(db.getCart(user.getUserEmail()));
                %>
                <p>Order submitted. Click <a <a href="movieCustomerSearch.jsp">here</a> to return to the main page</p>
                <%
                } else {
                %>
                <p>Order Failed. Click <a <a href="index.jsp">here</a> to return to the main page</p>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
