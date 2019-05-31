<%-- 
    Document   : loginAction
    Created on : 29/05/2019, 12:33:34 PM
    Author     : Conforto
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.dao.*"%>
<%@page import="oms.controller.*"%>
<%@page import="oms.model.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Login Unsuccessful</title>
    </head>
    <body>
        <div class="main-container">
            <h1 class="logo">Online Movie Store</h1>
            <div class="container">
                <%
                    //Initialize Database Connection
                    DBManager db = (DBManager) session.getAttribute("manager");
                    String userEmail = request.getParameter("email");
                    String password = request.getParameter("password");
                    // first verify then check
                    User user = db.findCustomer(userEmail, password);
                    User staff = db.findStaff(userEmail, password);

                    if (user != null && (user.getStatus()).equals("Active")) {
                        session.setAttribute("user", user);

                        String sessionID = request.getSession().getId();
                        java.util.Date date = new java.util.Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                        String loginDate = formatter.format(date);
                        SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm:ss");
                        String loginTime = timeFormatter.format(date);

                        String logoutPlaceholder = "current session / unexpected termination";
                        String ID = user.getID();

                        db.addLoginLog(sessionID, ID, loginTime, logoutPlaceholder, loginDate);

                        session.setAttribute("logintime", loginTime);
                        session.setAttribute("logindate", loginDate);
                        response.sendRedirect("customerProfile.jsp");
                    } else if (staff != null && (staff.getStatus()).equals("Active")) {
                        session.setAttribute("user", staff);

                        String sessionID = request.getSession().getId();
                        java.util.Date date = new java.util.Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                        String loginDate = formatter.format(date);
                        SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm:ss");
                        String loginTime = timeFormatter.format(date);

                        String logoutPlaceholder = "current session / unexpected termination";
                        String ID = staff.getID();

                        db.addLoginLog(sessionID, ID, loginTime, logoutPlaceholder, loginDate);

                        session.setAttribute("logintime", loginTime);
                        session.setAttribute("logindate", loginDate);
                        response.sendRedirect("staffProfile.jsp");
                    } else if (user == null || staff == null) {
                %>
                <p>Login unsuccessful. The email address which you have entered does not exist or has been made inactive.<br>Click <a href=login.jsp>here</a> to return to the login page.</p>
                    <%
                        }
                    %>  
            </div>
        </div>

    </body>
</html>
