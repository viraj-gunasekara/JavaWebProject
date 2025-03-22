package com.it21320378;
/*Create User.java bean(model)(class) */
/*Beans are primarily used in Java EE applications to represent data objects*/

public class User {
    int id;
    String fname;
    String lname;
    String email;
    int pnum;
    String password;
     
    /*Default constructor*/
	public User() {
	}

	/*Parameterized constructor*/
	public User(int id, String fname, String lname, String email, int pnum, String password) {
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.pnum = pnum;
		this.password = password;
	}

	/*getters & setters*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/*toString Method for debugging*/
	@Override
	public String toString() {
		return "User [id=" + id + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", pnum=" + pnum
				+ ", password=" + password + "]";
	}
    
    
}
