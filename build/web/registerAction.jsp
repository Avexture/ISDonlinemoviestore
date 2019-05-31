<%-- 
    Document   : registerAction
    Created on : 29/05/2019, 11:51:30 AM
    Author     : Conforto
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
        <title>Register Failed</title>
    </head>
    <body>
        <div class="main-container">
            <h1 class="logo">Online Movie Store</h1>
            <div class="container">
                <%

                    DBManager manager = (DBManager) session.getAttribute("manager");

                    Random rnd = new Random();
                    int number = rnd.nextInt(999999);
                    String id = String.format("%06d", number);

                    String userEmail = request.getParameter("email");
                    String password = request.getParameter("password");
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    String phoneNumber = request.getParameter("phone");
                    String type = request.getParameter("type");

                    boolean noEmailError = manager.isValidEmail(userEmail);
                    boolean noPasswordError = manager.isValidPassword(password);
                    boolean noPhoneError = manager.isValidPhone(phoneNumber);
                    boolean noAddressError = manager.isValidAddress(address);
                    boolean noNameError = manager.isValidName(name);
                    User userExists = manager.findCustomerEmail(userEmail);
                    User staffExists = manager.findStaffEmail(userEmail);

                    if (userEmail.contains("uts.edu.au")) {
                %>
                <p>Registration unsuccessful. The email which you have entered cannot be submitted because it contains invalid text.<br>Click <a href=register.jsp>here</a> to register with a different email.</p>
                    <%
                    } else if (userExists != null || staffExists != null) {
                    %>
                <p>Registration unsuccessful. The email which you have entered already exists.<br>Click <a href=register.jsp>here</a> to register with a different email.</p>
                    <%
                        }
                        if (noEmailError == false) {
                    %>
                <p>- The email address you have entered is invalid.</p>
                <%
                    }
                    if (noNameError == false) {
                %>
                <p>- The name you have entered is invalid. Your name can only consist of alphabetical upper/lower case characters and spaces.</p>
                <%
                    }
                    if (noPhoneError == false) {
                %>
                <p>- The phone number that you have entered is invalid. Your phone number must be between 7 and 15 digits long.</p>
                <%
                    }
                    if (noAddressError == false) {
                %>
                <p>- The address you have entered is invalid. Your address must start with a number followed by your street name.</p>
                <%
                    }
                    if (noPasswordError == false) {
                %>
                <p>- The password you have entered is invalid. Your password must be eight characters or more of any character.</p>
                <%
                } else {
                %>
                <p>Redirecting...</p>
                <%
                        User user = new User(id, userEmail, password, name, address, phoneNumber, type, "Active");
                        String status = "Active";
                        manager.addCustomer(id, userEmail, password, name, phoneNumber, address, type, status);
                        session.setAttribute("user", user);
                        response.sendRedirect("customerProfile.jsp");
                        String sessionID = request.getSession().getId();
                        java.util.Date date = new java.util.Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                        String loginDate = formatter.format(date);
                        SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm:ss");
                        String loginTime = timeFormatter.format(date);

                        String logoutPlaceholder = "current session / unexpected termination";
                        String ID = user.getID();

                        manager.addLoginLog(sessionID, ID, loginTime, logoutPlaceholder, loginDate);

                        session.setAttribute("logintime", loginTime);
                        session.setAttribute("logindate", loginDate);

                    }
                %>
            </div>
        </div>
    </body>
</html>

