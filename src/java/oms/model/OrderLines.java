/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;

import java.io.*;

/**
 *
 * @author Conforto
 */
public class OrderLines implements Serializable{
    
    private String orderLineID;
    private String orderID;
    private String movieID;
    private String copies;
    
    public OrderLines(String orderLineID, String orderID, String movieID, String copies) {
            this.orderLineID = orderLineID;
            this.orderID = orderID;
            this.movieID = movieID;
            this.copies = copies;
        }
    
    public String getOrderLineID() {
        return orderLineID;
    }

    public void setOrderLineID(String orderLineID) {
        this.orderLineID = orderLineID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getMovieID() {
        return movieID;
    }

    public void setMovieID(String movieID) {
        this.movieID = movieID;
    }

    public String getCopies() {
        return copies;
    }

    public void setCopies(String copies) {
        this.copies = copies;
    }

    
}
