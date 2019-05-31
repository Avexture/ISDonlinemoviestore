<%-- 
    Document   : userCancelCartModel
    Created on : 30/05/2019, 11:51:41 PM
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
        <title>Cancel Order</title>
    </head>
    <body>
        <div class="main-container">
            <h1 class="logo">Online Movie Store</h1>
            <div class="container">
                <%
                    DBManager db = (DBManager) session.getAttribute("manager");
                    User user = (User) session.getAttribute("user");

                    if (((String) session.getAttribute("anonEmail")) != null) {
                        String orderid = db.getCart((String) session.getAttribute("anonEmail"));
                        db.cancelOrder(orderid);

                %>
                <p>Order Canceled. Click <a href="movieCustomerSearch.jsp">here</a> to return to the main page</p>
                <% } else if (user != null) {
                    String orderid = db.getCart(db.getCart(user.getUserEmail()));
                    db.cancelOrder(orderid);
                %>
                <p>Order Canceled. Click <a <a href="movieCustomerSearch.jsp">here</a> to return to the main page</p>
                <%
                } else {
                %>
                <p>Order Canceled Failed. Click <a <a href="index.jsp">here</a> to return to the main page</p>
                <%
                    }
                %>
            </div>
        </div>

    </body>
</html>
