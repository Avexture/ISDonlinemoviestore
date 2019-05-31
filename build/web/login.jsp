<%-- 
    Document   : login.jsp
    Created on : 29/05/2019, 12:32:49 PM
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
        <title>Login</title>
    </head>
    <body>
        <div class="login-container">
            <h1>Login</h1>
            <div class="form">
                 <form action="loginAction.jsp" method="POST">
                    <input type="text" name="email" placeholder="Email"/>
                    <input type="password" name="password" placeholder="Password"/>
                    <input class="button" type="submit" value="LOGIN">
                    <p class="message">Not registered? <a href="register.jsp">Create an account</a></p>
                </form>
            </div>
        </div>
    </body>
</html>