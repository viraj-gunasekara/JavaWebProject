package com.it21320378;
/*Data Access Object (DAO) class -  to handle orders*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/*import models*/
import com.it21320378.*;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	/* Constructor to initialize the DAO connection*/
	public OrderDao(Connection con) {
		this.con = con;
	}
	
	/*Method to insert order data to the db order table*/
	public boolean insertOrder(Order model) {
		boolean result = false;
		
		try {
			/*SQL query to enter order data to table, initially we dont know the values*/
			query = "insert into orders (pid, uid, o_itemquantity, odate) values(?,?,?,?)";
			
			/*setting input parameters, for place holders*/
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getOrderId());
			pst.setInt(2, model.getUserId());
			pst.setInt(3, model.getItemQuantity());
			pst.setString(4, model.getDate());
			/*execute the query*/
			pst.executeUpdate();
			result = true;
			
		// Handle any exceptions
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// Return the order object (false if order failed)
		return result;
	}
	
	
	/*method to retrieve all the order info from db table*/
	public List<Order> userOrders(int id){
		List<Order> list = new ArrayList<>();
		
		try {
			/*SQL query to get all orders, of a user, from Order Table, in decending order*/
			query = "select * from orders where uid=? order by orders.oid desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.con);
				int pId = rs.getInt("pid");
				
				Product product = productDao.getSingleProduct(pId);
				order.setOrderId(rs.getInt("oid"));
				order.setId(pId);
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setPrice(product.getPrice()*rs.getInt("o_itemquantity"));
				order.setItemQuantity(rs.getInt("o_itemquantity"));
				order.setDate(rs.getString("odate"));
				list.add(order);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
