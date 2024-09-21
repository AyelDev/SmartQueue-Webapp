<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionAdmin.getUsername()}">
			<c:redirect url="/" />
		</c:if>

		<!DOCTYPE html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="./css/loader.css">
			<title>Admin | Dashboard</title>
		</head>
		<style>
			@import url('./admin/fonts.css');

			:root {
				--primary-color: #1e91d0;
				--secondary-color: #00509d;
				--body-fonts: "Roboto Condensed", sans-serif;
				--background-color: #F6F4EB;
				--select-text-color: #B4B4B8;
				--text-color: #272829;
				font-optical-sizing: auto;
				font-style: normal;
			}

			* {
				font-family: var(--body-fonts);
				padding: 0;
				margin: 0;
			}

			body {
				width: 100%;
				height: 100%;
				font-family: var(--body-fonts);
				margin: 0;
				padding: 0;
				font-optical-sizing: auto;
				font-style: normal;
			}

			.container {
				width: 100%;
				height: 100%;
				background-color: white;
				display: grid;
				grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
				align-items: center;
				justify-content: center;

			}



			.navbar {
				width: 15vw;
				height: 100vh;
				background-color: var(--primary-color);
				position: fixed;
				justify-content: center;
				align-items: center;
				left: 0;
				float: left;
			}

			.logoContainer {
				width: 100%;
				text-align: center;
			}

			.logo {
				width: 50%;
				max-width: 100%;
				object-fit: contain;
				margin-top: 15px;
			}

			.title {
				color: var(--background-color);
				font-size: 0.8em;
			}

			.adminProfile {
				margin-left: 2.5rem;
				position: absolute;
				background-color: var(--background-color);
				width: 9.5vw;
				align-items: center;
				justify-content: center;
				text-align: center;
				z-index: 1;
				display: none;
				border-radius: 7px;
			}

			.adminProfile a,
			.dropdown-dashboard a {
				text-decoration: none;
				color: var(--background-color);
				overflow: hidden;
				color: black;
				width: 9.5vw;
				height: 20%;
				text-align: center;
				align-items: center;
				display: flex;
				flex-direction: column;
				justify-content: center;
				padding: .5rem 0 0 0;
				height: 2rem;
			}

			.adminProfile a:hover {
				background-color: var(--select-text-color);
				border-radius: 7px;
			}

			.button-profile {
				align-items: center;
				justify-content: center;
				display: flex;
				width: 10vw;
				margin-top: 30px;
				margin-left: 36px;
				border-radius: 10px;
				padding: 15px 10px 15px 10px;
				/*tlbr*/
				overflow: hidden;
				cursor: pointer;
				border: none;
			}

			.profile {
				width: 10%;
				object-fit: scale-down;
				margin-right: 20px;
			}


			.caretdown {
				mix-blend-mode: multiply;
				width: 10px;
				margin-left: 20px;
			}

			/* navbar */
			.menu-navbar {
				margin-top: 2rem;
				display: flex;
				flex-direction: column;
			}

			.dropdown {
				position: relative;
				display: inline-block;
			}

			.dropdown-dashboard {
				display: none;
				position: absolute;
				background-color: var(--background-color);
				width: 120px;
				top: 100%;
				left: 70%;
				z-index: 1;
				box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
				border-radius: 4px;
			}

			.dropdown-dashboard a {
				display: flex;
				text-decoration: none;
				color: var(--text-color);
				text-align: center;
				align-items: center;
				justify-content: center;
				font-size: 11px;
			}

			.dropdown-dashboard a:hover {
				background-color: var(--select-text-color);
				border-radius: 4px;
				padding: 3px;
				margin-top: -7%;
				width: 115px;
			}

			.dropdown-btn {
				background: none;
				padding: 20px;
				display: flex;
				align-items: center;
				width: 20vw;
				border: 0;
				font-size: 15px;
				color: #F6F4EB;
				border-radius: 15px;
				padding-right: 60px;
				margin-left: 10px;
				cursor: pointer;
				position: relative;
			}

			.dropdown:hover .dropdown-dashboard {
				display: block;
			}

			.dropdown-btn:hover {
				background-color: var(--background-color);
				width: 18vw;
				color: var(--text-color);
				font-weight: bold;
			}

			.dropdown-btn:hover+.dropdown-dashboard {
				display: block;
			}

			.dashboard-icon,
			.users-icon,
			.display-icon,
			.entertainment-icon,
			.counter-icon {
				object-fit: scale-down;
				width: 10%;
			}

			.dashboard-icon,
			.users-icon,
			.display-icon,
			.entertainment-icon,
			.counter-icon {
				margin-right: 17px;
			}

			.dashboard-caretright {
				margin-left: 50px;
			}

			.caretright {
				object-fit: scale-down;
				width: 5%;
				right: 5.5rem;
				position: absolute;
			}

			.dashboard-section {
				width: 85vw;
				height: 100vh;
				background-color: var(--background-color);
				float: right;
				margin-left: 15%;
				align-items: center;
				display: flex;
				justify-content: center;
			}

			.dashboard-section h1 {
				color: black;
				font-size: 2rem;
				margin-top: -40%;
				margin-left: -60%;
				position: absolute;
			}

			.card-total p {
				font-size: .7rem;
			}

			.card-total p h3 {
				margin: 10px;
			}

			.dashboard-content {
				width: 75vw;
				height: 80vh;
				justify-content: space-evenly;
				display: flex;
			}

			.card-total {
				width: 20%;
				height: 20%;
				background-image: linear-gradient(to right, #1e91d0, #00509d);
				border-radius: 15px;
				justify-content: space-evenly;
				margin-top: 2rem;
			}

			.department-graph {
				width: 30%;
				height: 60%;
				background-color: #ffff;
				border-radius: 15px;
				margin-top: 2rem;
			}

			.total-graph {
				width: 48%;
				height: 30%;
				margin-top: 11%;
				margin-left: -24%;
				background-color: #ffff;
				position: fixed;
				border-radius: 15px;
			}
		</style>

		<body>
			<div class="container">
				<div class="navbar">
					<div class="logoContainer">
						<img src="./images/logo.png" alt="" class="logo">
						<p class="title">Cebu Eastern College
						<p>
					</div>
					<!-- admin profile -->
					<button class="button-profile" id="button-profile"><img src="./images/profile.png"
							alt="" class="profile">ADMIN<img src="./images/caretdown.png" alt=""
							class="caretdown"></button>
					<div class="adminProfile" id="adminProfile">
						<a href="">Settings</a>
						<a href="login">Signout</a>
					</div>

					<div class="menu-navbar">
						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/dashboard.png" alt=""
									class="dashboard-icon">Dashboard<img src="./images/caretright.png" alt=""
									class="caretright"></button>
							<div class="dropdown-dashboard">
								<a href="#">Dashboard</a>
								<a href="">Total of Counter</a>
								<a href="">Total of Students</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/counter.png" alt=""
									class="counter-icon">Counter<img src="./images/caretright.png" alt=""
									class="caretright"></button>
							<div class="dropdown-dashboard">
								<a href="">Add Counter</a>
								<a href="listofcounter">List of Counter</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/users.png" alt=""
									class="users-icon">Users<img src="./images/caretright.png" alt=""
									class="caretright"></button>
							<div class="dropdown-dashboard">
								<a href="">Add Student</a>
								<a href="">Add Staff</a>
								<a href="studentlist">List of Student</a>
								<a href="stafflist">List of Staff</a>
							</div>
						</div> 

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/entertainment.png" alt=""
									class="entertainment-icon">Entertainment<img src="./images/caretright.png" alt=""
									class="caretright"></button>
							<div class="dropdown-dashboard">
								<a href="">Video advertisement</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/display.png" alt=""
									class="display-icon">Display<img src="./images/caretright.png" alt=""
									class="caretright"></button>
							<div class="dropdown-dashboard">
								<a href="">User Inquiry</a>
								<a href="">User Window</a>
								<a href="">Counter Window</a>
							</div>
						</div>
					</div>
				</div>
				<div class="dashboard-section">
					<h1 class="title">Dashboard</h1>
					<div class="dashboard-content">
						<div class="card-total"><br>
							<p>Total counter</p>
							<h3>100</h3>
						</div>
						<div class="card-total"><br>
							<p>Total student</p>
							<h3>100</h3>
						</div>
						<div class="card-total"><br>
							<p>Total Transaction</p>
							<h3>100</h3>
						</div>
						<div class="department-graph">

						</div>
						<div class="total-graph">

						</div>
					</div>
				</div>
			</div>

			<script>
				var dropdown = document.getElementsByClassName("button-profile");
				var i;

				for (i = 0; i < dropdown.length; i++) {
					dropdown[i].addEventListener("click", function () {

						var dropdownContent = this.nextElementSibling;
						if (dropdownContent.style.display === "block") {
							dropdownContent.style.display = "none";
						} else {
							dropdownContent.style.display = "block";
						}
					});
				}


			</script>


			<div class="load-wrapper">
				<div class="main-loader">
					<div class="box-loader">
					</div>
				</div>
			</div>
		</body>

		</html>




		<!-- <h1>
					Welcome
					<c:out value="${admin}"></c:out>
					<c:out value="${sessionScope.sessionName}"></c:out>
				</h1>


				<form action=logout_Servlet method=get>
					<input type="submit" value="logout">
				</form>

				
		 -->