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
				row.setPrice(rs.getDouble("pprice"));
				row.setImage(rs.getString("pimage"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	/*Method to get details of the Products in the cart from product db*/
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
		
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					query = "select * from products where pid=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("pid"));
						row.setName(rs.getString("pname"));
						row.setCategory(rs.getString("pcategory"));
						row.setPrice(rs.getDouble("pprice")*item.getQuantity());
						row.setImage(rs.getString("pimage"));
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return products;
	}
	
	/*Method to get total price of the Products in the cart*/
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum =0;
		
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					query = "select pprice from products where pid=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						sum += rs.getDouble("pprice")*item.getQuantity();
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return sum;
	}
}
