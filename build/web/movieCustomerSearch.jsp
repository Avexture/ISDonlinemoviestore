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
                <form action="movieCustomerSearch.jsp" method="post">
                    <input id="search_box" type="text" name="movieName" placeholder="Movie Name"/>
                    <input id="search_box" type="text" name="movieGenre" placeholder="Genre"/>
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
                    <th>QUANTITY</th>
                    <th>ADD</th>
                  </tr>
                </thead>
                <tbody>
                    <% 
                        DBManager db = (DBManager) session.getAttribute("manager");
                        ArrayList<Movie> movies;
                        String zero = "0";
                        User user = (User) session.getAttribute("user");
                        if(session.getAttribute("anonEmail")!= null && request.getParameter("movieid") != null){
                            db.addToOrder(request.getParameter("movieid"), (String) session.getAttribute("anonEmail"),(String) session.getAttribute("anonAddress"), request.getParameter("quantity"));
                        }
                        if(request.getParameter("movieid") != null && user != null){
                           db.addToOrder(request.getParameter("movieid"), user.getUserEmail(), user.getAddress(), request.getParameter("quantity"));
                        }
                        if(request.getParameter("movieName") != null){
                           movies = db.searchMovies(request.getParameter("movieName"), request.getParameter("movieGenre"));
                        } else {
                           movies = db.getMovie("MOVIES");
                        }
                        for(int i = 0; i < movies.size(); i++) {
                            if(movies.get(i).getCopies() != zero){
                    %>
                    <tr>
                        <td><%= movies.get(i).getMovieName() %></td>
                        <td><%= movies.get(i).getMovieGenre()%></td>
                        <td><%= movies.get(i).getPrice()%></td>
                        <td><%= movies.get(i).getReleaseDate()%></td>
                        <td><%= movies.get(i).getCopies()%></td>
                        <%
                            if(user != null || session.getAttribute("anonEmail")!= null){
                        %>
                        <form action="movieCustomerSearch.jsp?movieid=<%= (movies.get(i).getMovieID())%>" method="post">
                            <td><input id="quantity" type="text" name="quantity"/> </td>
                            <td><input id="add_button" class="button" type="submit" value="add"></td>
                        </form>    
                        <%
                            }else{
                        %>
                        <form action="anonymousUserDetails.jsp" method="post">
                            <input type="hidden" name="movieid" value="<%= (movies.get(i).getMovieID())%>"/>
                            <td><input id="quantity" type="text" name="quantity"/> </td>
                            <td><input id="add_button" class="button" type="submit" value="add"></td>
                        </form>
                        <%
                            }
                        %>
                    </tr>
                    <% } }%>
                </tbody>         
            </table> 
                <button class="cancel_button" onclick="location.href='userCart.jsp'" > Cart </button>
                <% if(session.getAttribute("user") == null){%>
            <button class="cancel_button" onclick="location.href='index.jsp'" > Cancel </button>
            <% } else{%>
            <button class="cancel_button" onclick="location.href='customerProfile.jsp'" > Cancel </button>
            <%  }%>
        </div>
    </body>
</html>