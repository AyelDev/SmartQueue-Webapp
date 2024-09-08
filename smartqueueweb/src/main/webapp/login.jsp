<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<script type="text/javascript" src="scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="css/loginstyle.css">
			<link rel="stylesheet" href="css/loader.css">
			<title>login page</title>
		</head>

		<body>

			<div class="bg-container">
				<div class="login-container">
					<div class="image-container"></div>
					<div class="loginform-container">
						<div class="title-container">
							<label class="title" for="title">login</label>
						</div>
						<div class="form-container">
							<form action=dashboard method=post>
								<label class="username">Username</label> <br> <input class="username-container"
									required="required" type="text" name="txtUsername"><br> <label
									class="password">Password</label>
								<br> <input class="password-container" required="required" type="password"
									name="txtPassword">
								<p class="error-message">error message<c:out value="${errorLogin}"></c:out>
								</p>
								<br> <a href="forgotpass" class="forgotpass">Forgot password?</a>
								<br> <input class="login-btn" type="submit" value="Login">
							</form>
						</div>
						
						<button class="signup-btn" type="button" value="signup-btn" onclick="document.location='signup.jsp'">Sign
							Up</button>
						<hr class="hr-left">
						<p>or</p>
						<hr class="hr-right">
						
						<button class="userinquiry-btn" type="button" value="userinquiry-btn" onclick="document.location='user/userinquiry.jsp'">User Inquiry</button>

						<!-- <button class="userinquiry-btn" type="button" value="userinquiry-btn">User Inquiry</button> -->
					</div>

				</div>
			</div>



			<!-- loader please do not remove -->
			<div class="load-wrapper">
				<div class="main-loader">
					<div class="box-loader">
					</div>
				</div>
			</div>



		</body>

		</html>