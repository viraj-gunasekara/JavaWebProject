<%@page import="com.it21320378.DBConnectionPro"%>
<%@page import="com.it21320378.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!-- get user session, from "auth" attribute -->
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth!=null){
		request.setAttribute("auth", auth);
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if(cart_list != null){
		ProductDao pDao = new ProductDao(DBConnectionPro.getCon());
		cartProduct = pDao.getCartProducts(cart_list);
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cart</title>
	<!-- css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!-- Cart Panel -->
    <div id="cart-panel" class="cart-panel">
        <!-- Header -->
        <div class="cart-header">
            <h2>Your Cart</h2>
            <span id="close-cart" class="fas fa-times"></span>
        </div>

        <!-- Content -->
        <div class="cart-content">
        
        <% if(cart_list != null) {
        	for(Cart c:cartProduct){ %>
        		<div class="cart-item">
                <div class="item-details">
                    <img src="image/allprod_images/<%= c.getImage() %>" alt="Guitar" class="item-image">
                    <div class="item-info">
                        <h3><%= c.getName() %></h3>
                        <p><%= c.getCategory() %></p>
                        <p>Unit Price: LKR <%= (int)(c.getPrice()) %>.00 </p>
                    </div>
                </div>

				<form action="" method="post">
					<input type="hidden" name="id" value="<%= c.getId() %>">
					<div class="item-actions">
						<div class="quantity-control">
                        	<a href=""><button class="qty-btn">-</button></a>
                        	<input type="text" name="quantity" value="1">
                        	<a href=""><button class="qty-btn">+</button></a>
                    	</div>
					</div>
					<p class="item-total">Total: LKR </p>
					<button class="cancel-btn">Remove</button>
				</form>
				
            </div>
        	<%}
        }
        %>

            <div class="cart-footer">
                <h3>Grand Total: LKR <span id="grand-total">45,500.00</span></h3>
                <button class="checkout-btn">Checkout</button>
            </div>
        </div>
    </div>

    <!-- js -->
    <script src="js/script.js"></script>
</body>
</html>