<%-- 
    Document   : index
    Created on : 29/05/2019, 11:38:54 AM
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
        <title>Index</title>
    </head>
    <body>
        <div class="main-container">
            <h1 class="logo">Online Movie Store</h1>
            <div class="container">
                <h1>Hello, Welcome to the Online Movie Store! It appears you are not logged in. </h1>
                <div class="left">
                    <p>Click <a href="login.jsp">here</a> to login.</p>
                    <p>Click <a href="register.jsp">here</a> to register an account. </p>
                    <p>Click <a href="movieCustomerSearch.jsp">here</a> to shop without an account.</p></p>
                </div>
            </div>
        </div>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
