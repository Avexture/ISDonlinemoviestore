<%-- 
    Document   : editAccountModel
    Created on : 29/05/2019, 12:46:28 PM
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
        <title>Success!</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            DBManager db = (DBManager) session.getAttribute("manager");

            String id = user.getID();
            String userEmail = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phone");
            String type = request.getParameter("type");
            String status = user.getStatus();

            user.setUserEmail(userEmail);
            user.setPassword(password);
            user.setName(name);
            user.setAddress(address);
            user.setPhoneNumber(phoneNumber);
            user.setType(type);
            
            db.updateCustomer(id, userEmail, password, name, address, phoneNumber, type, status);
            response.sendRedirect("customerProfile.jsp");

        %>
    </body>
</html>
