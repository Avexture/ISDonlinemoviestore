<%-- 
    Document   : createStaffInformationManagementModel
    Created on : 29/05/2019, 9:56:16 PM
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
        <title>Create Customer Action</title>
    </head>
    <body>
        <%
            DBManager db = (DBManager) session.getAttribute("manager");
            
            Random rnd = new Random();
            int number = rnd.nextInt(999999);
            String ID = String.format("%06d", number);
            
            String userEmail = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phone");
            String type = request.getParameter("type");
            String status = "Active";
            
            boolean noEmailError = db.isValidEmail(userEmail);
            boolean noPasswordError = db.isValidPassword(password);
            boolean noPhoneError = db.isValidPhone(phoneNumber);
            boolean noAddressError = db.isValidAddress(address);
            boolean noNameError = db.isValidName(name);
            
            User userExists = db.findCustomerEmail(userEmail);
            User staffExists = db.findStaffEmail(userEmail);
            
            if (userExists != null || staffExists != null) {
                %>
                    <p>Registration unsuccessful. The email which you have entered already exists.<br>Click <a href=createStaffInformationManagement.jsp>here</a> to register with a different email.</p>
                <%
                } if (noEmailError == false){
        %>
        <p>- The email address you have entered is invalid.</p>
        <%
            } if (noNameError == false){
        %>
        <p>- The name you have entered is invalid. Your name can only consist of alphabetical upper/lower case characters and spaces.</p>
        <%
            } if (noPhoneError == false){
        %>
        <p>- The phone number that you have entered is invalid. Your phone number must be between 7 and 15 digits long.</p>
        <%
            } if (noAddressError == false){
        %>
        <p>- The address you have entered is invalid. Your address must start with a number followed by your street name.</p>
        <%
            } if (noPasswordError == false){
        %>
        <p>- The password you have entered is invalid. Your password must be eight characters or more of any character.</p>
        <%
            } else {
        %>
            <p>Redirecting...</p>
        <%
            User user = new User(ID, userEmail, password, name, address, phoneNumber, type, status);
            db.addStaff(ID, userEmail, password, name, phoneNumber, address, type, status);
            response.sendRedirect("staffInformationManagement.jsp");
            }
        %>
    </body>
</html>
