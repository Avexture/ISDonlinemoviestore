<%-- 
    Document   : anonymousUserDetailsModel
    Created on : 30/05/2019, 2:20:00 PM
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
            String anonEmail = request.getParameter("email");
            String anonAddress = request.getParameter("address");
            session.setAttribute("anonEmail", anonEmail);
            session.setAttribute("anonAddress", anonAddress);
        %>

        <p>Your account details have been successfully changed.<br>Click 
        <form action="movieCustomerSearch.jsp" method="POST">
            <input type="hidden" name="movieid" value="<%= (request.getParameter("movieid"))%>"/>
            <input type="hidden" name="quantity" value="<%= (request.getParameter("quantity"))%>"/>
            <input class="button" type="submit" value="here">
        </form>
        to return to the main page.</p>
</body>
</html>
