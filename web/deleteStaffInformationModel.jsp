<%-- 
    Document   : deleteStaffInformationModel
    Created on : 29/05/2019, 10:12:35 PM
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
        <title>Success!</title>
    </head>
    <body>
        <%
            String staffID = (String) session.getAttribute("ID");
            DBManager db = (DBManager) session.getAttribute("manager");
            db.deleteStaff(staffID);
            session.removeAttribute("ID");
            response.sendRedirect("staffInformationManagement.jsp");
        %>
    </body>
</html>
