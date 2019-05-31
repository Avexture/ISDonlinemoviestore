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
        <title>Edit Movie's</title>
    </head>
    <body>
        <%
            String name= request.getParameter("title");
            DBManager db = (DBManager) session.getAttribute("manager");       
            Movie movie = (Movie) db.findMovieName(name);
            session.setAttribute("ID", movie.getMovieID());
            if (movie != null) {              
                
                
        %>
        <h1 class="logo">Account Management</h1>
        <div class="edit-container">
                <div class="form">
                    <h1 class="title">Edit <%= movie.getMovieName() %>'s details:</h1>
                    <form action="editMovieManagementModel.jsp" method="POST">
                        <p><a>Name:</a></p>
                        <input type="text" name="movieName" value="<%= movie.getMovieName()%>">
                        <p><a>Genre:</a></p>
                        <input type="text" name="movieGenre" value="<%= movie.getMovieGenre()%>">
                        <p><a>Price:</a></p>
                        <input type="text" name="price" value="<%= movie.getPrice()%>">
                        <p><a>Release Date:</a></p>
                        <input type="text" name="releaseDate" value="<%= movie.getReleaseDate()%>">
                        <p><a>Copies:</a></p>
                        <input type="text" name="copies" value="<%= movie.getCopies() %>">
                        
                        
                        <input type="hidden" value="updated" name="updated">
                        <input class="button" type="submit" value="Update">
                    </form>
                    <form action="deleteMovieManagementModel.jsp" method="POST">
                        <input class="delete" type="submit" value="Delete">
                    </form>
                    <form action="movieManagement.jsp">
                        <input class="cancel" type="submit" value="Cancel">
                    </form>   
                </div>
        </div>
                            
        <% }else if (movie == null) { %>
                <p>You are not logged in. Please click <a href="login.jsp">here</a> to login in order to change your account details.</p>
        <% } %>
    </body>
</html>
