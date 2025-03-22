package com.it21320378;
/*Create Cart.java bean(model)(class) */
/*extend the Cart model to product model- with inheritance, can access everything from products*/
public class Cart extends Product{
	/*addition to Product class attributes, here we need an extra variable, quantity*/
	private int quantity;
	
	/*Default constructor*/
	public Cart() {
	}

	/*getters & setters*/
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
