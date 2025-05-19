<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<!-- css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!-- reg form -->
	<div class="reg-form-container">

		<div id="close-reg-btn" class="fas fa-times"></div>

		<form action="RegisterServlet" method="post">
			<h3>sign up</h3>
			<div class="name-fields">
				<div class="field">
					<span>First name</span> <input type="text" name="fname" class="box"
						placeholder="your first name" id="" required>
				</div>
				<div class="field">
					<span>Last name</span> <input type="text" name="lname" class="box"
						placeholder="your last name" id="">
				</div>
			</div>
			<span>Email</span> <input type="email" name="email" class="box"
				placeholder="enter your email" id="" required> <span>Phone
				number</span> <input type="number" name="pnum" class="box"
				placeholder="enter your phone number" id=""> <span>Password</span>
			<input type="password" name="" class="box"
				placeholder="enter your password" id="" required> <span>Confirm
				password</span> <input type="password" name="password" class="box"
				placeholder="re-enter your password" id="" required>

			<div class="checkbox">
				<input type="checkbox" name="" id="music-box"> <label
					for="music-box">
					<p>
						I agree to the <a href="#">Terms & Conditions. </a>
					</p>
				</label>
			</div>

			<input type="submit" value="sign up" class="btn">

			<p>
				already have an account ? <a href="#" id="login-btn2">log in</a>
			</p>
		</form>
	</div>
</body>
</html>