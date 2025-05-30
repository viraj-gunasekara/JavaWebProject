package com.it21320378;
/*Create Products.java bean(model)(class) */

public class Product {
	/*in databse you need to have these columns*/
	private int id;
	private String name;
	private String category;
	private double price;
	private String image;
	
	/*Default constructor*/
	public Product() {
	}

	/*Parameterized constructor*/
	public Product(int id, String name, String category, double price, String image) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
	}

	/*getters & setters*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	/*toString Method for debugging*/
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image=" + image + "]";
	}
	
}
