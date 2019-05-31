<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="oms.dao.*"%>
<%@page import="oms.controller.*"%>
<%@page import="oms.model.*" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Staff Information Management</title>
    </head>
    <body>
        <h1 class="logo">Staff Information Management</h1>

        <div class="container">
            <form action="staffInformationManagement.jsp" method="post">
                <input id="search_box" type="text" name="name" placeholder="Name"/>
                <select id="search_dropbox" name="type">
                    <option value="">SalesPerson and Manager</option>
                    <option value="SalesPerson">SalesPerson</option>
                    <option value="Manager">Manager</option>
                </select> 
                <input id="search_button" class="button" type="submit" value="Search">
            </form>
            <table class="search_table">
                <thead>
                    <tr>
                        <th>EMAIL</th>
                        <th>NAME</th>
                        <th>PHONE</th>
                        <th>ADDRESS</th>
                        <th>POSITION</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DBManager db = (DBManager) session.getAttribute("manager");
                        ArrayList<User> users;
                        if (request.getParameter("name") != null) {
                            users = db.searchUsers("STAFF", request.getParameter("name"), request.getParameter("type"));
                        } else {
                            users = db.getUsers("STAFF");
                        }
                        for (int i = 0; i < users.size(); i++) {
                            if (!users.get(i).getType().contains("Admin")) {
                    %>
                    <tr>
                        <td><a href="editStaffInformation.jsp?email=<%=(users.get(i).getUserEmail())%>"><%= users.get(i).getUserEmail()%></a></td>
                        <td><%= users.get(i).getName()%></td>
                        <td><%= users.get(i).getPhoneNumber()%></td>
                        <td><%= users.get(i).getAddress()%></td>
                        <td><%= users.get(i).getType()%></td>
                        <td><%= users.get(i).getStatus()%></td>
                    </tr>
                    <% }
                        }%>
                </tbody>         
            </table>
            <button class="create_button" onclick="location.href = 'createStaffInformationManagement.jsp'"> Create </button>
            <button class="cancel_button" onclick="location.href = 'staffProfile.jsp'" > Cancel </button>
        </div>
    </body>
</html>