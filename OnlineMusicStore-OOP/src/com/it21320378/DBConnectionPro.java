package com.it21320378;
/*DB connection provider class*/

import java.sql.*;

public class DBConnectionPro {

	/*Declare a static Connection object*/
    private static Connection con;

    /*Method to establish and return a database connection*/
    public static Connection getCon() throws SQLException {
        try {
        	/*Load MySQL JDBC Driver*/
            Class.forName("com.mysql.cj.jdbc.Driver");
            /*Establish connection to the MySQL database - via localhost URL*/
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/music_store_oop","root","admin");
            
            System.out.print("dbconnected");
        }catch (Exception ex) {
            ex.printStackTrace();
        } 
        return con;
    }
}
