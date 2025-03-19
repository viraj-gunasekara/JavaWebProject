<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TonesAndTunes Music Store</title>
<%@include file="includes/header.jsp"%>
</head>
<body>

	<!-- header start -->
	<header class="header">
	<div class="header-1">
		<a href="index.html" class="logo"> <i class="fas fa-music">
				Tones & Tunes </i></a>

		<form action="" class="search-form">
			<input type="search" name="" placeholder="search here..."
				id="search-box"> <label for="search-box"
				class="fas fa-search"></label>
			<div id="search-results" class="search-dropdown"></div>
		</form>

		<div class="icons">
			<div id="search-btn" class="fas fa-search"></div>
			<a href="#" class="fas fa-heart"></a> <a href="#" id="cart-btn"
				class="fas fa-shopping-cart"></a>
			<div id="login-btn" class="fas fa-user"></div>
		</div>
	</div>

	<!-- Cart Panel Placeholder -->
	<div id="cart-container"></div>

	<!-- header 2  -->
	<div class="header-2">
		<nav class="navbar"> <a href="#home">home</a> <a
			href="allproducts.html">All Products</a>
		<div class="dropdown">
			<a href="#" class="dropbtn">Categories <i
				class="fas fa-chevron-down"></i></a>
			<div class="dropdown-content">
				<a href="allproducts.html?category=string-instruments"
					data-category="string-instruments"><i class="fas fa-guitar"></i>
					String Instruments<i class="side-arrow fas fa-chevron-right"></i></a> <a
					href="allproducts.html?category=drums-percussion"
					data-category="drums-percussion"><i class="fas fa-drum"></i>
					Drums & Percussion<i class="side-arrow fas fa-chevron-right"></i></a> <a
					href="allproducts.html?category=keyboard-piano"
					data-category="keyboard-piano"><i class="fas fa-keyboard"></i>
					Keyboards & Pianos<i class="side-arrow fas fa-chevron-right"></i></a> <a
					href="allproducts.html?category=home-audio"
					data-category="home-audio"><i class="fas fa-volume-up"></i>
					Home Audio<i class="side-arrow fas fa-chevron-right"></i></a> <a
					href="allproducts.html?category=studio-recording"
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





	<%@include file="includes/footer.jsp"%>
</body>
</html>