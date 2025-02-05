<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" href="./css/bootstrap.css">
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

			<script>
				const forgotPasswordButton = document.getElementById("forgotpass");
				const loginButton = document.getElementById("login-button");
				forgotPasswordButton.addEventListener("click", event => {
					$.confirm({
						type: 'blue',
						theme: 'material',
						boxWidth: '30%',
						useBootstrap: false,
						title: 'Request Reset Password',
						content: 
						`
							 <form action="" class="formName">
							 <div class="form-group">
							 <br>
							 <label>Enter Email</label>
							 <input type="text" placeholder="Your email" class="email form-control" required />
							 </div>
							 </form>
						`,
						// content: '' +
						// 	'<form action="" class="formName">' +
						// 	'<div class="form-group">' +
						// 	'<label>Enter Username</label>' +
						// 	'<input type="text" placeholder="Your name" class="username form-control" required />' +
						// 	'<br>' +
						// 	'<label>Enter Email</label>' +
						// 	'<input type="text" placeholder="Your email" class="email form-control" required />' +
						// 	'</div>' +
						// 	'</form>',

						buttons: {
							formSubmit: {
								text: 'Submit',
								btnClass: 'btn-blue',
								action: function () {
									var username = this.$content.find('.username').val();
									var email = this.$content.find('.email').val();
									if (!username || !email) {
										$.alert({
											title: 'Error!',
											type: 'red',
											content: 'Please fill up the necessary form',
											boxWidth: '20%',
											useBootstrap: false,
										});
										return false;
									} else {
										$.confirm({
											title: 'System Responded',
											type: 'blue',
											theme: 'material',
											boxWidth: '30%',
											useBootstrap: false,
											content: function () {
												var self = this;
												return $.ajax({
													url: '/StaffRequestPasswordAPI',
													method: 'post',
													data: {
														username: username,
														email: email
													}
												}).done(function (response) {
													self.setTitle(response.name);
													self.setContentAppend('<br>' + response + '<br><br>You will receive an email once your request has been approved');

												}).fail(function (jqXHR, error) {
													self.setContentAppend('<br>' + jqXHR.responseText);
												});
											}
										});

									}
								}
							},
							cancel: function () {
								//close
							},
						},
						onContentReady: function () {
							// bind to events
							var jc = this;
							this.$content.find('form').on('submit', function (e) {
								// if the user submits the form by pressing enter in the field.
								e.preventDefault();
								jc.$$formSubmit.trigger('click'); // reference the button and click it
							});
						}
					});
				});

				loginButton.addEventListener("click", function () {
					$(".load-wrapper").fadeIn("slow");
				});
			</script>
		</body>

		</html>