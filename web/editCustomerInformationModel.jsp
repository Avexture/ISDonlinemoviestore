<%-- 
    Document   : editAccountModel
    Created on : 15/05/2019, 9:58:02 PM
    Author     : Whyte
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.dao.*"%>
<%@page import="oms.controller.*"%>
<%@page import="oms.model.*" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success!</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            DBManager db = (DBManager) session.getAttribute("manager");

            String id = (String) session.getAttribute("ID");
            String userEmail = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phone");
            String type = request.getParameter("type");
            String status = request.getParameter("status");

            db.updateCustomer(id, userEmail, password, name, phoneNumber, address, type, status);
            
            session.removeAttribute("ID");
            response.sendRedirect("customerInformationManagement.jsp");
        %>
    </body>
</html>
