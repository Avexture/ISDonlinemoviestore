<%-- 
    Document   : logout.jsp
    Created on : 29/05/2019, 12:41:11 PM
    Author     : Conforto
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.dao.*"%>
<%@page import="oms.controller.*"%>
<%@page import="oms.model.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Movie Store - Logout</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            DBManager db = (DBManager) session.getAttribute("manager");

            String sessionID = request.getSession().getId();
            java.util.Date date = new java.util.Date();
            SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm:ss");
            String logoutTime = timeFormatter.format(date);

            String loginTime = (String) session.getAttribute("logintime");
            String loginDate = (String) session.getAttribute("logindate");
            String ID = user.getID();

            db.updateLog(sessionID, ID, loginTime, logoutTime, loginDate);
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
