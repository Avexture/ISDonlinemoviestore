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
        <title>Navigation Bar</title>
    </head>

    <%
        User user = (User) session.getAttribute("user");
    %>

    <body>
        <table bgcolor="dcb2ff">
            <tr>
                <td>
                    <button onclick="window.history.back();">← Back</button>
                </td>
                <td>
                    <button onclick="window.location.href='index.jsp'">Index</button>
                </td>
                <td>
                    <% if (user == null) { %>
                    Hello, you are currently not logged in. <a href="login.jsp">Login</a> or <a href="register.jsp">Register</a> 
                    <% }
                        if (user != null) {%>
                    Hello, <%=user.getName()%>! Your username is: <%=user.getUserEmail()%>. <a href="logout.jsp">Logout</a>
                    <% }%>
                </td>
                <td>
                    <button onclick="window.location.href='index.jsp'">Main Page</button>
                </td>
                <td>
                    <button onclick="window.history.forward();">Forward →</button>
                </td>
            </tr>
        </table>
    </body>
</html>
