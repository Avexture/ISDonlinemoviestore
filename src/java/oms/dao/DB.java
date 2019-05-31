 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.dao;

import java.sql.Connection;

/**
 *
 * @author Whyte
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/"; // host url
    protected String db = "G21-OMS"; // database name
    protected String dbuser = "group21";//db root user
    protected String dbpass = "password";//db root password
    protected String driver = "org.apache.derby.jdbc.ClientDriver";  //jdbc client driver - built in with NetBeans
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}
