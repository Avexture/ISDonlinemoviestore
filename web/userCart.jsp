<%-- 
    Document   : userCart
    Created on : 30/05/2019, 6:35:45 PM
    Author     : William
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="logo">User Cart</h1>
        
        <div class="container">
                <form action="userCart.jsp" method="post">
                    <input id="search_box" type="text" name="name" placeholder="Name"/>
                    <input id="search_button" class="button" type="submit" value="Search">
                </form>
            <table class="search_table">
                <thead>
                  <tr>
                    <th>ORDER lINE ID</th>
                    <th>MOVIE NAME</th>
                    <th>COPIES</th>
                    <th>DELETE</th>
                  </tr>
                </thead>
                
                <tbody>
                    <% 
                        DBManager db = (DBManager) session.getAttribute("manager");
                        ArrayList<OrderLines> l;
                        User user = (User) session.getAttribute("user");
                        if(((String)session.getAttribute("anonEmail"))!= null){
                            l = db.getOrderLine(db.getCart((String)session.getAttribute("anonEmail")));
                        }
                        else if(user != null){
                            l = db.getOrderLine(db.getCart(user.getUserEmail()));
                        }           
                        else{
                            l = new ArrayList<OrderLines>();
                        }
                        
                        for(int i = 0; i < l.size(); i++) {
                    %>
                            <tr>
                                <td><%= l.get(i).getOrderLineID()%></td>
                                <td><%= db.getMovieName(l.get(i).getMovieID())%></td>
                                <td><%= l.get(i).getCopies()%></td>
                                <td><a href="userCartDeleteModel.jsp?orderLineID=<%=(l.get(i).getOrderLineID())%>">Delete</a></td>
                            </tr>
                    <% } %>
                </tbody>         
            </table>
            <button class="create_button" onclick="location.href='userSubmitCartModel.jsp'"> Submit </button>
            <button class="create_button" onclick="location.href='userCancelCartModel.jsp'"> cancel </button>
            <button class="cancel_button" onclick="location.href='movieCustomerSearch.jsp'" > Return </button>


        </div>
    </body>
</html>
