<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="oms.dao.*"%>
<%@page import="oms.controller.*"%>
<%@page import="oms.model.*" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Movie Management</title>
    </head>
    <body>
        <h1 class="logo">Movie Management</h1>

        <div class="container">
            <form action="movieManagement.jsp" method="post">
                <input id="search_box" type="text" name="movieName" placeholder="Movie Name"/>
                <input id="search_box" type="text" name="movieGenre"  placeholder="Genre"/>
                <input id="search_button" class="button" type="submit" value="Search">
            </form>
            <table class="search_table">
                <thead>
                    <tr>
                        <th>MOVIE NAME</th>
                        <th>MOVIE GENRE</th>
                        <th>PRICE</th>
                        <th>RELEASE DATE</th>
                        <th>COPIES</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DBManager db = (DBManager) session.getAttribute("manager");
                        ArrayList<Movie> movies;
                        if (request.getParameter("movieName") != null) {
                            movies = db.searchMovies(request.getParameter("movieName"), request.getParameter("movieGenre"));
                        } else {
                            movies = db.getMovie("MOVIES");
                        }
                        for (int i = 0; i < movies.size(); i++) {
                    %>
                    <tr>

                        <td><a href="editMovieManagement.jsp?title=<%= (movies.get(i).getMovieName())%>"><%= movies.get(i).getMovieName()%></td>
                        <td><%= movies.get(i).getMovieGenre()%></td>
                        <td><%= movies.get(i).getPrice()%></td>
                        <td><%= movies.get(i).getReleaseDate()%></td>
                        <td><%= movies.get(i).getCopies()%></td>
                    </tr>
                    <% }%>
                </tbody>         
            </table>
            <button class="create_button" onclick="location.href = 'createMovieManagement.jsp'"> Create </button>
            <button class="cancel_button" onclick="location.href = 'staffProfile.jsp'" > Cancel </button>
        </div>
    </body>
</html>