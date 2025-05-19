package com.it21320378.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.it21320378.DBConnectionPro;
import com.it21320378.UserDao;
import com.it21320378.User;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		//Validation, To avoid runtime errors if pnum is missing or not a valid number
		int pnum = 0;
		try {
		    pnum = Integer.parseInt(request.getParameter("pnum"));
		} catch (NumberFormatException e) {
		    pnum = 0; 
		}
		
		String password = request.getParameter("password");
		//make user object
		User userModel = new User(fname, lname, email, pnum, password);

		//create a database model
		UserDao  regUser = new UserDao(DBConnectionPro.getCon());
		
		if (regUser.saveUser(userModel)) {
			/*save the user session after he registered in*/
			request.getSession().setAttribute("auth", userModel);
			/*registration success user send back to the home page*/
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("RegError", "This email is already registered!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("register-alert.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
