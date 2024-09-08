<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<link rel="stylesheet" href="css/signupstyle.css">
			<link rel="stylesheet" href="css/fadetransition.css">
			<meta charset="UTF-8">
			<title>signup page</title>
		</head>

		<body>

			<div class="bg-container">
				<div class="login-container">
					<div class="image-container"></div>
					<div class="loginform-container">
						<div class="title-container">
							<label class="title" for="title">signup</label>
						</div>
						<div class="form-container">
							<form action=signup_Servlet method=post>

								<input type="text" class="firstname-container" required type="text" name="txtFirstname"
									placeholder="First name">
								<input type="text" class="lastname-container" required type="text" name="txtLastname"
									placeholder="Last name">
								<input class="username-container" required="required" type="text" name="txtUsername"
									placeholder="Username">
								<input type="text" class="contactno-container" required type="text" name="txtContactno"
									placeholder="Contact no.">

								<input type="text" class="email-container" required type="text" name="txtEmail"
									placeholder="Email">

								<input class="password-container" required="required" type="password" name="txtPassword"
									placeholder="Password">
								<br>
								<input class="confirmpassword-container" required type="password"
									name="txtConfirmPassword" placeholder="Confirm Password">
								<br> <input class="signup-btn" type="submit" value="Signup">
							</form>
							<a href="login.jsp" class="backtologin">Back to login.</a>
						</div>



						<!-- <button class="signup-btn" type="button" value="signup-btn">Sign
							Up</button> -->


						<!-- <button class="userinquiry-btn" type="button" value="userinquiry-btn">User Inquiry</button> -->
					</div>

				</div>
			</div>

		</body>

		</html>