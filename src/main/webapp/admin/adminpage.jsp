<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionAdmin.getUsername()}">
			<c:redirect url="/" />
		</c:if>

		<!DOCTYPE html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" href="../css/prettify.css">
			<link rel="stylesheet" href="../css/notify.css">
			<link rel="stylesheet" href="../css/jquery-confirm.min.css">
			<link rel="stylesheet" href="../css/adminpage.css">
			<link rel="stylesheet" href="../css/loader.css">
			<link rel="stylesheet" href="../css/adminpage.css">
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			<script type="text/javascript" src="https://cdn.lordicon.com/lordicon.js"></script>
			<script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="../scripts/jquery-confirm.min.js"></script>
			<script type="text/javascript" src="../scripts/notify.js"></script>
			<script type="text/javascript" src="../scripts/prettify.js"></script>
			<script type="text/javascript" src="../scripts/ping.js"></script>
			<script type="text/javascript" src="../scripts/fadetransition.js"></script>
			<script type="text/javascript" src="../scripts/chart.min.js"></script>
			<link rel="icon" type="image/x-icon" href="./images/logo.png">
			<title>Admin | Dashboard</title>
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
							<button class="dropdown-btn" onlcick="window.location.href='dashboard';"><svg
									class="dashboard-icon" fill="#ffffff" width="64px" height="64px"
									viewBox="-2 0 19 19" xmlns="http://www.w3.org/2000/svg" class="cf-icon-svg">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
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
							<button class="dropdown-btn" onclick="window.location.href='counterlist';"><svg class="counter-icon" width="64px" height="64px"
									viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
									transform="rotate(90)">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
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
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
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
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
									<g id="SVGRepo_iconCarrier">
										<path fill="#ffffff" fill-rule="evenodd"
											d="M5 5a3 3 0 0 0-3 3v8a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3v-1.586l2.293 2.293A1 1 0 0 0 22 16V8a1 1 0 0 0-1.707-.707L18 9.586V8a3 3 0 0 0-3-3H5z"
											clip-rule="evenodd"></path>
									</g>
								</svg>
								Entertainment
							</button>
						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><svg class="display-icon" fill="#ffffff" width="64px"
									height="64px" viewBox="0 0 256 256" id="Flat" xmlns="http://www.w3.org/2000/svg">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
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
				<div class="dashboard-section">
					<div class="dashboard-head">
						<div class="icon-container">
						</div>

						<!-- admin profile -->
						<button class="profilebutton" id="profilebutton"><svg class="profile" width="64px"
								height="64px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
								<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
								<g id="SVGRepo_iconCarrier">
									<path
										d="M16.19 2H7.81C4.17 2 2 4.17 2 7.81V16.19C2 19 3.29 20.93 5.56 21.66C6.22 21.89 6.98 22 7.81 22H16.19C17.02 22 17.78 21.89 18.44 21.66C20.71 20.93 22 19 22 16.19V7.81C22 4.17 19.83 2 16.19 2ZM20.5 16.19C20.5 18.33 19.66 19.68 17.97 20.24C17 18.33 14.7 16.97 12 16.97C9.3 16.97 7.01 18.32 6.03 20.24H6.02C4.35 19.7 3.5 18.34 3.5 16.2V7.81C3.5 4.99 4.99 3.5 7.81 3.5H16.19C19.01 3.5 20.5 4.99 20.5 7.81V16.19Z"
										fill="#ffffff"></path>
									<path
										d="M12.0019 8C10.0219 8 8.42188 9.6 8.42188 11.58C8.42188 13.56 10.0219 15.17 12.0019 15.17C13.9819 15.17 15.5819 13.56 15.5819 11.58C15.5819 9.6 13.9819 8 12.0019 8Z"
										fill="#ffffff"></path>
								</g>
							</svg><c:out value="${sessionScope.sessionAdmin.username}"></c:out><svg class="caretdown" width="64px" height="64px" viewBox="0 0 24 24" fill="none"
								xmlns="http://www.w3.org/2000/svg">
								<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
								<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
								<g id="SVGRepo_iconCarrier">
									<path
										d="M19 9L14 14.1599C13.7429 14.4323 13.4329 14.6493 13.089 14.7976C12.7451 14.9459 12.3745 15.0225 12 15.0225C11.6255 15.0225 11.2549 14.9459 10.9109 14.7976C10.567 14.6493 10.2571 14.4323 10 14.1599L5 9"
										stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"
										stroke-linejoin="round"></path>
								</g>
							</svg></button>
						<div class="adminProfile" id="adminProfile">
							<a href="adminsettings">Settings</a>
							<a href="logout">Signout</a>
						</div>
					</div>

					<!-- dashboard section/main section -->
					<div class="main-container">
						<h1 class="dashboard-title">Dashboard</h1>
						<hr>
						<div class="dashboard-content">
							<div class="graph-container">
								<canvas id="barGraph"></canvas>
								<div class="total-summary">
									<h2><br>Total Students: <span class="counts" id="total-student">---</span></h2>
									<hr class="hr-graph">
									<p><br>BEED: <span class="counts" id="total-beed-student">loading...</span></p>
									<P><br>BSED: <span class="counts" id="total-bsed-student">loading...</span></P>
									<P><br>BSTM: <span class="counts" id="total-bstm-student">loading...</span></P>
									<P><br>BSHM: <span class="counts" id="total-bshm-student">loading...</span></P>
									<P><br>BSIT: <span class="counts" id="total-bsit-student">loading...</span></P>
									<P><br>BSCRIM: <span class="counts" id="total-crim-student">loading...</span></P>
									<hr class="hr-graph">
									<h2><br>Daily transaction: <span class="counts" id="total-transaction">loading...</span></h2>
								</div>
							</div>

							<!-- General - Program -->
							<div class="table-container">
								<div class="table-content">
									<div class="table-header">
										<h3 class="table-title">General - Program</h3>
										<button class="add-btn-table"
										onclick="ModalInfo('Add Program for General', 'Program', 'GeneralProgramForm', 'general', 'POST', updateAttribute(null, null, null))">+Add
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
											<tbody id="general-program-tablelist">
												<tr>
													<td></td>
													<td></td>
													<td><button class="update-btn" onclick="">Update</button>
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
										<button class="add-btn-table"
										onclick="ModalInfo('Add Purpose for General', 'Purpose', 'GeneralPurposeForm', 'general', 'POST', updateAttribute(null, null, null))">+Add
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
										<tbody id="general-purpose-tablelist">
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
										<button class="add-btn-table"
										onclick="ModalInfo('Add Document for Records', 'Document', 'RecordsPurposeForm', 'records', 'POST', updateAttribute(null, null, null))">+Add
											Info</button>
									</div>
									<table>
										<thead>
											<tr>
												<th>#</th>
												<th>Documents</th>
												<th>Amount</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody id="records-purpose-tablelist">
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td><button class="update-btn">Update</button>
													<button class="delete-btn">Delete</button>
												</td>
											</tr>
											<tr>
												<td></td>
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
										<button class="add-btn-table"
										onclick="ModalInfo('Add Purpose for Archiving', 'Purpose', 'ArchivingPurposeForm', 'archiving', 'POST', updateAttribute(null, null, null))">+Add
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
										<tbody id="archiving-purpose-tablelist">
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
			</div>
			<div class="load-wrapper">
				<div class="main-loader">
					<div class="box-loader">
					</div>
				</div>
			</div>
			<script type="text/javascript" src="../scripts/admin/adminpage.js"></script>
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