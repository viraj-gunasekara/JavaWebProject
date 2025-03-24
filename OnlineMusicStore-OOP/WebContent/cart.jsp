<%@page import="com.it21320378.DBConnectionPro"%>
<%@page import="com.it21320378.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!-- get user session, from "auth" attribute -->
	<% 
	DecimalFormat dcf = new DecimalFormat("#,##0.00");
	request.setAttribute("dcf", dcf);
	
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth!=null){
		request.setAttribute("auth", auth);
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if(cart_list != null){
		ProductDao pDao = new ProductDao(DBConnectionPro.getCon());
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);
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
                        <p>Unit Price: LKR <%= dcf.format(c.getPrice()) %> X <%= c.getQuantity() %></p>
                    </div>
                </div>

				<form action="" method="post">
					<input type="hidden" name="id" value="<%= c.getId() %>">
					<div class="item-actions">
					
						<div class="quantity-control">
    						<button type="button" class="qty-btn dec-btn" data-pid="<%= c.getId() %>">-</button>
    						<input type="text" name="quantity" value="<%= c.getQuantity() %>" readonly>
    						<button type="button" class="qty-btn inc-btn" data-pid="<%= c.getId() %>">+</button>
						</div>
						
					</div>
					<div class="price-and-remove">
						<p class="item-total">Total: LKR <%= dcf.format(c.getPrice()* c.getQuantity()) %> </p>
						<button type="button" class="cancel-btn remove-btn" data-pid="<%= c.getId() %>">Remove</button>
					</div>
				</form>
				
            </div>
        	<%}
        }
        %>

            <div class="cart-footer">
                <h3>Grand Total: LKR <span id="grand-total">${ (total>0)?dcf.format(total):0 }</span></h3>
                <a href="CheckOutServlet" class="checkout-btn">Checkout</a>
            </div>
        </div>
    </div>

    <!-- js -->
    <script src="js/script.js"></script>
</body>
</html>