<%-- 
    Document   : CustomerDeleteAccessLogs
    Created on : 29/05/2019, 10:48:10 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String sessionID = request.getParameter("sessionID");
            DBManager db = (DBManager) session.getAttribute("manager");
            //Log accessLog = (Log) db.findLogSessionID(sessionID);
            db.deleteLog(sessionID);
            response.sendRedirect("customerAccessLogs.jsp");
        %>
    </body>
</html>
