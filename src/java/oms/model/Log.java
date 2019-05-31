/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;

import java.util.Date;

/**
 *
 * @author Whyte
 */
public class Log {
    private String sessionID;
    private String ID;
    private String login;
    private String logout;
    private String loginDate;

    public Log(String sessionID, String ID, String login, String logout, String loginDate) {
        this.sessionID = sessionID;
        this.ID = ID;
        this.login = login;
        this.logout = logout;
        this.loginDate = loginDate;
    }

    public String getSessionID() {
        return sessionID;
    }

    public void setSessionID(String sessionID) {
        this.sessionID = sessionID;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getLogout() {
        return logout;
    }

    public void setLogout(String logout) {
        this.logout = logout;
    }

    public String getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(String loginDate) {
        this.loginDate = loginDate;
    }
    
    

}
