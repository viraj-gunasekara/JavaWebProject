<%@page import="com.it21320378.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!-- get user session, from "auth" attribute -->
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth!=null){
		request.setAttribute("auth", auth);
	}
	
	ProductDao pd = new ProductDao(DBConnectionPro.getCon());
	
	List<Product> products = pd.getAllProducts();
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AllProducts: TonesAndTunes</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<!-- header start -->
    <header class="header">
        <!-- header 1 -->
        <div class="header-1">
            <a href="index.jsp" class="logo"> <i class="fas fa-music"> Tones & Tunes </i></a>

            <form action="" class="search-form">
                <input type="search" name="" placeholder="search here..." id="search-box">
                <label for="search-box" class="fas fa-search"></label>
                <div id="search-results" class="search-dropdown"></div>
            </form>

			<!-- here in navbar set conditions, for visible to guest & reg-users -->
            <div class="icons">
                <div id="search-btn" class="fas fa-search"><span class="icon-name">Search</span></div>
                <!-- <a href="#" class="fas fa-heart"><span class="icon-name">Favorite</span></a> -->
                <!-- cart is visible to all users -->
                <a href="#" id="cart-btn" class="fas fa-shopping-cart"><span class="icon-name">Cart</span></a>
                
                <!-- if a login session there, user can see these, -- else guest can see -->
                <% if(auth != null){ %>
                	<a href="orders.jsp" id="order-btn" class="fas fa-file-text"><span class="icon-name">Orders</span></a>
                	<!-- when user click logout btn, LogoutServlet works and remove user session -->
                    <a href="LogoutServlet" id="logout-btn" class="fas fa-sign-out"><span class="icon-name">Logout</span></a>
                <% } else{ %>
                	<div id="login-btn" class="fas fa-user"><span class="icon-name">Login</span></div>
                <% }
                	%>
                
            </div>
        </div>
		<!-- header 1 end -->

        <!-- Cart Panel Placeholder -->
        <div id="cart-container"></div>

        <!-- header 2  -->
        <div class="header-2">
            <nav class="navbar">
                <a href="index.jsp">home</a>
                <a href="allproducts.jsp">All Products</a>
                <div class="dropdown">
                    <a href="#" class="dropbtn">Categories <i class="fas fa-chevron-down"></i></a>
                    <div class="dropdown-content">
                        <a href="allproducts.jsp?category=string-instruments" data-category="string-instruments"><i
                                class="fas fa-guitar"></i> String Instruments<i
                                class="side-arrow fas fa-chevron-right"></i></a>
                        <a href="allproducts.jsp?category=drums-percussion" data-category="drums-percussion"><i
                                class="fas fa-drum"></i> Drums & Percussion<i
                                class="side-arrow fas fa-chevron-right"></i></a>
                        <a href="allproducts.jsp?category=keyboard-piano" data-category="keyboard-piano"><i
                                class="fas fa-keyboard"></i> Keyboards & Pianos<i
                                class="side-arrow fas fa-chevron-right"></i></a>
                        <a href="allproducts.jsp?category=home-audio" data-category="home-audio"><i
                                class="fas fa-volume-up"></i> Home Audio<i
                                class="side-arrow fas fa-chevron-right"></i></a>
                        <a href="allproducts.jsp?category=studio-recording" data-category="studio-recording"><i
                                class="fas fa-microphone"></i> Studio & Recording<i
                                class="side-arrow fas fa-chevron-right"></i></a>
                    </div>
                </div>
                <a href="#featured">featured</a>
                <a href="#new-arrivals">new arrivals</a>
                <a href="#reviews">reviews</a>
            </nav>
        </div>
    </header>
    <!-- header end -->

    <!-- small displays - bottom navbar -->
    <nav class="bottom-navbar">
        <a href="#home" class="fas fa-home"></a>
        <a href="#featured" class="fas fa-list"></a>
        <a href="#new-arrivals" class="fas fa-tags"></a>
        <a href="#reviews" class="fas fa-comments"></a>
    </nav>
    <!-- small displays - bottom navbar end -->

    <!-- Login Placeholder -->
    <div id="login-container"></div>
    
    <!-- Reg Placeholder -->
    <div id="reg-container"></div>

    <!-- ForgetPw Placeholder -->
    <div id="forgetpw-container"></div>
    
    <!-- categories -->
    <section class="categories">
        <div class="category active-category" data-category="all">
            <div class="circle"></div>
            <img src="image/category_images/all.png" alt="All Products" class="category-img">
            <p>ALL PRODUCTS</p>
        </div>
        <div class="category" data-category="string-instruments">
            <div class="circle"></div>
            <img src="image/category_images/string.png" alt="String Instruments" class="category-img">
            <p>STRING INSTRUMENTS</p>
        </div>
        <div class="category" data-category="drums-percussion">
            <div class="circle"></div>
            <img src="image/category_images/drum.png" alt="Drums & Percussion" class="category-img">
            <p>DRUMS AND PERCUSSION</p>
        </div>
        <div class="category" data-category="keyboard-piano">
            <div class="circle"></div>
            <img src="image/category_images/keyboard.png" alt="Keyboards & Pianos" class="category-img">
            <p>KEYBOARDS AND PIANOS</p>
        </div>
        <div class="category" data-category="home-audio">
            <div class="circle"></div>
            <img src="image/category_images/home.png" alt="Home Audio" class="category-img">
            <p>HOME AUDIO</p>
        </div>
        <div class="category" data-category="studio-recording">
            <div class="circle"></div>
            <img src="image/category_images/studio.png" alt="Studio & Recording" class="category-img">
            <p>STUDIO AND RECORDING</p>
        </div>
    </section>
    <!-- categories end -->
    
    <!-- all products -->
    <section class="all-prod" id="all-prod">
        <h1 class="heading"> <span>all products</span></h1>

        <div class="all-prod-slider">
            <div class="wrapper">
            
        <%
    	if( !products.isEmpty()){
    		for(Product p:products){%>
    			<div class="prod-box" data-category="<%= p.getCategory() %>">
                <div class="icons">
                    <a href="#" class="fas fa-search"></a>
                    <a href="#" class="fas fa-heart"></a>
                    <a href="#" class="fas fa-eye"></a>
                </div>
                <div class="image">
                    <img src="image/allprod_images/<%= p.getImage() %>" alt="">
                </div>
                <div class="content">
                <div class="details">
                    <h3><%= p.getName() %></h3>
                    <p><%= p.getCategory() %></p>
                    <div class="price">LKR <%= (int)(p.getPrice()) %>.00 <br><span>LKR <%= (int)(p.getPrice()*1.1) %>.00</span></div>
                 </div>
                 <a href="#" class="btn">add to cart</a>
                </div>
            </div>
    		<%}
    	}
    	%>

            </div>
        </div>
    </section>
    <!-- all products end -->
    
    <!-- pagination -->
    <div class="pagination">
        <button id="prev-page" disabled>&laquo; Prev</button>
        <span id="page-numbers"></span>
        <button id="next-page">&raquo; Next</button>
    </div>
    <!-- pagination end -->
    


	<!-- footer section -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>