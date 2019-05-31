<%-- 
    Document   : register
    Created on : 29/05/2019, 11:49:02 AM
    Author     : Conforto
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
            <h1>Register</h1>
            <div class="form">
                <form action="registerAction.jsp" method="POST">
                    <input type="text" name="email" placeholder="Email" required>
                    <input type="text" name="name" placeholder="Name" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <input type="text" name="phone" placeholder="Phone" equired>
                    <input type="text" name="address" placeholder="Address" required>
                    <select name="type">
                        <option value="Individual">Individual</option>
                        <option value="Company">Company</option>
                    </select> 
                    <input class="button" type="submit" value="REGISTER">

                </form>
            </div>
        </div>
    </body>
</html>
