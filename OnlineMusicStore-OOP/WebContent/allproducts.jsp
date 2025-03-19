<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <div class="header-1">
            <a href="index.jsp" class="logo"> <i class="fas fa-music"> Tones & Tunes </i></a>

            <form action="" class="search-form">
                <input type="search" name="" placeholder="search here..." id="search-box">
                <label for="search-box" class="fas fa-search"></label>
                <div id="search-results" class="search-dropdown"></div>
            </form>

            <div class="icons">
                <div id="search-btn" class="fas fa-search"></div>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" id="cart-btn" class="fas fa-shopping-cart"></a>
                <div id="login-btn" class="fas fa-user"></div>
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
                <!-- string-instruments -->
                <!-- item 1 -->
                <div class="prod-box" data-category="string-instruments">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/1-Aria A-35CE Classical Guitar.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Aria A-35CE Classical Guitar</h3>
                        <p>string-instruments</p>
                        <div class="price">LKR 59,000.00 <br><span>LKR 61,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 2 -->
                <div class="prod-box" data-category="string-instruments">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/1-Epiphone Les Paul Special VE Electric Guitar.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Epiphone Les Electric Guitar</h3>
                        <p>string-instruments</p>
                        <div class="price">LKR 75,000.00 <br><span>LKR 81,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 3 -->
                <div class="prod-box" data-category="string-instruments">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/1-Fender FA-125CE Dreadnought Guitar.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Fender Dread nought Guitar</h3>
                        <p>string-instruments</p>
                        <div class="price">LKR 98,000.00 <br><span>LKR 100,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 4 -->
                <div class="prod-box" data-category="string-instruments">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/1-Ibanez GRX70QA Electric Guitar.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Ibanez GRX70QA Electric Guitar</h3>
                        <p>string-instruments</p>
                        <div class="price">LKR 82,000.00 <br><span>LKR 89,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 5 -->
                <div class="prod-box" data-category="string-instruments">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/1-Yamaha F310 Acoustic Guitar.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Yamaha F310 Acoustic Guitar</h3>
                        <p>string-instruments</p>
                        <div class="price">LKR 45,500.00 <br><span>LKR 55,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 6 -->
                <div class="prod-box" data-category="string-instruments">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/1-Yamaha V3 Series Student Violin.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Yamaha Student Violin</h3>
                        <p>string-instruments</p>
                        <div class="price">LKR 85,000.00 <br><span>LKR 89,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- drums-percussion -->
                <!-- item 1 -->
                <div class="prod-box" data-category="drums-percussion">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/2-Pearl Roadshow 5-Piece Drum Kit.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Pearl Roadshow Drum Kit</h3>
                        <p>drums-percussion</p>
                        <div class="price">LKR 235,000.00 <br><span>LKR 255,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 2 -->
                <div class="prod-box" data-category="drums-percussion">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/2-Roland SPD-SX Sampling Pad.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Roland Sampling Pad</h3>
                        <p>drums-percussion</p>
                        <div class="price">LKR 210,000.00 <br><span>LKR 215,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 3 -->
                <div class="prod-box" data-category="drums-percussion">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/2-Yamaha Stage Custom Birch Drum Set.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Yamaha Birch Drum Set</h3>
                        <p>drums-percussion</p>
                        <div class="price">LKR 295,000.00 <br><span>LKR 315,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 4 -->
                <div class="prod-box" data-category="drums-percussion">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/2-Alesis Nitro Mesh Electronic Drum Kit.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Alesis Electronic Drum Kit</h3>
                        <p>drums-percussion</p>
                        <div class="price">LKR 185,000.00 <br><span>LKR 215,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 5 -->
                <div class="prod-box" data-category="drums-percussion">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/2-Meinl HCS Cymbal Pack.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Meinl HCS X4 Cymbal Pack</h3>
                        <p>drums-percussion</p>
                        <div class="price">LKR 85,000.00 <br><span>LKR 105,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>

                <!-- keyboard-piano -->
                <!-- item 1 -->
                <div class="prod-box" data-category="keyboard-piano">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/3-Roland FP-30X Digital Piano.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Roland Digital Piano</h3>
                        <p>keyboard-piano</p>
                        <div class="price">LKR 245,000.00 <br><span>LKR 255,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 2 -->
                <div class="prod-box" data-category="keyboard-piano">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/3-Yamaha P-125 Digital Piano.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Yamaha P-125 Digital Piano</h3>
                        <p>keyboard-piano</p>
                        <div class="price">LKR 225,000.00 <br><span>LKR 255,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 3 -->
                <div class="prod-box" data-category="keyboard-piano">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/3-Korg PA-700 Professional Arranger.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Korg Professional Arranger</h3>
                        <p>keyboard-piano</p>
                        <div class="price">LKR 365,000.00 <br><span>LKR 395,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 4 -->
                <div class="prod-box" data-category="keyboard-piano">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/3-Casio CT-X5000 Portable Keyboard.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Casio Portable Keyboard</h3>
                        <p>keyboard-piano</p>
                        <div class="price">LKR 120,000.00 <br><span>LKR 150,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 5 -->
                <div class="prod-box" data-category="keyboard-piano">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/3-Alesis Recital Pro 88-Key Digital Piano.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Alesis Recital Digital Piano</h3>
                        <p>keyboard-piano</p>
                        <div class="price">LKR 190,000.00 <br><span>LKR 245,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>

                <!-- home-audio -->
                <!-- item 1 -->
                <div class="prod-box" data-category="home-audio">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/4-Bose SoundTouch 30 Wireless Speaker.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Bose Wireless Speaker</h3>
                        <p>home-audio</p>
                        <div class="price">LKR 175,000.00 <br><span>LKR 200,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 2 -->
                <div class="prod-box" data-category="home-audio">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/4-Harman Kardon Aura Studio 3 Bluetooth Speaker.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Harman Kardon Speaker</h3>
                        <p>home-audio</p>
                        <div class="price">LKR 125,000.00 <br><span>LKR 150,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 3 -->
                <div class="prod-box" data-category="home-audio">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/4-JBL Bar 9.1 True Wireless Surround Soundbar.png" alt="">
                    </div>
                    <div class="content">
                        <h3>JBL Surround Soundbar</h3>
                        <p>home-audio</p>
                        <div class="price">LKR 325,000.00 <br><span>LKR 355,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 4 -->
                <div class="prod-box" data-category="home-audio">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/4-Sony HT-S40R 5.1ch Home Theater System.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Sony Home Theater System</h3>
                        <p>home-audio</p>
                        <div class="price">LKR 215,000.00 <br><span>LKR 255,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>

                <!-- studio-recording -->
                <!-- item 1 -->
                <div class="prod-box" data-category="studio-recording">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/5-AKG C414 XLII Multi-Pattern Condenser Microphone.png" alt="">
                    </div>
                    <div class="content">
                        <h3>AKG Condenser Microphone</h3>
                        <p>studio-recording</p>
                        <div class="price">LKR 395,000.00 <br><span>LKR 415,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 2 -->
                <div class="prod-box" data-category="studio-recording">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/5-Focusrite Scarlett 2i2 (3rd Gen) USB Audio Interface.png"
                            alt="">
                    </div>
                    <div class="content">
                        <h3>Focusrite Audio Interface</h3>
                        <p>studio-recording</p>
                        <div class="price">LKR 79,000.00 <br><span>LKR 89,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 3 -->
                <div class="prod-box" data-category="studio-recording">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/5-Neumann TLM 103 Large-Diaphragm Condenser Microphone.png"
                            alt="">
                    </div>
                    <div class="content">
                        <h3>Neuman Condenser Mic</h3>
                        <p>studio-recording</p>
                        <div class="price">LKR 520,000.00 <br><span>LKR 540,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 4 -->
                <div class="prod-box" data-category="studio-recording">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/5-Rode NT1-A Condenser Microphone.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Rode Condenser Microphone</h3>
                        <p>studio-recording</p>
                        <div class="price">LKR 95,000.00 <br><span>LKR 100,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>
                <!-- item 5 -->
                <div class="prod-box" data-category="studio-recording">
                    <div class="icons">
                        <a href="#" class="fas fa-search"></a>
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="fas fa-eye"></a>
                    </div>
                    <div class="image">
                        <img src="image/allprod_images/5-Shure SM7B Dynamic Vocal Microphone.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Shure Vocal Microphone</h3>
                        <p>studio-recording</p>
                        <div class="price">LKR 185,000.00 <br><span>LKR 195,000.00</span></div>
                        <a href="#" class="btn">add to cart</a>
                    </div>
                </div>

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