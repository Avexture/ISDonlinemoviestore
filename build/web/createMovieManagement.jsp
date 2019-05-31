<%-- 
    Document   : createMovieManagement
    Created on : 29/05/2019, 2:30:57 PM
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
            <h1>Create Customer</h1>
            <div class="form">
                <form action="createMovieManagementModel.jsp" method="POST">
                    <input type="text" name="movieName" placeholder="Movie Name" required>
                    <input type="" name="movieGenre" placeholder="Movie Genre" required>
                    <input type="text" name="price" placeholder="Movie Price" required>
                    <input type="text" name="releaseDate" placeholder="Movie ReleaseDate" required>
                    <input type="text" name="copies" placeholder="Movie Copies" required>
                    <input class="button" type="submit" value="Create">
                </form>
                <form action="customerInformationManagement.jsp">
                        <input class="cancel" type="submit" value="Cancel">
                </form>
            </div>
        </div>
    </body>
</html>
