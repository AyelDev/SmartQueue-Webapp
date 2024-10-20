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
				--background-color: #f4f4f9;
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
				font-family: var(--body-fonts);
				margin: 0;
				padding: 0;
				font-optical-sizing: auto;
				font-style: normal;
				height: auto;
				background-color: #f4f4f9;
			}

			.container {
				width: 100%;
				height: auto;
				background-color: var(--background-color);
				align-items: center;
				justify-content: center;
				margin-top: 3%;
			}


			/*Navbar section*/
			.navbar {
				width: 15vw;
				height: 100vh;
				background-image: linear-gradient(90deg, #1e91d0 15%, #1477d4fb 100%);
				position: fixed;
				justify-content: center;
				align-items: center;
				left: 0;
				float: left;
				margin-top: -3%;
			}

			.logoContainer {
				width: 100%;
				text-align: center;
			}

			.logo {
				width: 50%;
				max-width: 100%;
				object-fit: contain;
				margin-top: 50px;
			}

			.title {
				color: var(--background-color);
				font-size: 0.8em;
			}

			/* menu */
			.menu-navbar {
				margin-top: 3rem;
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
				overflow-x: hidden;
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
				border-radius: 16px 0 0 16px;
				padding-right: 60px;
				margin-left: 10px;
				cursor: pointer;
				position: relative;
				color: #F6F4EB;
			}

			.dropdown-btn::after {
				content: '';
				border-radius: 50%;
			}

			.dropdown-btn a {
				text-decoration: none;
				color: #F6F4EB;
			}

			.dropdown-btn a:hover {
				color: black;
				font-weight: bold;
			}

			.dropdown:hover .dropdown-dashboard {
				display: block;

			}

			.dropdown {
				color: var(--background-color);
			}

			.dropdown:hover {
				color: black;
				font-weight: bold;
			}

			.dropdown-btn a:hover,
			.dropdown-btn:hover,
			.active {
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



			/*Dashboard section*/
			.dashboard-section {
				width: 85vw;
				height: auto;
				background-color: var(--background-color);
				float: right;
				margin-left: 15%;
				align-items: center;
				display: flex;
				justify-content: center;
				padding: 20px;
				padding: 20px;

			}

			.dashboard-section h1 {
				color: var(--text-color);
				font-size: 2rem;
				margin-top: -35%;
				margin-left: -60%;
				position: absolute;

			}

			.dashboard-head {
				width: 83vw;
				margin-left: 3%;
				height: 10%;
				background-color: #1477d4fb;
				position: fixed;
				margin-top: -47.6%;
				z-index: 1000;
			}

			.bell-icon {
				object-fit: scale-down;
				width: 20px;
				margin-top: 2.5%;
				margin-left: 67%;
				cursor: pointer;
			}

			.chat-icon {
				object-fit: scale-down;
				width: 20px;
				margin-left: 2%;
				cursor: pointer;
			}

			.button-profile {
				align-items: center;
				justify-content: center;
				display: flex;
				width: 10vw;
				margin-top: -3%;
				margin-left: 84%;
				border-radius: 10px;
				padding: 15px 10px 15px 10px;
				/*tlbr*/
				overflow: hidden;
				cursor: pointer;
				border: none;
				background: none;
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

			.adminProfile {
				margin-left: 84%;
				position: absolute;
				background-color: white;
				width: 10vw;
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
				width: 10vw;
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

			.dashboard-content {
				width: 75vw;
				height: 80vh;
				justify-content: space-evenly;
				display: flex;
				margin-top: 5%;
			}

			.card-total {
				width: 20%;
				height: 20%;
				background-image: linear-gradient(90deg, #1e91d0 15%, #1477d4fb 100%);
				border-radius: 15px;
				justify-content: space-evenly;
				margin-top: 2rem;
				box-shadow: 1px 1px 10px 1px rgba(0, 0, 0, 0.3);
			}

			.card-total p {
				font-size: .7rem;
			}

			.card-total p,
			h3 {
				margin-left: 30px;
				color: var(--background-color);
			}

			.department-graph {
				width: 30%;
				height: 62.5%;
				background-color: #ffff;
				border-radius: 15px;
				margin-top: 2rem;
				box-shadow: 1px 1px 10px 1px rgba(0, 0, 0, 0.3);
			}

			.total-graph {
				width: 48%;
				height: 30%;
				margin-top: 12%;
				margin-left: -24%;
				background-color: #ffff;
				position: absolute;
				border-radius: 15px;
				box-shadow: 1px 1px 10px 1px rgba(0, 0, 0, 0.3);
			}

			/* table section */
			.table-container {
				padding: 20px;
				display: grid;
				grid-template-columns: repeat(auto-fit, minmax(420px, 1fr));
				width: 80vw;
				height: 100%;
				position: absolute;
				background-color: var(--background-color);
				margin-left: 3.9%;
				margin-top: 27%;
				justify-content: center;
				align-items: center;
				color: var(--text-color);
			}

			.table-content {
				background-color: white;
				padding: 15px;
				border-radius: 5px;
				box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
				width: 30vw;
				height: auto;
				color: var(--text-color);
				margin-left: 8%;
				scroll-behavior: smooth;
			}
			

			.table-content::-webkit-scrollbar {
				width: .8rem;
			}

			.table-content::-webkit-scrollbar-track {
				background: transparent;
			}

			.table-content::-webkit-scrollbar-thumb {
				background-color: var(--primary-color);
				border-radius: 5rem;
			}

			.table-header {
				display: flex;
				justify-content: space-between;
				align-items: center;
				margin-bottom: 10px;
				color: var(--text-color);
			}

			.table-header .table-title,
			#modal-title {
				margin: 0;
				color: var(--text-color);
			}

			.add-btn-table {
				background-color: #00509d;
				color: white;
				border: none;
				padding: 10px 15px;
				border-radius: 5px;
				cursor: pointer;
			}

			table {
				width: 100%;
				border-collapse: collapse;
				margin-bottom: 15px;
			}

			table th,
			table td {
				padding: 10px;
				text-align: left;
				border-bottom: 1px solid #ddd;
			}

			table th {
				background-color: #1e91d0;
				color: white;
			}

			table td button {
				padding: 5px 10px;
				margin: 2px;
				border: none;
				border-radius: 3px;
				cursor: pointer;
			}

			.update-btn {
				background-color: #ffc107;
				color: white;
			}

			.delete-btn {
				background-color: #dc3545;
				color: white;
			}

			.modal {
				display: none;
				position: fixed;
				z-index: 1;
				left: 0;
				top: 0;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, 0.5);
				justify-content: center;
				align-items: center;
			}

			.modal-content {
				background-color: white;
				padding: 20px;
				border-radius: 5px;
				width: 450px;
				box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
			}

			.modal-content h3 {
				margin-top: 0;
			}

			.modal-content input[type="text"],
			.modal-content input[type="email"] {
				width: 100%;
				padding: 10px;
				margin-bottom: 10px;
				border: 1px solid #ddd;
				border-radius: 3px;
			}

			.modal-content button {
				padding: 10px 15px;
				border: none;
				border-radius: 5px;
				cursor: pointer;
			}

			.submit-btn {
				background-color: #00509d;
				color: white;
			}

			.cancel-btn {
				background-color: #ccc;
				margin-right: 10px;
			}

			.submit-btn:hover {
				background-color: #1477d4fb;
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
								<a href="listofcounter">List of Counter</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/users.png" alt=""
									class="users-icon">Users</button>
							<div class="dropdown-dashboard">
								<a href="studentlist">List of Student</a>
								<a href="stafflist">List of Staff</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="./images/entertainment.png" alt=""
									class="entertainment-icon"><a href="videoads">Entertainment</a>
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
					<div class="dashboard-head">
						<img src="./images/bell.png" alt="" class="bell-icon">
						<img src="./images/message.png" alt="" class="chat-icon">

						<!-- admin profile -->
						<button class="button-profile" id="button-profile"><img src="./images/profile.png" alt=""
								class="profile">ADMIN<img src="./images/caretdown.png" alt=""
								class="caretdown"></button>
						<div class="adminProfile" id="adminProfile">
							<a href="">Settings</a>
							<a href="logout">Signout</a>
						</div>
					</div>

					<!-- dashboard section -->
					<h1 class="dashboard-title">Dashboard</h1>
					<div class="dashboard-content">
						<div class="card-total"><br>
							<p>Total students</p>
							<h3>100</h3>
						</div>
						<div class="card-total"><br>
							<p>Total staff</p>
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

						<!-- General - Program -->
						<div class="table-container">
							<div class="table-content">
								<div class="table-header">
									<h3 class="table-title">General - Program</h3>
									<button class="add-btn-table" onclick="showModal ('Add Program for General')">+Add
										Info</button>
								</div>
								<table>
									<thead>
										<tr>
											<th>#</th>
											<th>Course</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td><button class="update-btn"
													onclick="showModal('Update Info')">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- General - Purpose -->

							<div class="table-content">
								<div class="table-header">
									<h3 class="table-title">General - Purpose</h3>
									<button class="add-btn-table" onclick="showModal ('Add Purpose for General')">+Add
										Info</button>
								</div>
								<table>
									<thead>
										<tr>
											<th>#</th>
											<th>Purpose</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- Records - Purpose -->
							<div class="table-content">
								<div class="table-header">
									<h3 class="table-title">Records - Purpose</h3>
									<button class="add-btn-table" onclick="showModal ('Add Document for Records')">+Add
										Info</button>
								</div>
								<table>
									<thead>
										<tr>
											<th>#</th>
											<th>Documents</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- Archiving - Purpose -->
							<div class="table-content">
								<div class="table-header">
									<h3 class="table-title">Archiving - Purpose</h3>
									<button class="add-btn-table" onclick="showModal ('Add Purpose for Archiving')">+Add
										Info</button>
								</div>
								<table>
									<thead>
										<tr>
											<th>#</th>
											<th>Purpose</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>

			<!-- Modal for Add/Update Info -->
			<div class="modal" id="modal">
				<div class="modal-content">
					<h3 id="modal-title"></h3>
					<form>
						<label for="name">Program</label>
						<input type="text" id="name" name="name" placeholder="Enter name">

						<label for="email">Purpose</label>
						<input type="email" id="email" name="email" placeholder="Enter email">

						<button type="button" class="cancel-btn" onclick="hideModal()">Cancel</button>
						<button type="submit" class="submit-btn">Add</button>
					</form>
				</div>
			</div>

			<script src="./scripts/chart.min.js"></script>
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
				let hsNum, shsNum, Num;
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
								labels: ['Students', 'Staff', 'Inquiry'],
								data: [studentNum, staffNum, inquiryNum],
								backgroundColor: [
									'#A0E9FF',
									'#2f5f98',
									'#2d8bba'
								],
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
								backgroundColor: [
									'#31356e',
									'#2f5f98',
									'#2d8bba',
									'#41b8d5',
									'#6ce5e8'
								]
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



				// Show Modal
				function showModal(title) {
					document.getElementById('modal-title').textContent = title;
					document.getElementById('modal').style.display = 'flex';
				}

				// Hide Modal
				function hideModal() {
					document.getElementById('modal').style.display = 'none';
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