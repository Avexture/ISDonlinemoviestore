<%-- 
    Document   : addMovies
    Created on : 28/05/2019, 10:57:14 AM
    Author     : Minh
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
        <title>Create Movie Action</title>
    </head>
    <body>
        <%
            DBManager db = (DBManager) session.getAttribute("manager");
            Random rnd = new Random();
            int number = rnd.nextInt(999999);
            
            String movieID = String.format("%06d", number);
            String movieName = request.getParameter("movieName");
            String movieGenre = request.getParameter("movieGenre");
            String price = request.getParameter("price");
            String releaseDate = request.getParameter("releaseDate");
            String copies = request.getParameter("copies");
        %>
        <p>Redirecting...</p>
        <%
            Movie movie = new Movie(movieID, movieName, movieGenre, price, releaseDate, copies);
            db.addMovie(movieID, movieName, movieGenre, price, releaseDate, copies);
            response.sendRedirect("movieManagement.jsp");

        %>
    </body>
</html>