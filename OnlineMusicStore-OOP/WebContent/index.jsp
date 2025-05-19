<%@page import="com.it21320378.DBConnectionPro"%>
<%@page import="com.it21320378.*"%>
<%@page import="java.util.*"%>
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
<title>TonesAndTunes Music Store</title>
<%@include file="includes/header.jsp"%>
</head>

<body>
	<!-- see the db connection is established or not -->
	<%-- <% out.print(DBConnectionPro.getCon()); %> --%>
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
                <!-- cart badge added to show the item count in the cart -->
                <div class="cart-icon-wrapper">
                	<a href="#" id="cart-btn" class="fas fa-shopping-cart">
                	<span class="cart-badge">${empty cart_list ? 0 : cart_list.size()}</span>
                	<span class="icon-name">Cart</span>
                	</a>
                </div>

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
		
		<!-- Alert modal Container -->
		<div id="alert-modal" class="alert-modal">
			<div class="alert-modal-content">
				<span id="close-alert" class="close-btn">&times;</span>
				<p id="alert-message">Default alert text.</p>
			</div>
		</div>
		
        <!-- Cart Panel Placeholder -->
        <div id="cart-container"></div>

		<!-- header 2  -->
        <div class="header-2">
            <nav class="navbar">
                <a href="#home">home</a>
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
                
                <!-- if a login session there, user can see user-profile, guest can not see -->
                <% if(auth != null){ %>
                	<a href="" id="user-btn" class="fas fa-user"><span class="user-profile-btn">User Profile</span></a>
                <% } 
                	%>
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

    <!-- home section -->
    <section class="home" id="home">
        <div class="row">

            <div class="content">
                <h3>Bring Music To Life</h3>
                <p class="highlight"> We Have
                    <span class="highlight1">Everything</span><br>
                    Any Musician <span class="highlight2"><br>Need.</span>
                </p>
                <p class="pro">From Starters To Pro...</p>
                <a href="allproducts.jsp" class="btn">shop now</a>
            </div>

            <div class="swiper music-slider">
                <div class="swiper-wrapper">
                    <a href="#" class="swiper-slide glass-container"><img src="image/music-1.png" alt=""></a>
                    <a href="#" class="swiper-slide glass-container"><img src="image/music-2.png" alt=""></a>
                    <a href="#" class="swiper-slide glass-container"><img src="image/music-3.png" alt=""></a>
                    <a href="#" class="swiper-slide glass-container"><img src="image/music-4.png" alt=""></a>
                    <a href="#" class="swiper-slide glass-container"><img src="image/music-5.png" alt=""></a>
                    <a href="#" class="swiper-slide glass-container"><img src="image/music-6.png" alt=""></a>
                </div>
            </div>
        </div>

    </section>
    <!-- home section end -->

    <!-- icons section -->
    <section class="icons-container">
        <div class="icons">
            <i class="fas fa-truck"></i>
            <div class="content">
                <h3>free delivery</h3>
                <p>order over LKR 100</p>
            </div>
        </div>

        <div class="icons">
            <i class="fas fa-lock"></i>
            <div class="content">
                <h3>secure payment</h3>
                <p>100+ payments proceed</p>
            </div>
        </div>

        <div class="icons">
            <i class="fas fa-redo-alt"></i>
            <div class="content">
                <h3>easy returns</h3>
                <p>7 days returns</p>
            </div>
        </div>

        <div class="icons">
            <i class="fas fa-headset"></i>
            <div class="content">
                <h3>24/7 support</h3>
                <p>call us anytime</p>
            </div>
        </div>

        <div class="icons">
            <i class="fas fa-certificate"></i>
            <div class="content">
                <h3>warranty</h3>
                <p>365 Days</p>
            </div>
        </div>
    </section>
    <!-- icons section end -->

    <!-- featured section -->
    <section class="featured" id="featured">
        <h1 class="heading"> <span>featured instruments </span></h1>

        <div class="swiper featured-slider">
            <div class="swiper-wrapper">
            
            <%
    	if( !products.isEmpty()){
    		for(Product p:products){%>
    			<div class="box swiper-slide" data-category="<%= p.getCategory() %>">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/<%= p.getImage() %>" alt="">
                    </div>
                    <div class="content">
                        <h3><%= p.getName() %></h3>
                        <p><%= p.getCategory() %></p>
                        <div class="price">LKR <%= (int)(p.getPrice()) %>.00 <br><span>LKR <%= (int)(p.getPrice()*1.1) %>.00</span></div>
                        <!-- when click Addtocart btn, AddToCartServlet works and create item session -->
                        <a href="AddToCartServlet?pid=<%= p.getId() %>" class="btn">add to cart</a>
                    </div>
                </div>
    		<%}
    	}
    	%>

            </div>

            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </section>
    <!-- featured section end-->

    <!-- new arrivals section -->
    <section class="arrivals" id="new-arrivals">
        <h1 class="heading"><span>new arrivals</span></h1>

        <!-- slider 1 -->
        <div class="swiper arrivals-slider">
            <div class="swiper-wrapper">
                <!-- item 1 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-1.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 118,999.00 <span>LKR 120,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 2 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-2.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 140,999.00 <span>LKR 150,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 3 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-3.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 120,999.00 <span>LKR 135,999.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 4 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-4.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 98,999.00 <span>LKR 99,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 5 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-5.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 48,999.00 <span>LKR 50,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 6 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-6.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 89,999.00 <span>LKR 100,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <!-- slider 2 -->
        <div class="swiper arrivals-slider">
            <div class="swiper-wrapper">
                <!-- item 1 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-6.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 235,000.00 <span>LKR 245,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 2 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-5.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 180,000.00 <span>LKR 190,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 3 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-4.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 213,000.00 <span>LKR 220,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 4 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-3.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 115,000.00 <span>LKR 120,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 5 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-2.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 155,000.00 <span>LKR 160,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>

                <!-- item 6 -->
                <a href="#" class="swiper-slide box">
                    <div class="image">
                        <img src="image/music-1.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">LKR 220,000.00 <span>LKR 225,000.00</span></div>
                        <div class="starts">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>
            </div>
        </div>

    </section>
    <!-- new arrivals section end -->

    <!-- middle image section -->
    <section class="middle-image">

    </section>
    <!-- middle image section end -->

    <!-- reviews section -->
    <section class="reviews" id="reviews">
        <h1 class="heading"><span>buyer's reviews</span></h1>
        <div class="swiper reviews-slider">
            <div class="swiper-wrapper">
                <!-- person 1 -->
                <div class="swiper-slide box">
                    <img src="image/person-1.png" alt="">
                    <h3>Isuni Devindi</h3>
                    <p>Good site to select from a variety of electrical music items. Prices are reasonable.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>

                <!-- person 2 -->
                <div class="swiper-slide box">
                    <img src="image/person-2.png" alt="">
                    <h3>Nuwan Chamara</h3>
                    <p>Site is super friendly. There had brief introduction of how to and what to choose.
                        Thanks for the service and I recommend.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                </div>

                <!-- person 3 -->
                <div class="swiper-slide box">
                    <img src="image/person-3.png" alt="">
                    <h3>Ridmi Kawya</h3>
                    <p>Great site to buy musical instruments, But delivery price is bit overpriced</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>

                <!-- person 4 -->
                <div class="swiper-slide box">
                    <img src="image/person-4.png" alt="">
                    <h3>Nayomi Ranweera</h3>
                    <p>They got vast selection of guitars for rent and sell: classic, acoustic, semi acoustic and
                        electric.
                        Bass guitar, Sri Lanka drums, cellos, violin and more.
                        Worth checking!</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>

                <!-- person 5 -->
                <div class="swiper-slide box">
                    <img src="image/person-5.png" alt="">
                    <h3>Hirun Prabashwara</h3>
                    <p>This is your only option for getting an electric or acoustic guitar, strings, Cajon, even
                        amplifiers.
                        Site is always super helpful, and has fair prices.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- reviews section end -->

	<!-- footer section -->
	<%@include file="includes/footer.jsp"%>
	
	<script>
  		const isLoggedIn = <%= (auth != null) ? "true" : "false" %>;
	</script>
</body>
</html>