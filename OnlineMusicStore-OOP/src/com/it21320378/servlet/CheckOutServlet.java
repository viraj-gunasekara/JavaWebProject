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

        try (PrintWriter out = response.getWriter()) {

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            // Retrieve products in the cart
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

            // Check user authentication
            User auth = (User) request.getSession().getAttribute("auth");

            if (auth == null) {
                // Redirect back with error message
                response.sendRedirect("index.jsp?error=login");
                return;
            }

            if (cart_list == null || cart_list.isEmpty()) {
                // Redirect back with error message
                response.sendRedirect("index.jsp?error=emptycart");
                return;
            }

            // Process the order
            boolean allSuccess = true;
            for (Cart c : cart_list) {
                Order order = new Order();
                order.setOrderId(c.getId());
                order.setUserId(auth.getId());
                order.setItemQuantity(c.getQuantity());
                order.setDate(formatter.format(date));

                OrderDao oDao = new OrderDao(DBConnectionPro.getCon());
                boolean result = oDao.insertOrder(order);

                if (!result) {
                    allSuccess = false;
                    break;
                }
            }

            if (allSuccess) {
                // Clear the cart list
                cart_list.clear();
                response.sendRedirect("orders.jsp");
            } else {
                // Handle error case if order insertion fails
                response.sendRedirect("index.jsp?error=orderfail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=servererror");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
