<%-- 
    Document   : userCart
    Created on : 30/05/2019, 3:20:33 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="logo">User Cart</h1>

        <div class="container">
            <form action="userCart.jsp" method="post">
                <input id="search_box" type="text" name="name" placeholder="Name"/>
                <input id="search_button" class="button" type="submit" value="Search">
            </form>
            <table class="search_table">
                <thead>
                    <tr>
                        <th>ORDER ID</th>
                        <th>ORDER DATE</th>
                        <th>ADDRESS</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DBManager db = (DBManager) session.getAttribute("manager");
                        ArrayList<Orders> l;
                        User user = (User) session.getAttribute("user");

                        if (user != null) {
                            l = db.getOrder(user.getUserEmail());
                        } else {
                            l = new ArrayList<Orders>();
                        }
                        for (int i = 0; i < l.size(); i++) {
                    %>
                    <tr>
                        <%
                            if ((l.get(i).getStatus().equals("SAVED"))) {
                        %>
                        <td><a href="userCart.jsp"><%= l.get(i).getOrderID()%></a></td>
                            <%
                            } else {
                            %>
                        <td><%= l.get(i).getOrderID()%></td>
                        <%
                            }
                        %>
                        <td><%= l.get(i).getOrderDate()%></td>
                        <td><%= l.get(i).getAddress()%></td>
                        <td><%= l.get(i).getStatus()%></td>

                    </tr>
                    <% }%>
                </tbody>         
            </table>
            <button class="create_button" onclick="location.href = '.jsp'"> Create </button>
            <button class="cancel_button" onclick="location.href = 'customerProfile.jsp'" > Cancel </button>
        </div>
    </body>
</html>
