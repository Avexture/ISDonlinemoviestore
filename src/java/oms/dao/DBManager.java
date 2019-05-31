/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.dao;

import oms.model.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Justin
 */
public class DBManager {

    private Statement st;
    private String emailPattern = "[a-zA-Z\\._]+@([a-z-]+(\\..){0,1})+";
    private String namePattern = "[A-Za-z\\s]+";
    private String passwordPattern = ".{8,}";
    private String addressPattern = "\\d+\\s[A-Z][a-z]+(\\s[A-Z][a-z]+)+";
    private String phonePattern = "\\d{7,10}";

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public void addStaff(String id, String email, String password, String fullName, String phoneNumber, String address, String type, String status) throws SQLException {
        st.executeUpdate("INSERT INTO STAFF VALUES('" + id + "', '" + email + "', '" + password + "', '" + fullName + "', '" + phoneNumber + "', '" + address + "', '" + type + "', '" + status + "')");
    }


    public void addCustomer(String id, String email, String password, String fullName, String phoneNumber, String address, String type, String status) throws SQLException {
        st.executeUpdate("INSERT INTO CUSTOMERS VALUES('" + id + "', '" + email + "', '" + password + "', '" + fullName + "', '" + phoneNumber + "', '" + address + "', '" + type + "', '" + status + "')");
    }

    //select all users from a database table and store them into an array list in students
    public ArrayList<User> getUsers(String table) throws SQLException {
        ArrayList<User> users = new ArrayList();
        ResultSet rs = st.executeQuery("SELECT * FROM " + table);

        while (rs.next()) {
            String ID = rs.getString(1);
            String userEmail = rs.getString(2);
            String password = rs.getString(3);
            String fullName = rs.getString(4);
            String phoneNumber = rs.getString(5);
            String address = rs.getString(6);
            String type = rs.getString(7);
            String status = rs.getString(8);
            users.add(new User(ID, userEmail, password, fullName, phoneNumber, address, type, status));
        }

        return users;
    }

    public ArrayList<User> searchUsers(String table, String name, String type) throws SQLException {
        ArrayList<User> users = new ArrayList();
        ResultSet rs = st.executeQuery("SELECT * FROM " + table + " WHERE lower(FULLNAME) LIKE '%" + name.toLowerCase() + "%' AND TYPE LIKE '%" + type + "%'");

        while (rs.next()) {
            String ID = rs.getString(1);
            String userEmail = rs.getString(2);
            String password = rs.getString(3);
            String fullName = rs.getString(4);
            String phoneNumber = rs.getString(5);
            String address = rs.getString(6);
            String accountType = rs.getString(7);
            String status = rs.getString(8);
            users.add(new User(ID, userEmail, password, fullName, phoneNumber, address, accountType, status));
        }

        return users;
    }

    public User findCustomer(String userEmail, String password) throws SQLException {
        String fetch = "select * from CUSTOMERS where USEREMAIL ='" + userEmail + "' and PASSWORD ='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String ID = rs.getString(1);
            String email = rs.getString(2);
            String userPass = rs.getString(3);
            if (email.equals(userEmail) && userPass.equals(password)) {
                String fullName = rs.getString(4);
                String phoneNumber = rs.getString(5);
                String address = rs.getString(6);
                String type = rs.getString(7);
                String status = rs.getString(8);
                return new User(ID, userEmail, password, fullName, phoneNumber, address, type, status);
            }
        }
        return null;
    }

    public User findCustomerEmail(String userEmail) throws SQLException {
        String fetch = "select * from CUSTOMERS where USEREMAIL ='" + userEmail + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String email = rs.getString(2);
            if (email.equals(userEmail)) {
                String ID = rs.getString(1);
                String userPass = rs.getString(3);
                String fullName = rs.getString(4);
                String phoneNumber = rs.getString(5);
                String address = rs.getString(6);
                String type = rs.getString(7);
                String status = rs.getString(8);
                return new User(ID, userEmail, userPass, fullName, phoneNumber, address, type, status);
            }
        }
        return null;
    }
    
        public User findStaffEmail(String userEmail) throws SQLException {
        String fetch = "select * from STAFF where USEREMAIL ='" + userEmail + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String email = rs.getString(2);
            if (email.equals(userEmail)) {
                String ID = rs.getString(1);
                String userPass = rs.getString(3);
                String fullName = rs.getString(4);
                String phoneNumber = rs.getString(5);
                String address = rs.getString(6);
                String type = rs.getString(7);
                String status = rs.getString(8);
                return new User(ID, email, userPass, fullName, phoneNumber, address, type, status);
            }
        }
        return null;
    }

    public User findStaff(String userEmail, String password) throws SQLException {
        String fetch = "select * from STAFF where USEREMAIL ='" + userEmail + "' and PASSWORD ='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String email = rs.getString(2);
            String userPass = rs.getString(3);
            if (email.equals(userEmail) && userPass.equals(password)) {
                String ID = rs.getString(1);
                String fullName = rs.getString(4);
                String phoneNumber = rs.getString(5);
                String address = rs.getString(6);
                String type = rs.getString(7);
               String status = rs.getString(8);
                return new User(ID, email, userPass, fullName, phoneNumber, address, type, status);
            }
        }
        return null;
    }

    public boolean checkCustomer(String email, String password) throws SQLException {
        String fetch = "select * from CUSTOMERS where USEREMAIL ='" + email + "'and PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(1);
            String userPass = rs.getString(1);
            if (userEmail.equals(email) && userPass.equals(password)) {
                return true;
            }
        }
        return false;
    }

    public void updateCustomer(String ID, String email, String password, String fullName, String phoneNumber, String address, String type, String status) throws SQLException {
        st.executeUpdate("UPDATE CUSTOMERS SET USEREMAIL='" + email + "', PASSWORD='" + password + "', FULLNAME='" + fullName + "', PHONENUMBER='" + phoneNumber + "', ADDRESS='" + address + "', TYPE='" + type + "', STATUS='"+ status + "' WHERE ID ='" + ID + "'");
    }

    public void updateStaff(String ID, String email, String password, String fullName, String phoneNumber, String address, String type, String status) throws SQLException {
        st.executeUpdate("UPDATE STAFF SET USEREMAIL='" + email + "', PASSWORD='" + password + "', FULLNAME='" + fullName + "', PHONENUMBER='" + phoneNumber + "', ADDRESS='" + address + "', TYPE='" + type + "', STATUS='"+ status + "' WHERE ID ='" + ID + "'");
    }
    
    public void deleteCustomer(String ID) throws SQLException {
        st.executeUpdate("DELETE FROM CUSTOMERS " + "WHERE ID='" + ID + "'");
    }
    public void deleteStaff(String ID) throws SQLException {
        st.executeUpdate("DELETE FROM STAFF " + "WHERE ID='" + ID + "'");
    }
    
    
        public void addMovie(String movieID, String movieName, String movieGenre, String price, String releaseDate, String copies) throws SQLException
    {
        st.executeUpdate("INSERT INTO MOVIES VALUES('" + movieID + "', '" + movieName +"', '" + movieGenre + "', " + price + ", '" + releaseDate + "', " + copies + ")" );
    }
    
    //select all users from a database table and store them into an array list in students
    public ArrayList<Movie> getMovie(String table) throws SQLException 
    {
        ArrayList<Movie> movies = new ArrayList();
        ResultSet rs = st.executeQuery("SELECT * FROM "+table);
        
        while (rs.next()) {
            String movieID = rs.getString(1);
            String movieName = rs.getString(2);
            String movieGenre = rs.getString(3);
            String price = rs.getString(4);
            String releaseDate = rs.getString(5);
            String copies = rs.getString(6);
            movies.add(new Movie(movieID, movieName, movieGenre, price, releaseDate, copies));
        }
        
        return movies;
    }
    
    public ArrayList<Movie> searchMovies(String name, String genre) throws SQLException 
    {
        ArrayList<Movie> movies = new ArrayList();
        ResultSet rs = st.executeQuery("SELECT * FROM " + "Movies" + " WHERE lower(TITLE) LIKE '%" + name.toLowerCase() + "%' AND lower(GENRE) LIKE '%" + genre.toLowerCase() + "%'");
        
        while (rs.next()) {
            String movieID = rs.getString(1);
            String movieName = rs.getString(2);
            String movieGenre = rs.getString(3);
            String price = rs.getString(4);
            String releaseDate = rs.getString(5);
            String copies = rs.getString(6);
            movies.add(new Movie(movieID, movieName, movieGenre, price, releaseDate, copies));
        }
        
        return movies;
    }
    
    public ArrayList<Movie> findMovie(String Table, String movieID, String movieName) throws SQLException {
        String fetch = "select * from Movies where MOVIEID ='" + movieID + "' and TITLE ='" + movieName + "'";
        ArrayList<Movie> movies = new ArrayList();
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String id = rs.getString(1);
            String name = rs.getString(2);
             if (id.equals(movieID) && name.equals(movieName)) {
                String movieGenre = rs.getString(3);
                String price = rs.getString(4);
                String releaseDate = rs.getString(5);
                String copies = rs.getString(6);
                movies.add(new Movie(movieID, movieName, movieGenre, price, releaseDate, copies));
            }
        }
        return movies;
    }
    
    public Movie findMovieName(String title) throws SQLException {
        String fetch = "select * from Movies where title ='" + title + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String name = rs.getString(2);
            if (name.equals(title)) {
                String ID = rs.getString(1);
                String genre = rs.getString(3);
                String price = rs.getString(4);
                String releaseDate = rs.getString(5);
                String copies = rs.getString(6);
               
                return new Movie(ID, name, genre, price, releaseDate, copies);
            }
        }
        return null;
    }
    
   public boolean checkMovie(String email, String password) throws SQLException {
       String fetch = "select * from CUSTOMERS where USEREMAIL ='"+ email + "'and PASSWORD='" + password + "'";
       ResultSet rs = st.executeQuery(fetch);
       
       while (rs.next()) {
           String userEmail = rs.getString(1);
           String userPass = rs.getString(1);
           if (userEmail.equals(email) && userPass.equals(password)) {
               return true;
           }    
       }
       return false;
   }
    
    public void updateMovie(String movieID, String movieName, String movieGenre, String price, String releaseDate, String copies) throws SQLException
    {
        st.executeUpdate("UPDATE MOVIES SET title='" + movieName + "',genre='" + movieGenre +  "', price=" + price + ",releasedate='" + releaseDate +  "',availablecopies=" + copies + "WHERE movieID ='" + movieID + "'");
    }
    
    
    
    public void deleteMovie(String movieid) throws SQLException
    {
      st.executeUpdate("DELETE FROM MOVIES " +"WHERE MOVIEID='" + movieid +  "'");
    }
    
    public Movie findMovieID(String movieID) throws SQLException {
        String fetch = "select * from CUSTOMERS where MOVIEID ='" + movieID + "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String id = rs.getString(1);
             if (id.equals(movieID)) {
                String movieName = rs.getString(2);
                String movieGenre = rs.getString(3);
                String price = rs.getString(4);
                String releaseDate = rs.getString(5);
                String copies = rs.getString(6);
                return new Movie(movieID, movieName, movieGenre, releaseDate, price, copies);
            }
        }
        return null;
    }
    
    public int getMovieCopies(String movieID, String copies) throws SQLException
    {
        String fetch = "select * from MOVIES where MOVIEID ='" + movieID + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String id = rs.getString(1);
            if (id.equals(movieID)) {
                String copyy = rs.getString(6);
                int availableCopies = Integer.parseInt(copyy);
                int copy = Integer.parseInt(copies);
                int total = availableCopies - copy;
                return total;
            }
        }
        return 0;
    }
    
    public int subtractMovieCopies(String movieID, String copies) throws SQLException
    {
        String fetch = "select * from MOVIES where MOVIEID ='" + movieID + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String id = rs.getString(1);
            if (id.equals(movieID)) {
                String copyy = rs.getString(6);
                int availableCopies = Integer.parseInt(copyy);
                int copy = Integer.parseInt(copies);
                int total = availableCopies - copy;
                return total;
            }
        }
        return 0;
    }
        
    public int addMovieCopies(String movieID, String copies) throws SQLException
    {
        String fetch = "select * from MOVIES where MOVIEID ='" + movieID + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String id = rs.getString(1);
            String copyy = rs.getString(6);
            int availableCopies = Integer.parseInt(copyy);
            int copy = Integer.parseInt(copies);
            int total = availableCopies + copy;
            return total;
            
        }
        return 0;
    }
    
    public String getMovieName(String movieID) throws SQLException
    {
        String fetch = "select * from MOVIES where MOVIEID ='" + movieID + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()){
            return rs.getString(2);
        }
        return null;
    }

    public void addToOrder(String movieID, String email, String address, String copies) throws SQLException{
        
        int movieCopies = subtractMovieCopies(movieID,copies);
        String fetch = "select * from ORDERS where EMAIL ='" + email + "' AND STATUS = 'SAVED'";
        ResultSet rs = st.executeQuery(fetch);
        String orderID;
        Random rnd = new Random();
        if(movieCopies >= 0){
            if(rs.next()){
                orderID = rs.getString(1);
                int number = rnd.nextInt(999999);
                String id = String.format("%06d", number);
                st.executeUpdate("INSERT INTO ORDERLINES VALUES('" + id + "', '" + orderID +"', '" + movieID + "', '" + copies + "')" );
                st.executeUpdate("UPDATE MOVIES SET availablecopies=" + movieCopies + " WHERE movieID ='" + movieID + "'");
            } else {
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
                LocalDateTime now = LocalDateTime.now();
                int number = rnd.nextInt(999999);
                String id = String.format("%06d", number);
                st.executeUpdate("INSERT INTO ORDERS VALUES('" + id + "', '" + dtf.format(now) + "', '" + email + "', '" + address + "', 'SAVED')" );
                number = rnd.nextInt(999999);
                String orderLineID = String.format("%06d", number);
                st.executeUpdate("INSERT INTO ORDERLINES VALUES('" + orderLineID + "', '" + id +"', '" + movieID + "', '" + copies + "')" );
                st.executeUpdate("UPDATE MOVIES SET availablecopies=" + movieCopies + " WHERE movieID ='" + movieID + "'");
            }
        }
    }

    public ArrayList<Orders> getOrder(String email) throws SQLException 
    {
        ArrayList<Orders> orders = new ArrayList();
        ResultSet rs = st.executeQuery("SELECT * FROM ORDERS WHERE EMAIL='" + email + "'");
        while (rs.next()){
            String orderID = rs.getString(1);
            String orderDate = rs.getString(2);
            String orderEmail = rs.getString(3);
            if(orderEmail.equals(email) ) {        
                String address = rs.getString(4);
                String status = rs.getString(5);
                orders.add(new Orders(orderID ,orderDate ,orderEmail ,address ,status ));
            }
        }
        return orders;
    }
    
    
    
    public String getCart(String email) throws SQLException 
    {
        ResultSet rs = st.executeQuery("select * from ORDERS where EMAIL ='" + email + "' AND STATUS = 'SAVED'");
        if (rs.next()){
            return rs.getString(1);
        }
        return null;
    }
    
    public ArrayList<OrderLines> getOrderLine(String orderid) throws SQLException 
    {
        ArrayList<OrderLines> orderLines = new ArrayList<OrderLines>();
        ResultSet rs = st.executeQuery("SELECT * FROM ORDERLINES WHERE ORDERID='" +  orderid + "'");
        while (rs.next()){
            String orderLineID = rs.getString(1);
            String orderId = rs.getString(2);
            String movieid = rs.getString(3);
            String copies = rs.getString(4);
            orderLines.add(new OrderLines(orderLineID ,orderId ,movieid ,copies));
        }
        return orderLines;
    }
    
public void deleteOrderLine(String orderLine) throws SQLException 
    {
        OrderLines line = new OrderLines("","","","");
        ResultSet rs = st.executeQuery("SELECT * FROM ORDERLINES WHERE ORDERLINEID='" +  orderLine + "'");
        if (rs.next()){
            String orderLineID = rs.getString(1);
            String orderId = rs.getString(2);
            String movieid = rs.getString(3);
            String copies = rs.getString(4);
            line = new OrderLines(orderLineID,orderId,movieid,copies);
            
        }
        int copyy = addMovieCopies(line.getMovieID(),line.getCopies());
        st.executeUpdate("UPDATE MOVIES SET availablecopies=" + copyy + " WHERE movieID ='" + line.getMovieID() + "'");
        st.executeUpdate("DELETE FROM ORDERLINES WHERE ORDERLINEID='" + line.getOrderLineID() +  "'");
    }
    
    public void submitOrder(String orderID) throws SQLException 
    {
        st.executeUpdate("UPDATE ORDERS SET STATUS='SUBMIT' WHERE ORDERID ='" + orderID + "'");
    }
        
    public void cancelOrder(String orderID) throws SQLException 
    {
        ArrayList<Movie> movies = new ArrayList<Movie>();
        String fetch = "SELECT ORDERLINES.ORDERLINEID, MOVIES.AVAILABLECOPIES FROM ORDERLINES INNER JOIN MOVIES ON ORDERLINES.MOVIEID = MOVIES.MOVIEID WHERE ORDERLINES.ORDERID='"+orderID+"'";
        ResultSet rs = st.executeQuery(fetch);
        while(rs.next()){
            String orderlineid = rs.getString(1);
            String availablecopies = rs.getString(2);
            movies.add(new Movie("" ,orderlineid , "" , "" , "", availablecopies));
        }
         for(int i = 0; i < movies.size(); i++)
        {   
            deleteOrderLine(movies.get(i).getMovieName());
            
        }
         st.executeUpdate("UPDATE ORDERS SET STATUS='CANCELLED' WHERE ORDERID ='" + orderID + "'");
         
        /*
        ArrayList<Movie> movies = new ArrayList<Movie>();
        //String fetch = "SELECT ORDERLINES.ORDERID, ORDERLINES.MOVIEID, ORDERLINES.COPIES,MOVIES.AVAILABLECOPIES FROM ORDERLINES INNER JOIN MOVIES ON ORDERLINES.MOVIEID = MOVIES.MOVIEID WHERE ORDERLINES.ORDERID='"+orderID+"'";
        ResultSet rs = st.executeQuery("SELECT ORDERLINES.ORDERLINEID, ORDERLINES.ORDERID, ORDERLINES.MOVIEID, ORDERLINES.COPIES, MOVIES.AVAILABLECOPIES FROM ORDERLINES INNER JOIN MOVIES ON ORDERLINES.MOVIEID = MOVIES.MOVIEID WHERE ORDERLINES.ORDERID='"+orderID+"'");
        while(rs.next()){
            String id = rs.getString(1);
            String movieId = rs.getString(2);
            String copies = rs.getString(3);
            String availablecopies = rs.getString(4);
            int total = Integer.parseInt(copies) + Integer.parseInt(availablecopies);
            movies.add(new Movie(movieId ,id , "" , "" , "",String.valueOf(total)));
        }
        for(int i = 0; i < movies.size(); i++)
        {        
            st.executeUpdate("UPDATE MOVIES SET availablecopies=" + Integer.parseInt(movies.get(i).getCopies()) + " WHERE movieID ='" + movies.get(i).getMovieID() + "'");  
            st.executeUpdate("UPDATE ORDERS SET STATUS='CANCELLED' WHERE ORDERID ='" + movies.get(i).getMovieName() + "'");
        }
        */
    }
   
    
    public void executeQuery(String query) throws SQLException {
        st.executeUpdate(query);
        
    }
    
    public void addLoginLog(String sessionID, String ID, String login, String logout, String date) throws SQLException
    {
        st.executeUpdate("INSERT INTO ACCESSLOGS VALUES('" + sessionID + "', '" + ID + "', '" + login +"', '" + logout + "', '" + date + "')");
    }
    
    public void updateLog(String sessionID, String ID, String login, String logout, String loginDate) throws SQLException 
    {
        st.executeUpdate("UPDATE ACCESSLOGS SET logout ='" + logout + "'WHERE sessionID ='" + sessionID + "' AND ID ='" + ID + "' AND LOGIN='" + login + "' AND LOGINDATE ='" + loginDate + "'");
    }
    
    public ArrayList<Log> getLogsByID(String ID) throws SQLException 
    {
        ArrayList<Log> logs = new ArrayList();
        ResultSet rs = st.executeQuery("SELECT * FROM ACCESSLOGS WHERE ID='" + ID + "'");
        
        while (rs.next()) {
            String sessionID = rs.getString(1);
            String userID = rs.getString(2);
            if(userID.equals(ID)) {
            String loginTime = rs.getString(3);
            String logoutTime = rs.getString(4);
            String loginDate = rs.getString(5);
            logs.add(new Log(sessionID, userID, loginTime, logoutTime, loginDate));
            }
        }
        return logs;
    }
    
       public Log findLogSessionID(String sessionID) throws SQLException {
        String fetch = "select * from ACCESSLOGS where sessionID ='" + sessionID + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String seshID = rs.getString(1);
            if (seshID.equals(sessionID)) {
                String userID = rs.getString(3);
                String login = rs.getString(3);
                String logout = rs.getString(4);
                String loginDate = rs.getString(5);
               
                return new Log(seshID, userID, login, logout, loginDate);
            }
        }
        return null;
    }
       
       public ArrayList<Log> searchLogs(String ID, String date) throws SQLException 
    {
        ArrayList<Log> logs = new ArrayList();
        ResultSet rs = st.executeQuery("SELECT * FROM ACCESSLOGS WHERE LOGINDATE ='" + date + "' AND ID='" + ID + "'");
        
        while (rs.next()) {
            String loginDate = rs.getString(5);
            String userID = rs.getString(2);
            if(userID.equals(ID) && loginDate.equals(date)) {
            String sessionID = rs.getString(1);
            String loginTime = rs.getString(3);
            String logoutTime = rs.getString(4);
            
            logs.add(new Log(sessionID, userID, loginTime, logoutTime, loginDate));
            }
        }
        return logs;
    }
       
       public void deleteLog(String sessionID) throws SQLException
    {
      st.executeUpdate("DELETE FROM ACCESSLOGS " +"WHERE SESSIONID='" + sessionID +  "'");
    }
       
       public boolean isValid(String pattern, String userInput){
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(userInput);
        return match.matches();
    }
       
    public boolean isValidEmail(String email){
        return isValid(emailPattern, email);
    }
    /**
     * Test for if a phone number is valid
     */
    public boolean isValidPhone(String phone){
        return isValid(phonePattern, phone);
    }
    /**
     * Test for if a name is valid
     */
    public boolean isValidName(String name){
        return isValid(namePattern, name);
    }
    /**
     * Test for if an address is valid
     */
    public boolean isValidAddress(String address){
        return isValid(addressPattern, address);
    }
    /**
     * Test for if a password is valid
     */
    public boolean isValidPassword(String password){
        return isValid(passwordPattern, password);
    }

}
