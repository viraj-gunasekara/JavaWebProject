package com.it21320378.servlet;
/*Servlet to handle login.jsp form*/
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it21320378.DBConnectionPro;
import com.it21320378.User;
import com.it21320378.UserDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*if someone access the methods by just typing url, he redirect to*/
		//this is security mesure
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			/*used to debug to know the servlet is working in frontend*/
			/*out.print("this is login servlet");*/
			
			/*Grab the  user data when submit the form, here names should match with names in the login.jsp form*/
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			
			/*used to debug email & pw passed in frontend*/
			/*out.print(email+password);*/
			
			try {
				UserDao udao = new UserDao(DBConnectionPro.getCon());
				
				/*check the user login is success or not, after match with email & pw in the DB*/
				User user = udao.userLogin(email, password);
				
				if(user != null) {
					/*out.print("user login success");*/
					
					/*save the user session after he logged in*/
					request.getSession().setAttribute("auth", user);
					/*login success user send back to the home page*/
					response.sendRedirect("index.jsp");
				}else {
					out.print("user login failed");
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
