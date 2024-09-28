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
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.4/jquery-confirm.min.css">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.4/jquery-confirm.min.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="./css/loader.css">
			<title>Admin | List of Staff</title>
		</head>
		<style>
			@import url('./admin/fonts.css');

			:root {
				--primary-color: #1e91d0;
				--secondary-color: #00509d;
				--darkblue: #2D59B2;
				--body-fonts: Arial, Helvetica black;
				--background-color: #F6F4EB;
				--select-text-color: #B4B4B8;
				--text-color: #272829;
			}

			/* custom scroll bar */
			html::-webkit-scrollbar {
				width: .8rem;
			}

			html::-webkit-scrollbar-track {
				background: transparent;
			}

			html::-webkit-scrollbar-thumb {
				background-color: var(--darkblue);
				border-radius: 5rem;
			}

			body {
				width: 100%;
				height: 100%;
				font-family: Arial, Helvetica black;
				margin: 0;
				padding: 0;
			}

			.container {
				width: 100%;
				height: auto;
				background-color: white;
				display: grid;
				grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
				align-items: center;
				justify-content: center;
				overflow: hidden;
			}

			.navbar {
				width: 15vw;
				height: 100vh;
				background-color: var(--primary-color);
				position: fixed;
				justify-content: center;
				align-items: center;
				left: 0;

			}

			.logoContainer {
				width: 100%;
				text-align: center;
			}

			.logo {
				width: 50%;
				max-width: 100%;
				object-fit: contain;
				margin-top: 10%;
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
			.navbar {
				position: fixed;
				z-index: 1;
				top: 0;
				left: 0;
			}

			.menu-navbar {
				margin-top: 2rem;
				display: flex;
				flex-direction: column;
				position: fixed;
			}

			.dropdown {
				position: relative;
				display: inline-block;
			}

			.dropdown-dashboard {
				display: none;
				position: absolute;
				background-color: var(--background-color);
				min-width: 160px;
				top: 100%;
				left: 80%;
				z-index: 1;
				box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
				border-radius: 4px;
			}

			.dropdown-dashboard a {
				display: block;
				text-decoration: none;
				color: var(--text-color);
				padding: 12px 16px;
				text-align: center;
			}

			.dropdown-dashboard a:hover {
				background-color: var(--select-text-color);
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

			.stafflist-section {
				width: 85vw;
				background-color: var(--background-color);
				float: right;
				margin-left: 15%;
				align-items: center;
				display: flex;
				justify-content: center;
			}

			.title-page {
				margin-top: -50%;
			}

			h1 {
				font-size: 24px;
				margin-bottom: 20px;
				text-align: center;
				color: #2c3e50;
				margin-top: -3%;

			}

			table {
				width: 100%;
				height: auto;
				border-collapse: separate;
				border-spacing: 0;
				border-radius: 10px;
				overflow: hidden;
				/* Ensures the border radius applies to the table */
			}

			thead {
				background-color: #3498db;
				color: #ffffff;
				width: 20%;

			}

			th {
				padding: 12px 5px;
				text-align: left;
				font-size: 16px;
				font-weight: 600;

				border-bottom: 3px solid #2980b9;
			}

			tbody tr {
				transition: background-color 0.3s, transform 0.3s;
			}

			tbody tr:hover {
				background-color: #ecf0f1;
				transform: translateY(-2px);
			}

			td {
				padding: 12px 15px;
				border-bottom: 1px solid #e1e5ea;
				font-size: 14px;
				color: #555;
				text-align: center;
				/* Center-align text in cells */
			}

			tr:first-child td {
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
			}

			tr:last-child td {
				border-bottom-left-radius: 10px;
				border-bottom-right-radius: 10px;
			}

			button {
				border: none;
				padding: 8px 12px;
				font-size: 14px;
				font-weight: bold;
				border-radius: 5px;
				cursor: pointer;
				margin: 0 5px;
				transition: background-color 0.3s, color 0.3s;
			}

			.btn.update {
				background-color: #3498db;
				color: #ffffff;
			}

			.btn.update:hover {
				background-color: #2980b9;
			}

			.btn.delete {
				background-color: #e74c3c;
				color: #ffffff;
			}

			.btn.delete:hover {
				background-color: #c0392b;
			}

			/* Responsive design for smaller screens */
			@media (max-width: 768px) {

				table,
				thead,
				tbody,
				th,
				td,
				tr {
					display: block;
					width: 100%;
				}

				th,
				td {
					position: relative;
					padding-left: 50%;
					text-align: right;
				}

				th::before,
				td::before {
					content: attr(data-label);
					position: absolute;
					left: 0;
					width: 50%;
					padding-left: 10px;
					font-weight: bold;
					text-align: left;
					background: #f7f9fc;
					border-right: 1px solid #ddd;
					white-space: nowrap;
				}

				td::before {
					content: "";
				}
			}

			.stafflist-content {
				width: 90%;
				max-width: 1000px;
				margin: 20px;
				background: #ffffff;
				border-radius: 10px;
				box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
				overflow: hidden;
				padding: 20px;
			}

			.add-account-icon {
				object-fit: scale-down;
				width: 10%;
			}

			.add-account-btn {
				width: 15%;
				background-color: var(--primary-color);
			}

			.add-account-btn:hover {
				background-color: #2980b9;
			}

			.search-container {
				margin-top: -5.5%;
				margin-left: 75%;
				margin-bottom: 2%;
			}

			.search-bar {
				border-radius: 15px;
				width: 80%;
				padding: 5px;
				border: 1px solid;
			}

			.search-btn {
				border-radius: 15px;
				border: none;
				padding: 5px;
				width: 50px;
				margin-left: -20%;
				background: none;
				margin-bottom: -5%;
			}

			.search-icon {
				object-fit: scale-down;
				width: 14px;
				height: 20px;
				background: none;
				margin-bottom: -10%;
			}

			.fillup-form-container {
				width: 40%;
				background-color: white;
				padding: 20px;
				box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
				border-radius: 10px;
				margin-left: 10%;
				position: absolute;
				z-index: 1;
				display: none;
				align-items: center;
			}

			.fillup-form-container h1 {
				margin-top: 2%;
			}

			.modal.active {
				display: block;
			}

			h1 {
				text-align: center;
				margin-bottom: 20px;
			}

			.close-btn {
				font-size: 2rem;
				position: absolute;
				right: 20px;
				top: 10px;
				cursor: pointer;

			}

			form {
				display: flex;
				flex-wrap: wrap;
				gap: 20px;
			}

			.input-container {
				position: relative;
				width: 48%;

			}

			.input-container input {
				width: 100%;
				padding: 10px;
				border-radius: 5px;
				font-size: 15px;

				border: none;
				outline: 2px solid var(--primary-color);
				background-color: transparent;
				transition: outline-color 500ms;
			}

			.input-container input:focus {
				outline-color: var(--secondary-color);
			}

			.input-container label {
				position: absolute;
				top: 50%;
				left: 10px;
				transform: translateY(-50%);
				color: var(--text-color);
				transition: 0.3s ease;
				background-color: white;
				padding-inline: 5px;
			}

			.input-container input:focus+label,
			.input-container input:valid+label {
				top: -10px;
				transform: translateY(0);
				font-size: 0.8rem;
				color: var(--secondary-color);
			}

			.full-width {
				width: 100%;
			}

			.sign-btn {
				width: 95%;
				padding: 10px;
				background-color: var(--primary-color);
				color: white;
				border: none;
				border-radius: 5px;
				margin-left: 3.5%;
				font-size: 16px;
				cursor: pointer;
				transition: background-color 300ms;
			}

			.sign-btn:hover {
				background-color: var(--secondary-color);
			}

			.add-account {
				padding: 10px 20px;
				background-color: var(--primary-color);
				color: white;
				border: none;
				border-radius: 5px;
				font-size: 16px;
				cursor: pointer;
				transition: background-color 300ms;
			}

			.add-account:hover {
				background-color: var(--secondary-color);
			}

			/* Overlay for background when modal is active */
			.overlay {
				display: none;
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, 0.5);
				z-index: 1;
			}

			.overlay.active {
				display: block;
			}

			.register-form {
				margin-top: 7%;
			}
		</style>

		<body>
			<div class="container">
				<div class="navbar">
					<div class="logoContainer">
						<img src="./images/cec.png" alt="" class="logo">
						<p class="title">Cebu Eastern College
						<p>
					</div>
					<!-- admin profile -->
					<button class="button-profile" id="button-profile"><img src="../images/profile.png" alt=""
							class="profile">ADMIN<img src="../images/caretdown.png" alt="" class="caretdown"></button>
					<div class="adminProfile" id="adminProfile">
						<a href="">Settings</a>
						<a href="login">Signout</a>
					</div>

					<div class="menu-navbar">
						<div class="dropdown">
							<button class="dropdown-btn"><img src="../images/dashboard.png" alt=""
									class="dashboard-icon">Dashboard<img src="./images/caretright.png" alt=""
									class="caretright"></button>
							<div class="dropdown-dashboard">
								<a href="dashboard">Dashboard</a>
								<a href="">Total of Counter</a>
								<a href="">Total of Students</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="../images/counter.png" alt=""
									class="counter-icon">Counter<img src="./images/caretright.png" alt=""
									class="caretright"></button>
							<div class="dropdown-dashboard">
								<a href="">Add Counter</a>
								<a href="listofcounter">List of Counter</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="../images/users.png" alt=""
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
							<button class="dropdown-btn"><img src="../images/entertainment.png" alt=""
									class="entertainment-icon">Entertainment<img src="./images/caretright.png" alt=""
									class="caretright"></button>
							<div class="dropdown-dashboard">
								<a href="">Video advertisement</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><img src="../images/display.png" alt=""
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
				<div class="stafflist-section">
					<div class="stafflist-content">
						<button class="add-account-btn"> <img src="./images/add-account.png" alt=""
								class="add-account-icon"> Add Staff</button>
						<h1>Staff List</h1>
						<div class="search-container">
							<form action="" method=""></form>
							<input type="text" placeholder="Search.." name="search" class="search-bar">
							<button class="search-btn" type="submit"><img src="./images/search-icon.png" alt=""
									class="search-icon"></button>
							</form>
						</div>

						<div class="overlay"></div>
						<div class="fillup-form-container modal">
							<h1>Staff Registration</h1>
							<span class="close-btn">&times;</span>
							<div class="register-form">
								<form id="staffRegisterForm">
									<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
										<input class="firstname-input" required="required" type="text"
											name="txtFirstname">
										<label for="firstname" class="firstname-label">First name</label>
									</div>
									<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
										<input class="lastname-input" required="required" type="text"
											name="txtLastname">
										<label for="lastname" class="lastname-label">Last name</label>
									</div>

									<div class="input-container full-width" style="width: 40%; margin: 0 20px 0 20px;">
										<input class="username-input" required="required" type="text"
											name="txtUsername">
										<label for="username" class="username-label">Username</label>
									</div>

									<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
										<input class="contactno-input" required="required" type="text"
											name="txtContactno">
										<label for="contactno" class="contactno-label">Contact no.</label>
									</div>

									<div class="input-container" style="width: 91%; margin-left: 20px;">
										<input class="email-input" required="required" type="text" name="txtEmail">
										<label for="email" class="email-label">Email</label>
									</div>

									<input class="sign-btn" type="submit" value="Signup">
								</form>
							</div>
						</div>


						<table>
							<thead>
								<tr>
									<th>Id No.</th>
									<th>Name</th>
									<th>Contact no.</th>
									<th>Email</th>
									<th>Username</th>
									<th>Password</th>
									<th>Restriction</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody id="tablelist">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>Loading data please wait...</td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
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
				<script>
					var staffListInfo = document.getElementById("tablelist");


					function updateData() {
						var request = new XMLHttpRequest();
						request.open('GET', '/smartqueueweb/JsonStaffListAPI');
						request.onload = function () {
							var data = JSON.parse(request.responseText);
							renderHTML(data);
						}
						request.send();
					}

					function renderHTML(data) {
						var htmlString = ``;

						for (var i = 0; i < data.length; i++) {

							htmlString += "<tr>";
							htmlString += "<td>" + data[i].staffID + "</td>";
							htmlString += "<td>" + data[i].firstname + " " + data[i].lastname + "</td>";
							htmlString += "<td>+63" + data[i].contactNumber + "</td>";
							htmlString += "<td>" + data[i].email + "</td>";
							htmlString += "<td>" + data[i].username + "</td>";
							htmlString += "<td>" + data[i].password + "</td>";
							htmlString += "<td>" + (data[i].isLocked === 1 ? "Locked" : "Not Locked") + "</td>";
							htmlString += '<td><a href="update?staffId=' + data[i].staffID + '"><button class="update" style="background-color: #97BE5A; font-size: .7em;">Update</button></a> ';
							htmlString += '<a href="delete?staffId=' + data[i].staffID + '"><button class="delete" style="background-color: #EE4E4E; font-size: .7em;">Delete</button></a>';
							htmlString += "</tr>";
						}

						staffListInfo.innerHTML = htmlString;
					}

					setInterval(updateData, 2000);

				</script>
				<script>
					// Get elements
					const addAccountButton = document.querySelector('.add-account-btn');
					const closeModalButton = document.querySelector('.close-btn');
					const modal = document.querySelector('.modal');
					const overlay = document.querySelector('.overlay');

					// Function to open the modal
					function openModal() {
						modal.classList.add('active');
						overlay.classList.add('active');
					}

					// Function to close the modal
					function closeModal() {
						modal.classList.remove('active');
						overlay.classList.remove('active');
					}

					// Event listeners
					addAccountButton.addEventListener('click', openModal);
					closeModalButton.addEventListener('click', closeModal);
					overlay.addEventListener('click', closeModal);

					$(document).ready(function () {
						$('#staffRegisterForm').on('submit', function (event) {
							event.preventDefault(); // Prevent the default form submission

							// Create a new AJAX request
							var url = 'staffRegister_Servlet';

							// Prepare the GET request with form data
							var params = $(this).serialize();

							$.ajax({
								url: url,
								type: 'GET',
								data: params,
								success: function (response) {
									openModal()
									$.confirm({
										boxWidth: '30%',
										useBootstrap: false,
										title: 'Registration Successful',
										content: response,
										type: 'green',
										typeAnimated: true,
										buttons: {
											tryAgain: {
												text: 'add more',
												btnClass: 'btn-green',
												action: function () {
													openModal()
												}
											},
											ok: {
												text: 'ok',
												action: function(){
													closeModal()
												}
											}
										}
									});
								},
								error: function (xhr) {
									openModal()
									$.confirm({
										boxWidth: '30%',
										useBootstrap: false,
										title: 'Encountered an error!',
										content: xhr.statusText,
										type: 'red',
										typeAnimated: true,
										buttons: {
											tryAgain: {
												text: 'Try again',
												btnClass: 'btn-red',
												action: function () {
													closeModal()

												}
											},
										}
									});
								}
							});
						});
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