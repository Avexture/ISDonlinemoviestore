    <%-- 
    Document   : editCustomerInformation
    Created on : 26/05/2019, 2:29:32 PM
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
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email= request.getParameter("email");
            DBManager db = (DBManager) session.getAttribute("manager");       
            User user = (User) db.findCustomerEmail(email);
            session.setAttribute("ID", user.getID());
            if (user != null) {              
                String name = user.getName();
                String type = user.getType();
                String type2 = "";
                if(type.contains("Individual"))
                {
                    type2 = "Company";
                }
                else if (type.contains("Company"))
                {
                    type2 = "Individual";
                }
                 String status = user.getStatus();
                String status2 = "";
                if(status.equals("Active"))
                {
                    status2 = "Inactive";
                }
                else if (status.equals("Inactive"))
                {
                    status2 = "Active";
                }
        %>
        <h1 class="logo">Account Management</h1>
        <div class="edit-container">
                <div class="form">
                    <h1 class="title">Edit <%= user.getName() %>'s details:</h1>
                    <form action="editCustomerInformationModel.jsp" method="POST">
                        <p><a>Email:</a></p>
                        <input type="text" name="email" value="<%= user.getUserEmail()%>">
                        <p><a>Name:</a></p>
                        <input type="text" name="name" value="<%= user.getName()%>">
                        <p><a>Password:</a></p>
                        <input type="password" name="password" value="<%= user.getPassword()%>">
                        <p><a>Phone:</a></p>
                        <input type="text" name="phone" value="<%= user.getPhoneNumber()%>">
                        <p><a>Address:</a></p>
                        <input type="text" name="address" value="<%= user.getAddress()%>">
                        <p><a>Type:</a></p>
                        <select name="type">
                            <option value="<%= (String) type %>"><%= (String) type %></option>
                            <option value="<%= (String) type2 %>"><%= (String) type2 %></option>
                        </select>
                        <select name="status">
                            <option value="<%= (String) status %>"><%= (String) status %></option>
                            <option value="<%= (String) status2 %>"><%= (String) status2 %></option>
                        </select>
                        <input type="hidden" value="updated" name="updated">
                        <input class="button" type="submit" value="Update">
                    </form>
                    <form action="deleteCustomerInformationModel.jsp" method="POST">
                        <input class="delete" type="submit" value="Delete">
                    </form>
                    <form action="customerInformationManagement.jsp">
                        <input class="cancel" type="submit" value="Cancel">
                    </form>   
                </div>
        </div>
                            
        <% }else if (user == null) { %>
                <p>You are not logged in. Please click <a href="login.jsp">here</a> to login in order to change your account details.</p>
        <% } %>
    </body>
</html>
