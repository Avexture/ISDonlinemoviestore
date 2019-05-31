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
        <title>Customer Profile Edit</title>
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
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
        %>
            <h1 class="logo">Edit Profile</h1>
            <div class="edit-container">
                    <div class="form">
                        <h1 class="title">Hello, <%= user.getName() %>! These are your details:</h1>
                        <form action="editAccountModel.jsp" method="POST">
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
                                <option value="<%= type %>"><%= type %></option>
                                <option value="<%= type2 %>"><%= type2 %></option>
                            </select>
                            <input type="hidden" value="updated" name="updated">
                            <input class="button" type="submit" value="Update">
                        </form>
                        <form action="deleteAccountModel.jsp" method="POST">
                            <input class="delete" type="submit" value="Delete">
                        </form>
                        <form action="customerProfile.jsp">
                            <input class="cancel" type="submit" href="index.jsp" value="Cancel">
                        </form>   
                    </div>
            </div>
        <% } if (user == null) { %>
                <div class="main-container">
                    <h1 class="logo">Online Movie Store</h1>
                    <div class="container">
                <p>You are not logged in. Please click <a href="login.jsp">here</a> to login in order to change your account details.</p>
                    </div>
                </div>
        <% } %> 
    </body>
</html>