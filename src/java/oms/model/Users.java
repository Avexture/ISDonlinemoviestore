/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;
import java.util.*;

/**
 *
 * @author Whyte
 */
public class Users {
    
    private ArrayList<User> list = new ArrayList<User>();
    
    public ArrayList<User> getList() {
        return list;
   }
    
    public void addUser(User user) {
        list.add(user);
    }
    
    public User login (String userEmail, String password) {
        for(User user : list){
            if (user.getUserEmail().equals(userEmail) && user.getPassword().equals(password)){
                return user;
           }
        }
    return null;
    }
    
    public User getUser(String email) {
        for (User user : list) {
            if (user.getUserEmail().equals(email)) {
                return user;
            }
        }
        return null;
    }
    
    public boolean passwordCorrect(String password, User user){
        if (user.getPassword().equals(password)) {
            return true;
        }
        return false;
    }
}
