<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionStaff}">
			<c:redirect url="/" />
		</c:if>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="./css/loader.css">
			<link rel="stylesheet" href="./css/staffpage.css">
			<title>staff page</title>
		</head>

		<body>
			<div class="container">
				<div class="cover">
					<div class="rightnav">
						<div class="tp-rnav">
							<div class="dash"><b>DASHBOARD</b></div>

							<div class="card-container">
								<div class="card"></div>
								<div class="card"></div>
								<div class="card"></div>
								<div class="card"></div>
							</div>
						</div>

						<div class="b-container"></div>
					</div>
					<div class="leftnav">
						<div class="top-lnav"><b>Cebu Eastern College</b>
							<img src="./images/logo.png" class="cec">
						</div>
						<!-- staff profile -->
						<button class="button-profile"><img src="./images/profile.png" alt=""
								class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt=""
								class="caretdown"></button>
						<div class="staffProfile" id="staffProfile">
							<a href="#">Settings</a>
							<a href="login">Signout</a>
						</div>
						<div class="bottom-lnav">
							<div class="dropdown">
								<h3>QUEUEING</h3>
								<div class="dropdown-content">
									<a href="staff/user_window.jsp">User Window</a>
									<a href="staff/counter_window.jsp">Counter Window</a>
								</div>
							</div>
							<div class="dropdown">
								<h3>ENTERTAINMENT</h3>
								<div class="dropdown-content">
									<a href="staff/entertainment.jsp">Advertisement</a>
									<a href="staff/entertainment.jsp" class="video-link">Add Video</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				document.addEventListener("DOMContentLoaded", function () {
					var dropdownButton = document.querySelector(".button-profile");
					var staffProfile = document.getElementById("staffProfile");

					staffProfile.style.display = "none";

					dropdownButton.addEventListener("click", function () {
						if (staffProfile.style.display === "block") {
							staffProfile.style.display = "none";
						} else {
							staffProfile.style.display = "block";
						}
					});
				});
			</script>






			<!-- <h1>
				Welcome staff
				<c:out value="${sessionStaff.getUsername()}"></c:out>
			</h1> -->

			<!-- <form action=login method=get>
				<input type="submit" value="logout">
			</form> -->

			<div class="load-wrapper">
				<div class="main-loader">
					<div class="box-loader">
					</div>
				</div>
			</div>
		</body>

		</html>