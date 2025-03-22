package com.it21320378;
/*Data Access Object (DAO) class -  to handle products*/
import java.sql.*;
import java.util.*;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	/* Constructor to initialize the DAO connection*/
	public ProductDao(Connection con) {
		this.con = con;
	}
	
	/*Method to get all Products from the db*/
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("pid"));
				row.setName(rs.getString("pname"));
				row.setCategory(rs.getString("pcategory"));
				row.setPrice(rs.getString("pprice"));
				row.setImage(rs.getString("pimage"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
}
