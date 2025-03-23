package com.it21320378;
/*Create Order.java bean(model)(class) */
/*extend the Order model to product model- with inheritance, can access everything from products*/
public class Order extends Product{
	/*addition to Product class attributes, here we need order related attribs*/
	/*in DB Order table you need to have these columns*/
	private int orderId;
	private int userId;
	private int itemQuantity;
	private String date;
	
	/*Default constructor*/
	public Order() {
	}

	/*Parameterized constructor*/
	public Order(int orderId, int userId, int itemQuantity, String date) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.itemQuantity = itemQuantity;
		this.date = date;
	}

	/*Parameterized constructor, without OID*/
	public Order(int userId, int itemQuantity, String date) {
		super();
		this.userId = userId;
		this.itemQuantity = itemQuantity;
		this.date = date;
	}

	/*getters & setters*/
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getItemQuantity() {
		return itemQuantity;
	}

	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	/*toString Method for debugging*/
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", itemQuantity=" + itemQuantity + ", date=" + date
				+ "]";
	}
}
