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
				--text-color: #3D3C42;
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
				margin-left: 1.5rem;
				position: absolute;
				background-color: var(--background-color);
				width: 12vw;
				align-items: center;
				justify-content: center;
				text-align: center;
				z-index: 1;
				display: none;
				border-radius: 7px;
			}

			.adminProfile a {
				text-decoration: none;
				color: var(--text-color);
				overflow: hidden;
				width: 12vw;
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
				width: 12vw;
				margin-top: 30px;
				margin-left: 23px;
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
				padding: 10px;
			}

			.dropdown-dashboard a {
				display: flex;
				text-decoration: none;
				color: black;
				text-align: center;
				align-items: center;
				justify-content: center;
				font-size: 11px;
				flex-direction: column;
				padding: 10px;
			}

			.dropdown-dashboard a:hover {
				background-color: var(--select-text-color);
				border-radius: 4px;
				color: black;
				border-radius: 4px;
				padding: 10px;
				width: 120px;
				margin-left: -7.2%;
			}

			.dropdown-btn {
				background: none;
				padding: 20px;
				display: flex;
				align-items: center;
				width: 20vw;
				border: 0;
				font-size: 15px;
				border-radius: 15px;
				padding-right: 60px;
				margin-left: 10px;
				cursor: pointer;
				position: relative;
				color: #F6F4EB;
			}

			.dropdown-btn a {
				text-decoration: none;
				color: #F6F4EB;
			}
			.dropdown-btn a:hover{
				color: black;
				font-weight: bold;
			}

			.dropdown:hover .dropdown-dashboard {
				display: block;
				color: black;
			}

			.dropdown {
				color: var(--background-color);
			}

			.dropdown:hover {
				color: black;
				font-weight: bold;
			}

			.dropdown-btn a:hover,
			.dropdown-btn:hover, .active {
				color: var(--text-color);
				font-weight: bold;
			}

			.active,
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
				color: var(--text-color);
				font-size: 2rem;
				margin-top: -40%;
				margin-left: -60%;
				position: absolute;
			}

			.card-total p {
				font-size: .7rem;
			}

			.card-total p,
			h3 {
				margin-left: 30px;
				color: var(--background-color);
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
				background-image: linear-gradient(135deg, #1e91d0 15%, #00509d 100%);
				border-radius: 15px;
				justify-content: space-evenly;
				margin-top: 2rem;
			}

			.department-graph {
				width: 30%;
				height: 62.5%;
				background-color: #ffff;
				border-radius: 15px;
				margin-top: 2rem;
			}

			.total-graph {
				width: 48%;
				height: 30%;
				margin-top: 12%;
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
					<button class="button-profile" id="button-profile"><img src="./images/profile.png" alt=""
							class="profile">ADMIN<img src="./images/caretdown.png" alt="" class="caretdown"></button>
					<div class="adminProfile" id="adminProfile">
						<a href="">Settings</a>
						<a href="login">Signout</a>
					</div>

					<div class="menu-navbar">
						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/dashboard.png" alt=""
									class="dashboard-icon"><a href="">Dashboard</a>
							</button>

						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/counter.png" alt=""
									class="counter-icon">Counter</button>
							<div class="dropdown-dashboard">
								<a href="">Add Counter</a>
								<a href="listofcounter">List of Counter</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/users.png" alt=""
									class="users-icon">Users</button>
							<div class="dropdown-dashboard">
								<a href="">Add Student</a>
								<a href="">Add Staff</a>
								<a href="studentlist">List of Student</a>
								<a href="stafflist">List of Staff</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/entertainment.png" alt=""
									class="entertainment-icon"><a href="">Entertainment</a>
							</button>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/display.png" alt=""
									class="display-icon">Display</button>
							<div class="dropdown-dashboard">
								<a href="">User Inquiry</a>
								<a href="">User Window</a>
								<a href="">Counter Window</a>
							</div>
						</div>
					</div>
				</div>
				<div class="dashboard-section">
					<h1 class="dashboard-title">Dashboard</h1>
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
							<p>Total transaction</p>
							<h3>100</h3>
						</div>
						<div class="department-graph">
							<canvas id="myPie"></canvas>
						</div>
						<div class="total-graph">
							<canvas id="myChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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


				/* <summary>
				CHARTJS.....	
				</summary>*/
				let staffNum, studentNum, inquiryNum;
				let BSIT = 0;
				let BEED = 0;
				let DEVCOM = 0;
				let BSTM = 0;
				let BSHM = 0;
				Promise.all([
					fetch('/smartqueueweb/JsonStaffListAPI'),
					fetch('/smartqueueweb/JsonStudentListAPI')
					// fetch('http://localhost:8080/smartqueueweb/JsonInquiryListAPI')
				])
					.then(responses => {
						responses.forEach(response => {
							if (!response.ok) {
								throw new Error('Network response problem' + response.statusText);
							}
						});
						return Promise.all(responses.map(response => response.json()));
					})
					.then(data => {
						staffNum = data[0].length; // Staff count
						studentNum = data[1].length; // Student count
						inquiryNum = 10; // Inquiry count

						data[1].forEach(item => {
							if (item.course.includes('BSIT')) {
								BSIT++;
							}
							if (item.course.includes('BEED')) {
								BEED++
							}
							if (item.course.includes('DEVCOM')) {
								DEVCOM++
							}
							if (item.course.includes('BSTM')) {
								BSTM++
							}
							if (item.course.includes('BSHM')) {
								BSHM++
							}
						});



						console.log(studentNum, staffNum, inquiryNum); // Use as needed
						myChart(studentNum, staffNum, inquiryNum);
						PieChart(BSIT, BEED, DEVCOM, BSTM, BSHM)
					})
					.catch(error => {
						console.error('There was a problem with the fetch operation:', error);
					});



				// fetch('http://localhost:8080/smartqueueweb/JsonStaffListAPI')
				// 	.then(response => {
				// 		if (!response.ok) {
				// 			throw new Error('Network response was not ok ' + response.statusText);
				// 		}
				// 		return response.json();
				// 	})
				// 	.then(data => {
				// 		let student = 3;
				// 		let staff = data.length; // Get the number of items
				// 		let totalInquiry = 20;
				// 		myChart(student, staff, totalInquiry);
				// 	})
				// 	.catch(error => {
				// 		console.error('There was a problem with the fetch operation:', error);
				// 	});


				let delayed;
				function myChart(studentNum, staffNum, inquiryNum) {
					const ctx = document.querySelector('#myChart');


					new Chart(ctx, {
						type: 'bar',
						data: {
							labels: ['Students', 'Staff', 'Inquiry Today'],
							datasets: [{
								label: 'Total Number',
								data: [studentNum, staffNum, inquiryNum],
								borderWidth: 2
							}]
						},
						options: {
							animation: {
								onComplete: () => {
									delayed = true;
								},
								delay: (context) => {
									let delay = 0;
									if (context.type === 'data' && context.mode === 'default' && !delayed) {
										delay = context.dataIndex * 2000 + context.datasetIndex * 400;
									}
									return delay;
								},
							},
							scales: {
								y: {
									beginAtZero: true
								}
							}
						}
					});
				}

				function PieChart(BSIT, BEED, DEVCOM, BSTM, BSHM) {
					const ctz = document.querySelector('#myPie');
					let pattern;
					new Chart(ctz, {
						type: 'doughnut',
						data: {
							labels: ['BSIT', 'BEED', 'DEVCOM', 'BSTM', 'BSHM'],
							datasets: [{
								data: [BSIT, BEED, DEVCOM, BSTM, BSHM],
							}],


						},
						options: {
							animation: {
								onComplete: () => {
									delayed = true;
								},
								delay: (context) => {
									let delay = 0;
									if (context.type === 'data' && context.mode === 'default' && !delayed) {
										delay = context.dataIndex * 300 + context.datasetIndex * 200;
									}
									return delay;
								},
							}
						}
					});
				}

				var btns = document.getElementsByClassName("dropdown-btn");
				var dropdowns = document.getElementsByClassName("dropdown-dashboard");

				for (var i = 0; i < btns.length; i++) {
					btns[i].addEventListener("click", function () {
						// Remove "active" class from all buttons
						for (var j = 0; j < btns.length; j++) {
							btns[j].classList.remove("active");
						}

						// Hide all dropdowns
						for (var k = 0; k < dropdowns.length; k++) {
							dropdowns[k].style.display = "none";
						}

						// Add "active" class to the clicked button
						this.classList.add("active");

						// Show the related dropdown
						var dropdownContent = this.nextElementSibling;
						if (dropdownContent && dropdownContent.classList.contains("dropdown-dashboard")) {
							dropdownContent.style.display = "block";
						}
					});
				}

				// Optional: Hide dropdowns and remove active states when clicking outside the navbar
				document.addEventListener("click", function (event) {
					var isClickInsideNavbar = event.target.closest(".navbar");
					if (!isClickInsideNavbar) {
						// Remove active class from all buttons
						for (var j = 0; j < btns.length; j++) {
							btns[j].classList.remove("active");
						}

						// Hide all dropdowns
						for (var k = 0; k < dropdowns.length; k++) {
							dropdowns[k].style.display = "none";
						}
					}
				});

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