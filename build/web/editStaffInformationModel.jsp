<%-- 
    Document   : editStaffInformationModel
    Created on : 29/05/2019, 10:09:55 PM
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
        <title>JSP Page</title>
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

            db.updateStaff(id, userEmail, password, name, phoneNumber, address, type, status);

            session.removeAttribute("ID");
            response.sendRedirect("staffInformationManagement.jsp");
        %>
    </body>
</html>
