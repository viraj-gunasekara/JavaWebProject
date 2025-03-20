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
			/*sql query to check the user exist in the db*/
			query = "select * from users where email=? and password=?";
			/*setting email & pw*/
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				// Create a new object to store retrieve data
				user = new User();
				user.setId(rs.getInt("uid"));
				user.setFname(rs.getString("fname"));
				user.setEmail(rs.getString("email"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}
}
