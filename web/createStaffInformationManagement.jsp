<%-- 
    Document   : createStaffInformationManagement
    Created on : 29/05/2019, 9:50:42 PM
    Author     : William
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Register</title>
    </head>
    <body>
        <div class="login-container">
            <h1>Create Staff</h1>
            <div class="form">
                <form action="createStaffInformationManagementModel.jsp" method="POST">
                    <input type="text" name="email" placeholder="Staff email" required>
                    <input type="text" name="name" placeholder="Staff name" required>
                    <input type="password" name="password" placeholder="Staff password" required>
                    <input type="text" name="phone" placeholder="Staff phone" required>
                    <input type="text" name="address" placeholder="Staff address" required>
                    <select name="type">
                        <option value="SalesPerson">SalesPerson</option>
                        <option value="Manager">Manager</option>
                    </select> 
                    <input class="button" type="submit" value="Create">
                </form>
                <form action="staffInformationManagement.jsp">
                        <input class="cancel" type="submit" value="Cancel">
                </form>
            </div>
        </div>
    </body>
</html>
