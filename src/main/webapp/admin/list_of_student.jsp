<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionAdmin.getUsername()}">
			<c:redirect url="/" />
		</c:if>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" href="../css/fontawesome.css">
			<script src='https://kit.fontawesome.com/a076d05399.js'></script>
			<script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="../scripts/ping.js"></script>
			<script type="text/javascript" src="../scripts/fadetransition.js"></script>
			<script type="text/javascript" src="../scripts/jquery-confirm.min.js"></script>
			<link rel="stylesheet" type="text/css" href="../css/jquery-confirm.min.css" />
			<link rel="stylesheet" href="../css/loader.css">
			<link rel="stylesheet" href="../css/studentlist.css">
			<link rel="icon" type="image/x-icon" href="./images/logo.png">
			<title>Admin | List of Student</title>
		</head>

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
							<button class="dropdown-btn" onclick="window.location.href = 'dashboard';"><svg
									class="dashboard-icon" fill="#ffffff" width="64px" height="64px"
									viewBox="-2 0 19 19" xmlns="http://www.w3.org/2000/svg" class="cf-icon-svg">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round">
									</g>
									<g id="SVGRepo_iconCarrier">
										<path
											d="M13.55 15.256H1.45a.554.554 0 0 1-.553-.554V3.168a.554.554 0 1 1 1.108 0v10.98h11.544a.554.554 0 0 1 0 1.108zM3.121 13.02V6.888a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v6.132zm2.785 0V3.507a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v9.513zm2.785 0V6.888a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v6.132zm2.786 0v-2.753a.476.476 0 0 1 .475-.475h.785a.476.476 0 0 1 .475.475v2.753z">
										</path>
									</g>
								</svg>
								Dashboard
							</button>

						</div>

						<div class="dropdown">
							<button class="dropdown-btn" onclick="window.location.href='counterlist';"><svg
									class="counter-icon" width="64px" height="64px" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg" transform="rotate(90)">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round">
									</g>
									<g id="SVGRepo_iconCarrier">
										<path
											d="M4.5 3.75L4.5 20.25C4.5 20.6642 4.16421 21 3.75 21C3.33579 21 3 20.6642 3 20.25V3.75C3 3.33579 3.33579 3 3.75 3C4.16421 3 4.5 3.33579 4.5 3.75Z"
											fill="#ffffff"></path>
										<path
											d="M16 5.25C16 4.00736 15.1046 3 14 3H10C8.89543 3 8 4.00736 8 5.25V8L16 8V5.25Z"
											fill="#ffffff"></path>
										<path d="M8 14.5V9.5L16 9.5V14.5L8 14.5Z" fill="#ffffff"></path>
										<path
											d="M8 16V18.75C8 19.9926 8.89543 21 10 21H14C15.1046 21 16 19.9926 16 18.75V16L8 16Z"
											fill="#ffffff"></path>
										<path
											d="M21 20.25V3.75C21 3.33579 20.6642 3 20.25 3C19.8358 3 19.5 3.33579 19.5 3.75V20.25C19.5 20.6642 19.8358 21 20.25 21C20.6642 21 21 20.6642 21 20.25Z"
											fill="#ffffff"></path>
									</g>
								</svg>Counter</button>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><svg class="users-icon" fill="#ffffff" width="64px"
									height="64px" viewBox="0 -64 640 640" xmlns="http://www.w3.org/2000/svg">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round">
									</g>
									<g id="SVGRepo_iconCarrier">
										<path
											d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z">
										</path>
									</g>
								</svg>Users</button>
							<div class="dropdown-dashboard">
								<a href="studentlist">Student</a>
								<a href="stafflist">Staff</a>
							</div>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn" onclick="window.location.href = 'videoads';"><svg
									class="entertainment-icon" width="64px" height="64px" viewBox="0 0 24 24"
									xmlns="http://www.w3.org/2000/svg" fill="none">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round">
									</g>
									<g id="SVGRepo_iconCarrier">
										<path fill="#ffffff" fill-rule="evenodd"
											d="M5 5a3 3 0 0 0-3 3v8a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3v-1.586l2.293 2.293A1 1 0 0 0 22 16V8a1 1 0 0 0-1.707-.707L18 9.586V8a3 3 0 0 0-3-3H5z"
											clip-rule="evenodd"></path>
									</g>
								</svg>Entertainment
							</button>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><svg class="display-icon" fill="#ffffff" width="64px"
									height="64px" viewBox="0 0 256 256" id="Flat" xmlns="http://www.w3.org/2000/svg">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round">
									</g>
									<g id="SVGRepo_iconCarrier">
										<path
											d="M232,62.9209v112a24.0275,24.0275,0,0,1-24,24H48a24.0275,24.0275,0,0,1-24-24v-112a24.0275,24.0275,0,0,1,24-24H208A24.0275,24.0275,0,0,1,232,62.9209Zm-72,152H96a8,8,0,1,0,0,16h64a8,8,0,0,0,0-16Z">
										</path>
									</g>
								</svg>Display</button>
							<div class="dropdown-dashboard">
								<a href="userinquiry">User Inquiry</a>
								<a href="userwindow">User Window</a>
								<a href="admincounterwindow">Counter Window</a>
							</div>
						</div>
					</div>
				</div>
				<div class="studentlist-section">
					<div class="dashboard-head">
						<div class="icon-container">

						</div>

						<!-- admin profile -->
						<button class="profilebutton" id="profilebutton">
							<img src="" alt="" class="profile-picture" id="profile-picture">
							<c:out value="${sessionScope.sessionAdmin.username}"></c:out><svg
								xmlns="http://www.w3.org/2000/svg" class="caretdown" height="10" width="6.25"
								viewBox="0 0 320 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.-->
								<path fill="#ffffff"
									d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z" />
							</svg>
						</button>
						<div class="adminProfile" id="adminProfile">
							<a href="adminsettings">Settings</a>
							<a href="logout">Signout</a>
						</div>
					</div>


					<div class="studentlist-content">
						<button class="add-account-btn">
							<svg xmlns="http://www.w3.org/2000/svg" height="10" width="12.5" viewBox="0 0 640 512">
								<path fill="#ffffff"
									d="M96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM0 482.3C0 383.8 79.8 304 178.3 304l91.4 0C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7L29.7 512C13.3 512 0 498.7 0 482.3zM504 312l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z" />
							</svg>
							Add Student
						</button>
						<h1>Student List</h1>
						<div class="search-container">
							<input type="text" placeholder="Search.." name="search" class="search-bar" id="searchInput"
								onkeyup="searchTable()">


							<div class="overlay"></div>
							<div class="fillup-form-container modal">
								<h1>Student Registration</h1>
								<span class="close-btn">&times;</span>
								<div class="register-form">
									<form id="studentRegisterForm">
										<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
											<input class="firstname-input" required="required" type="text"
												name="txtFirstname"> <label for="firstname"
												class="firstname-label">First name</label>
										</div>
										<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
											<input class="middlename-input" type="text" name="txtMiddlename"> <label
												for="middlename" class="middlename-label">Middle name</label>
										</div>

										<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
											<input class="lastname-input" required="required" type="text"
												name="txtLastname"> <label for="lastname" class="lastname-label">Last
												name</label>
										</div>

										<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">

											<select name="purpose" id="records-purpose" class="purpose"
												required="required">
												<option value="" disabled selected=hidden>Select course</option>
												<option value="BEED">BEED</option>
												<option value="BSHM">BSHM</option>
												<option value="BSIT">BSIT</option>
												<option value="BSTM">BSTM</option>
												<option value="BSED">BSED</option>
												<option value="BSCRIM">BSCRIM</option>
											</select>
										</div>
										<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
											<input class="lastname-input" required="required" type="text"
												name="txtIdnumber"> <label for="lastname" class="lastname-label">Id
												number</label>
										</div>

										<input class="sign-btn" type="submit" value="Signup">
									</form>
								</div>
							</div>
						</div>
						<div class="table-container">
							<table id="myTable">
								<thead>
									<tr>
										<th class="titlepage">Student ID</th>
										<th class="titlepage">Name</th>
										<th class="titlepage">Course</th>
										<th class="titlepage">Options</th>
										<!-- Added Options Header -->
									</tr>
								</thead>
								<tbody id="tablelist">
									<tr>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
										<td>
											<div class="tloader"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="load-wrapper">
					<div class="main-loader">
						<div class="box-loader"></div>
					</div>
				</div>

				<script type="text/javascript" src="../scripts/admin/list_of_student.js"></script>
				<script type="text/javascript" src="../scripts/profilePic.js"></script>
				<script>
					FetchImage("#profile-picture");
				</script>
		</body>

		</html>