<!DOCTYPE html>
		<html>

		<head>
			<link rel="stylesheet" href="signupstyle.css">
			<meta charset="UTF-8">
			<title>login page</title>
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
							<form action=login_Servlet method=post>
								    <input class="username-container"
									required="required" type="text" name="txtUsername" placeholder="Username"><br> 
                                    <input type="button" class="firstname-container" required type="text" name="txtFirstname" placeholder="Firstname"> 
                                    
                                    <input type="button" class="lastname-container" required type="text" name="txtLastname" placeholder="Lastname">
                                    
                                    <input type="button" class="contactno-container" required type="text" name="txtContactno" placeholder="Contact no.">
                                    
                                    <input type="button" class="email-container" required type="text" name="txtEmail" placeholder="Email">   
                                    
								 <input class="password-container" required="required" type="password"
									name="txtPassword" placeholder="Password">
                                <br> 
                                <input class="confirmpassword-container" required type="password" name="txtConfirmPassword" placeholder="Confirm Password">
								<br> <input class="login-btn" type="submit" value="Login">
							</form>
						</div>

						<a href="signup.jsp" class="signup-btn" type="button" value="signup-btn">Sign Up</a>
						<!-- <button class="signup-btn" type="button" value="signup-btn">Sign
							Up</button> -->
						

						<!-- <button class="userinquiry-btn" type="button" value="userinquiry-btn">User Inquiry</button> -->
					</div>

				</div>
			</div>


		</body>

		</html>