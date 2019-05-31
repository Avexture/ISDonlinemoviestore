<%-- 
    Document   : register
    Created on : 10/04/2019, 11:48:45 AM
    Author     : Whyte
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
            <h1>Create Customer</h1>
            <div class="form">
                <form action="createCustomerInformationManagementModel.jsp" method="POST">
                    <input type="text" name="email" placeholder="Customer email" required>
                    <input type="text" name="name" placeholder="Customer name" required>
                    <input type="password" name="password" placeholder="Customer password" required>
                    <input type="text" name="phone" placeholder="Customer phone" required>
                    <input type="text" name="address" placeholder="Customer address" required>
                    <select name="type">
                        <option value="Individual">Individual</option>
                        <option value="Company">Company</option>
                    </select> 
                    <input class="button" type="submit" value="Create">
                </form>
                <form action="customerInformationManagement.jsp">
                        <input class="cancel" type="submit" value="Cancel">
                </form>
            </div>
        </div>
    </body>
</html>
