<%-- 
    Document   : customerAccessLogs
    Created on : 29/05/2019, 10:10:05 PM
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
        <title>Access Logs</title>
    </head>
    <body>
        <tr>
            <td><h1 class="logo">Your Access Logs</h1></td>
            <td><input type="button" class="button"  value="Back" onclick="history.back()"></td>
        </tr>
        <div class="container">
            <form action="customerAccessLogs.jsp" method="post">
                    <input id="search_box" type="text" name="logDate" placeholder="dd-mm-yyyy"/>
                    <input id="search_button" class="button" type="submit" value="Search">
                </form>
        <table class="search_table">
            <thead>
                <tr>
                    <th>DATE</th>
                    <th>LOGGED IN</th>
                    <th>LOGGED OUT</th>
                    <th>DELETE</th>
                </tr>
            </thead>
            <tbody>
            <%
                DBManager db = (DBManager) session.getAttribute("manager");
                ArrayList<Log> logs;
                User user = (User) session.getAttribute("user");
                String id = user.getID();
                if (request.getParameter("logDate") != null){
               
                    logs = db.searchLogs(id, request.getParameter("logDate"));
                 } else {
                logs = db.getLogsByID(id);
                }
                for (int i = 0; i < logs.size(); i++) {
            %>
            <tr>
            <td><%= logs.get(i).getLoginDate()%></td>
            <td><%= logs.get(i).getLogin()%></td>
            <% if((logs.get(i).getLogout()).equals("")){
            %>
            <td>Current Session / Unexpected Termination</td>
            <%} else {%>
            <td><%= logs.get(i).getLogout()%></td>
            <% }%>
            <td><a href="customerDeleteAccessLogs.jsp?sessionID=<%= (logs.get(i).getSessionID())%>">Delete</a></td>
           </tr>
            <%
                }
            %>
        </tbody>
    </table>
           <% if(session.getAttribute("user") == null){%>
            <button class="cancel_button" onclick="location.href='index.jsp'" > Cancel </button>
            <% } else{%>
            <button class="cancel_button" onclick="location.href='customerProfile.jsp'" > Cancel </button>
            <%  }%>
        </div>
    </body>
</html>
