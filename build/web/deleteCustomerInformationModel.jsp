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
           String customerID =(String) session.getAttribute("ID");
           DBManager db = (DBManager) session.getAttribute("manager");
           db.deleteCustomer(customerID);
           session.removeAttribute("ID");
           response.sendRedirect("customerInformationManagement.jsp");
        %>
    </body>
</html>
