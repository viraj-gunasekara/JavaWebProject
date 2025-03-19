<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <!-- Dummy Item -->
            <div class="cart-item">
                <div class="item-details">
                    <img src="image/allprod_images/1-Yamaha F310 Acoustic Guitar.png" alt="Guitar" class="item-image">
                    <div class="item-info">
                        <h3>Yamaha Acoustic Guitar</h3>
                        <p>Category: String Instruments</p>
                        <p>Unit Price: LKR 45,500.00</p>
                    </div>
                </div>

                <div class="item-actions">
                    <div class="quantity-control">
                        <button class="qty-btn" onclick="decreaseQty(1)">-</button>
                        <input type="text" id="qty-1" value="1">
                        <button class="qty-btn" onclick="increaseQty(1)">+</button>
                    </div>
                    <p class="item-total">Total: LKR <span id="item-total-1">45,500.00</span></p>
                    <button class="cancel-btn" onclick="removeItem(1)">Remove</button>
                </div>
            </div>

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