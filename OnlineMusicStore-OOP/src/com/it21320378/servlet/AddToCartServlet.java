package com.it21320378.servlet;
import com.it21320378.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<>();
			
			int id = Integer.parseInt(request.getParameter("pid"));
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list ==  null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				
				/*out.println("session created and added the list");*/
				response.sendRedirect("allproducts.jsp");
			}else {
				/*out.println("cart list exist");*/
				cartList = cart_list;
				boolean exist = false;
				
				for(Cart c: cartList) {
					/*out.println(c.getId());*/
					if(c.getId() == id) {
						exist= true;
						out.println("<h3 style='color:crimson; text-align:center'>Item already exist in Cart.</h3>");
					}
				}
				
				if(!exist) {
					cartList.add(cm);
					/*out.println("product added");*/
					response.sendRedirect("allproducts.jsp");
				}
			}
			
			/*for(Cart c:cart_list) {
				out.println(c.getId());
			}*/
		}
	}

}
