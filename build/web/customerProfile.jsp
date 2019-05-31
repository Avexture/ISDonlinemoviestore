<%-- 
    Document   : customerProfile
    Created on : 29/05/2019, 12:39:17 PM
    Author     : Conforto
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
        <title>Customer Profile</title>            
    </head>
    <body>
        <div class="main-container">
            <h1 class="logo">Customer Profile</h1>
            <div class="container">
                <%
                    User user = (User) session.getAttribute("user");
                    if(user != null) {
                        String name = user.getName();
                %>
                <div class="left">
                    <h1>Hello, <%= user.getName() %>! Welcome to the Online Movie Store!</h1>
                    <h1>My Profile</h1>
                    <p><a>Name:</a> <%= user.getName() %></p>
                    <p><a>Email:</a> <%= user.getUserEmail() %></p>
                    <p><a>Phone:</a> <%= user.getPhoneNumber() %></p>
                    <p><a>Address:</a> <%= user.getAddress() %></p>
                    <p><a>Account Type:</a> <%= user.getType() %></p>
                    
                    <p>Click <a href="account.jsp">here</a> to edit your account details.</p>
                    <p>Click <a href="customerAccessLogs.jsp">here</a> to view your account's access logs.</p>
                    <p>Click <a href="movieCustomerSearch.jsp">here</a> to browse movies.</p>
                    <p>Click <a href="userOrderHistory.jsp">here</a> to view your order history.</p>
                    <p>Click <a href="logout.jsp">here</a> to logout.</p>

                <% 
                    } else if (user == null) {
                %>
                    <p>Hello, Welcome to the Online Movie Store! It appears you are not logged in. <br>Click <a href="login.jsp">here</a> to login, or click <a href="register.jsp">here</a> to register an account.</p>
                <% 
                    }
                %>
                </div>
            </div>
        </div>        
    </body>
</html>
