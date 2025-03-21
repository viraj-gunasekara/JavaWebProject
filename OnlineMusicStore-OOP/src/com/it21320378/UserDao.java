package com.it21320378;
/*Data Access Object (DAO) class -  to handle users*/
import java.sql.*;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	/* Constructor to initialize the DAO connection*/
	public UserDao(Connection con) {
		this.con = con;
	}
	
	/*Method to Implement User Login*/
	public User userLogin(String email, String password) {
		User user = null;
		try {
			/*SQL query to find a user with the provided email and password*/
			query = "select * from users where email=? and password=?";
			/*setting input parameters, for place holders - email & pw*/
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			
			rs = pst.executeQuery();
			
			//If a matching user is found in the database
			if(rs.next()) {
				// Create a new User object to hold data
				user = new User();
				//take the users properties from the DB, and store it in the new user object.
				user.setId(rs.getInt("uid"));
				user.setFname(rs.getString("fname"));
				user.setEmail(rs.getString("email"));
			}
		// Handle any exceptions and print the error message
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		// Return the user object (null if login failed)
		return user;
	}
}
