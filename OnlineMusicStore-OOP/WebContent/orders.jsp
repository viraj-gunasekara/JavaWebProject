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
	List<Order> orders = null;
	
	if (auth != null) {
		request.setAttribute("auth", auth);
		orders = new OrderDao(DBConnectionPro.getCon()).userOrders(auth.getId());
	}

	ProductDao pd = new ProductDao(DBConnectionPro.getCon());

	List<Product> products = pd.getAllProducts();

	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DBConnectionPro.getCon());
		cartProduct = pDao.getCartProducts(cart_list);
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders: TonesAndTunes Music Store</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<!-- header start -->
	<header class="header"> <!-- header 1 -->
	<div class="header-1">
		<a href="index.jsp" class="logo"> <i class="fas fa-music">
				Tones & Tunes </i></a>

		<form action="" class="search-form">
			<input type="search" name="" placeholder="search here..."
				id="search-box"> <label for="search-box"
				class="fas fa-search"></label>
			<div id="search-results" class="search-dropdown"></div>
		</form>

		<!-- here in navbar set conditions, for visible to guest & reg-users -->
		<div class="icons">
			<div id="search-btn" class="fas fa-search">
				<span class="icon-name">Search</span>
			</div>
			<!-- <a href="#" class="fas fa-heart"><span class="icon-name">Favorite</span></a> -->
			<!-- cart badge added to show the item count in the cart -->
			<div class="cart-icon-wrapper">
				<a href="#" id="cart-btn" class="fas fa-shopping-cart"> <span
					class="cart-badge">${empty cart_list ? 0 : cart_list.size()}</span>
					<span class="icon-name">Cart</span>
				</a>
			</div>

			<!-- if a login session there, user can see these, -- else guest can see -->
			<%
				if (auth != null) {
			%>
			<a href="orders.jsp" id="order-btn" class="fas fa-file-text"><span
				class="icon-name">Orders</span></a>
			<!-- when user click logout btn, LogoutServlet works and remove user session -->
			<a href="LogoutServlet" id="logout-btn" class="fas fa-sign-out"><span
				class="icon-name">Logout</span></a>
			<%
				} else {
			%>
			<div id="login-btn" class="fas fa-user">
				<span class="icon-name">Login</span>
			</div>
			<%
				}
			%>

		</div>
	</div>
	<!-- header 1 end --> <!-- Cart Panel Placeholder -->
	<div id="cart-container"></div>

	<!-- header 2  -->
	<div class="header-2">
		<nav class="navbar"> <a href="index.jsp">home</a> <a
			href="allproducts.jsp">All Products</a>
		<div class="dropdown">
			<a href="#" class="dropbtn">Categories <i
				class="fas fa-chevron-down"></i></a>
			<div class="dropdown-content">
				<a href="allproducts.jsp?category=string-instruments"
					data-category="string-instruments"><i class="fas fa-guitar"></i>
					String Instruments<i class="side-arrow fas fa-chevron-right"></i></a> <a
					href="allproducts.jsp?category=drums-percussion"
					data-category="drums-percussion"><i class="fas fa-drum"></i>
					Drums & Percussion<i class="side-arrow fas fa-chevron-right"></i></a> <a
					href="allproducts.jsp?category=keyboard-piano"
					data-category="keyboard-piano"><i class="fas fa-keyboard"></i>
					Keyboards & Pianos<i class="side-arrow fas fa-chevron-right"></i></a> <a
					href="allproducts.jsp?category=home-audio"
					data-category="home-audio"><i class="fas fa-volume-up"></i>
					Home Audio<i class="side-arrow fas fa-chevron-right"></i></a> <a
					href="allproducts.jsp?category=studio-recording"
					data-category="studio-recording"><i class="fas fa-microphone"></i>
					Studio & Recording<i class="side-arrow fas fa-chevron-right"></i></a>
			</div>
		</div>
		<a href="#featured">featured</a> <a href="#new-arrivals">new
			arrivals</a> <a href="#reviews">reviews</a> </nav>
	</div>
	</header>
	<!-- header end -->

	<!-- small displays - bottom navbar -->
	<nav class="bottom-navbar"> <a href="#home" class="fas fa-home"></a>
	<a href="#featured" class="fas fa-list"></a> <a href="#new-arrivals"
		class="fas fa-tags"></a> <a href="#reviews" class="fas fa-comments"></a>
	</nav>
	<!-- small displays - bottom navbar end -->

	<!-- Login Placeholder -->
	<div id="login-container"></div>

	<!-- Reg Placeholder -->
	<div id="reg-container"></div>

	<!-- ForgetPw Placeholder -->
	<div id="forgetpw-container"></div>

	<!-- Orders page UI -->
	<section class="orders">
	<div class="heading">
		<span>All Orders</span>
	</div>

	<div class="orders-container">
		<table>
			<thead>
				<tr>
					<th>Date</th>
					<th>Name</th>
					<th>Category</th>
					<th>Quantity</th>
					<th class="order-price-column">Price</th>
					<th>Cancel</th>
				</tr>
			</thead>
			<tbody>
			<% 
			if(orders != null){
				for(Order o:orders){ %>
				<tr>
					<td><%= o.getDate() %></td>
					<td><%= o.getName() %></td>
					<td><%= o.getCategory() %></td>
					<td><%= o.getItemQuantity() %></td>
					<td class="order-price-column"><%= dcf.format(o.getPrice()) %></td>
					<td><a class="cancel-btn" href="CancelOrderServlet?oid=<%= o.getOrderId() %>">Cancel Order</a></td>
				</tr>
				<%}
			}
			%>				
			</tbody>
		</table>
	</div>
	</section>
	<!-- Orders page UI end -->

	<%@include file="includes/footer.jsp"%>
</body>
</html>