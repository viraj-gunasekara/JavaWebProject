<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<!-- css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!-- login form -->
	<div class="login-form-container">

		<div id="close-login-btn" class="fas fa-times"></div>

		<!-- When user submit the form it will goes to Login servlet -->
		<form action="LoginServlet" method="post">
			<h3>sign in</h3>
			<span>email</span> <input type="email" name="login-email" class="box"
				placeholder="enter your email" id="" required> 
			<span>password</span>
			<input type="password" name="login-password" class="box"
				placeholder="enter your password" id="" required>
			<div class="checkbox">
				<input type="checkbox" name="" id="remember-me"> <label
					for="remember-me">remember me</label>
			</div>
			<input type="submit" value="sign in" class="btn">
			<p>
				forget password ? <a href="#" id="forgetpw-btn">click here</a>
			</p>
			<p>
				don't have an account ? <a href="#" id="reg-btn">create one</a>
			</p>
		</form>
	</div>
</body>
</html>