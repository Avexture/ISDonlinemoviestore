<%-- 
    Document   : editMovies
    Created on : 28/05/2019, 10:52:08 AM
    Author     : Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.dao.*"%>
<%@page import="oms.controller.*"%>
<%@page import="oms.model.*" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success!</title>
    </head>
    <body>
        <%

            DBManager db = (DBManager) session.getAttribute("manager");
            String movieID = (String) session.getAttribute("ID");

            String movieName = request.getParameter("movieName");
            String movieGenre = request.getParameter("movieGenre");
            String price = request.getParameter("price");
            String releaseDate = request.getParameter("releaseDate");
            String copies = request.getParameter("copies");

            db.updateMovie(movieID, movieName, movieGenre, price, releaseDate, copies);

            session.removeAttribute("ID");
            response.sendRedirect("movieManagement.jsp");
        %>
    </body>
</html>
