package com.it21320378.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it21320378.*;

@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter();){
			/*out.println("Checkout servlet");*/
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			/*retrieve products in the cart*/
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			/*check the user is loggedin or not - user authentication*/
			User auth = (User) request.getSession().getAttribute("auth");
			
			if (auth == null) {
                out.println("<script>alert('Login to complete your order'); window.location='index.jsp';</script>");
                return;
            }

            if (cart_list == null || cart_list.isEmpty()) {
                out.println("<script>alert('Add items to the cart before checkout'); window.location='index.jsp';</script>");
                return;
            }
            
			/*check the user is logged in & cart list is not empty*/
			if(cart_list != null && auth != null) {
				
				for(Cart c:cart_list) {
					Order order = new Order();
					order.setOrderId(c.getId());
					order.setUserId(auth.getId());
					order.setItemQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					/*send to the orderDao, to insert to db*/
					OrderDao oDao = new OrderDao(DBConnectionPro.getCon());
					boolean result = oDao.insertOrder(order);
					if(!result) {
						break;
					}
				}
				
				/*if process success, clear the cart & redirect to the orders page*/
				cart_list.clear();
				response.sendRedirect("orders.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*dopost method handling the doget mthod*/
		doGet(request, response);
	}

}
