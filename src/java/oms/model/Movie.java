/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;
import java.io.*;

/**
 *
 * @author Whyte
 */
public class Movie implements Serializable {
    
    private String movieID;
    private String movieName;
    private String movieGenre;
    private String price;
    private String releaseDate;
    private String copies;

    public Movie(String movieID, String movieName, String movieGenre, String price, String releaseDate, String copies) {
        this.movieID = movieID;
        this.movieName = movieName;
        this.movieGenre = movieGenre;
        this.price = price;
        this.releaseDate = releaseDate;
        this.copies = copies;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getMovieID() {
        return movieID;
    }

    public String getMovieName() {
        return movieName;
    }

    public String getMovieGenre() {
        return movieGenre;
    }

    public String getPrice() {
        return price;
    }

    public String getCopies() {
        return copies;
    }

    public void setMovieID(String movieID) {
        this.movieID = movieID;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public void setMovieGenre(String movieGenre) {
        this.movieGenre = movieGenre;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setCopies(String copies) {
        this.copies = copies;
    }

    
    
}
