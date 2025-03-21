package com.it21320378.servlet;
/*in logout, we remove the user session saved by user login*/
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			/*check, if a session is exist or not*/
			/*in loginServlet, we store session in "auth", here we check is it available*/
			if(request.getSession().getAttribute("auth") != null) {
				request.getSession().removeAttribute("auth");
				/*after remove the session, send the loged-out user to the login page.*/
				response.sendRedirect("index.jsp");
			}else {
				response.sendRedirect("index.jsp");
			}
		}
	}
}
