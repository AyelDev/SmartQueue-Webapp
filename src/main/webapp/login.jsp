<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" type="text/css" href="css/jquery-confirm.min.css" />
			<link rel="stylesheet" href="css/loginstyle.css">
			<link rel="stylesheet" href="css/loader.css">
			<script type="text/javascript" src="scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="scripts/fadetransition.js"></script>
			<script type="text/javascript" src="scripts/jquery-confirm.min.js"></script>
			<link rel="icon" type="image/x-icon" href="./images/logo.png">
			<title>Login</title>
		</head>

		<body>

			<div class="container-fluid">
				<div class="login-container">
					<img src="./images/cecbldg.png" class="cecbldg" alt="">
					<img src="./images/logo.png" class="logo" alt="">
					<img src="./images/clouds.png" class="clouds" alt="">
					<h1 class="school-name">Cebu Eastern College</h1>
					<p class="system-title">Smart Queue System</p>
					<div class="loginform-container">

						<div class="title-container">
							<label class="title" for="title">login</label>
						</div>
						<div class="form-container">
							<form action=dashboard method=post>
								<div class="username-container">
									<input class="username-input" required="required" type="text" name="txtUsername">
									<label for="username" class="username-label">Username</label>
								</div>

								<br>
								<div class="password-container">
									<input class="password-input" required="required" type="password"
										name="txtPassword">
									<label for="password" class="password-label">Password</label>
								</div>

								<p class="error-message">
									<c:out value="${errorLogin}"></c:out>
								</p>
								<br> <a id="forgotpass" class="forgotpass">Request a new password.</a>
								<br> <input id="login-button" class="login-btn" type="submit" value="Log in">
							</form>

						</div>

						<!-- <button class="signup-btn" type="button" value="signup-btn" onclick="document.location='signup.jsp'">Sign
							Up</button> -->
						<!-- <hr class="hr-left">
						<p>or</p>
						<hr class="hr-right">
						
						<button class="userinquiry-btn" type="button" value="userinquiry-btn" onclick="document.location='user/userinquiry.jsp'">User Inquiry</button> -->

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

			<script type="text/javascript" src="scripts/login.js"></script>
		</body>

		</html>