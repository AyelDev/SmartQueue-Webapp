<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionAdmin.getUsername()}">
			<c:redirect url="/" />
		</c:if>

		<!DOCTYPE html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<script src="https://cdn.lordicon.com/lordicon.js"></script>
			<script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="./scripts/jquery-confirm.min.js"></script>
			<script type="text/javascript" src="./scripts/notify.js"></script>
      		<script type="text/javascript" src="./scripts/prettify.js"></script>
			<script type="text/javascript" src="./scripts/ping.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="./css/jquery-confirm.min.css">
			<link rel="stylesheet" href="./css/loader.css">
			<link rel="stylesheet" href="../css/adminpage.css">
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
							<button class="dropdown-btn"><svg class="dashboard-icon" fill="#ffffff" width="64px"
									height="64px" viewBox="-2 0 19 19" xmlns="http://www.w3.org/2000/svg"
									class="cf-icon-svg">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
									<g id="SVGRepo_iconCarrier">
										<path
											d="M13.55 15.256H1.45a.554.554 0 0 1-.553-.554V3.168a.554.554 0 1 1 1.108 0v10.98h11.544a.554.554 0 0 1 0 1.108zM3.121 13.02V6.888a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v6.132zm2.785 0V3.507a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v9.513zm2.785 0V6.888a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v6.132zm2.786 0v-2.753a.476.476 0 0 1 .475-.475h.785a.476.476 0 0 1 .475.475v2.753z">
										</path>
									</g>
								</svg><a href="dashboard">Dashboard</a>
							</button>

						</div>

						<div class="dropdown">
							<button class="dropdown-btn"><svg class="counter-icon" width="64px" height="64px"
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
							<div class="dropdown-dashboard">
								<a href="counterlist">List of Counter</a>
							</div>
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
							<button class="dropdown-btn"><svg class="entertainment-icon" width="64px" height="64px"
									viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
									<g id="SVGRepo_iconCarrier">
										<path fill="#ffffff" fill-rule="evenodd"
											d="M5 5a3 3 0 0 0-3 3v8a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3v-1.586l2.293 2.293A1 1 0 0 0 22 16V8a1 1 0 0 0-1.707-.707L18 9.586V8a3 3 0 0 0-3-3H5z"
											clip-rule="evenodd"></path>
									</g>
								</svg><a href="videoads">Entertainment</a>
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
								<a href="counterwindow">Counter Window</a>
							</div>
						</div>
					</div>
				</div>
				<div class="dashboard-section">
					<div class="dashboard-head">
						<div class="icon-container">
							<svg class="bell-icon" width="30px" height="64px" viewBox="0 0 24.00 24.00" fill="none"
								xmlns="http://www.w3.org/2000/svg">
								<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
								<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"
									stroke="#CCCCCC" stroke-width="0.048"></g>
								<g id="SVGRepo_iconCarrier">
									<path
										d="M9.00195 17H5.60636C4.34793 17 3.71872 17 3.58633 16.9023C3.4376 16.7925 3.40126 16.7277 3.38515 16.5436C3.37082 16.3797 3.75646 15.7486 4.52776 14.4866C5.32411 13.1835 6.00031 11.2862 6.00031 8.6C6.00031 7.11479 6.63245 5.69041 7.75766 4.6402C8.88288 3.59 10.409 3 12.0003 3C13.5916 3 15.1177 3.59 16.2429 4.6402C17.3682 5.69041 18.0003 7.11479 18.0003 8.6C18.0003 11.2862 18.6765 13.1835 19.4729 14.4866C20.2441 15.7486 20.6298 16.3797 20.6155 16.5436C20.5994 16.7277 20.563 16.7925 20.4143 16.9023C20.2819 17 19.6527 17 18.3943 17H15.0003M9.00195 17L9.00031 18C9.00031 19.6569 10.3435 21 12.0003 21C13.6572 21 15.0003 19.6569 15.0003 18V17M9.00195 17H15.0003"
										stroke="#ffffff" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round">
									</path>
								</g>
							</svg>
							<svg class="chat-icon" width="64px" height="30px" viewBox="-2.4 -2.4 28.80 28.80"
								fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff">
								<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
								<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"
									stroke="#ffffff030303" stroke-width="0.336">
									<path
										d="M7 4C4.79086 4 3 5.79073 3 7.9997V13.2642C3 15.4732 4.79086 17.2639 7 17.2639L7 19.8998C7 19.9834 7.09639 20.0301 7.16197 19.9783L10.6 17.2639H17C19.2091 17.2639 21 15.4732 21 13.2642V7.99971C21 5.79073 19.2091 4 17 4H7Z"
										stroke="#ffffff" stroke-width="0.552" stroke-linecap="round"></path>
									<path
										d="M9 11C9 11.5523 8.55228 12 8 12C7.44772 12 7 11.5523 7 11C7 10.4477 7.44772 10 8 10C8.55228 10 9 10.4477 9 11Z"
										fill="#ffffff"></path>
									<path
										d="M13 11C13 11.5523 12.5523 12 12 12C11.4477 12 11 11.5523 11 11C11 10.4477 11.4477 10 12 10C12.5523 10 13 10.4477 13 11Z"
										fill="#ffffff"></path>
									<path
										d="M17 11C17 11.5523 16.5523 12 16 12C15.4477 12 15 11.5523 15 11C15 10.4477 15.4477 10 16 10C16.5523 10 17 10.4477 17 11Z"
										fill="#ffffff"></path>
								</g>
								<g id="SVGRepo_iconCarrier">
									<path
										d="M7 4C4.79086 4 3 5.79073 3 7.9997V13.2642C3 15.4732 4.79086 17.2639 7 17.2639L7 19.8998C7 19.9834 7.09639 20.0301 7.16197 19.9783L10.6 17.2639H17C19.2091 17.2639 21 15.4732 21 13.2642V7.99971C21 5.79073 19.2091 4 17 4H7Z"
										stroke="#ffffff" stroke-width="1.608" stroke-linecap="round"></path>
									<path
										d="M9 11C9 11.5523 8.55228 12 8 12C7.44772 12 7 11.5523 7 11C7 10.4477 7.44772 10 8 10C8.55228 10 9 10.4477 9 11Z"
										fill="#ffffff"></path>
									<path
										d="M13 11C13 11.5523 12.5523 12 12 12C11.4477 12 11 11.5523 11 11C11 10.4477 11.4477 10 12 10C12.5523 10 13 10.4477 13 11Z"
										fill="#ffffff"></path>
									<path
										d="M17 11C17 11.5523 16.5523 12 16 12C15.4477 12 15 11.5523 15 11C15 10.4477 15.4477 10 16 10C16.5523 10 17 10.4477 17 11Z"
										fill="#ffffff"></path>
								</g>
							</svg>
						</div>



						<!-- admin profile -->
						<button class="button-profile" id="button-profile"><svg class="profile" width="64px"
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
							</svg>ADMIN<svg class="caretdown" width="64px" height="64px" viewBox="0 0 24 24" fill="none"
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
							<a href="">Settings</a>
							<a href="logout">Signout</a>
						</div>
					</div>

					<!-- dashboard section -->
					<h1 class="dashboard-title">Dashboard</h1> <hr>
					<div class="dashboard-content">
						<div class="card-total"><br>
							<p>Total students</p>
							<h3 id="total-student" class="total-count">---</h3>
						</div>
						<div class="card-total"><br>
							<p>Total staff</p>
							<h3  id="total-staff" class="total-count">---</h3>
						</div>
						<div class="card-total"><br>
							<p>Total transaction</p>
							<h3  id="total-transaction"  class="total-count">---</h3>
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
									<button class="add-btn-table" onclick="showModal ('Add Program for General', 'Course')">+Add
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
											<td><button class="update-btn"
													onclick="showModal('Update Info', 'Course')">Update</button>
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
									<button class="add-btn-table" onclick="showModal ('Add Purpose for General', 'Purpose')">+Add
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
									<button class="add-btn-table" onclick="showModal ('Add Document for Records', 'Document')">+Add
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
									<button class="add-btn-table" onclick="showModal ('Add Purpose for Archiving', 'Purpose')">+Add
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

			<!-- Modal for Add/Update Info -->
			<!-- <div class="modal" id="modal">
				<div class="modal-content">
					<h3 id="modal-title"></h3>
					<form>
						<label for="name">Program</label>
						<input type="text" id="program" name="program" placeholder="Enter program"> -->

						<!-- <label for="email">Purpose</label>
						<input type="email" id="purpose" name="purpose" placeholder="Enter purpose"> -->

						<!-- <button type="button" class="cancel-btn" onclick="hideModal()">Cancel</button>
						<button type="submit" class="submit-btn">Add</button>
					</form>
				</div>
			</div> -->

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
					fetch('/JsonStaffListAPI'),
					fetch('/JsonStudentListAPI')
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

						document.getElementById("total-student").innerHTML = studentNum;
						document.getElementById("total-staff").innerHTML = staffNum;
						document.getElementById("total-transaction").innerHTML = inquiryNum;


						//count 0 to n animation
						$('.total-count').each(function () {
   				 		$(this).prop('Counter',0).animate({
        				Counter: $(this).text()
    					}, {
        				duration: 2000,
        				easing: 'swing',
        				step: function (now) {
            			$(this).text(Math.ceil(now));
        				}
    					});
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
				function showModal(title, context) {

					let recordContent =  ``;

					if(title == 'Add Document for Records'){
						recordContent = `
						<label for="name">Ammount</label>
 						<input type="text" id="amount" name="amount" placeholder="Enter amount">
					`;
					}

					$.confirm({
						type: 'blue',
						boxWidth: '30%',
						useBootstrap: false,
						title: title,
						content: 
						`
						<form>
						<label for="name">`+context+`</label>
 						<input type="text" id="program" name="program" placeholder="Enter program">
						`+recordContent+`
						</form>
						`,
						buttons: {
							sayMyName: {
								text: 'Add',
								btnClass: 'btn-green',
								action: function(){

								}
							},
							Close: function(){
								//do nothing.
							}
						}
					});

// <!-- Modal for Add/Update Info -->
// 			<!-- <div class="modal" id="modal">
// 				<div class="modal-content">
// 					<h3 id="modal-title"></h3>
// 					<form>
// 						<label for="name">Program</label>
// 						<input type="text" id="program" name="program" placeholder="Enter program"> -->

// 						<!-- <label for="email">Purpose</label>
// 						<input type="email" id="purpose" name="purpose" placeholder="Enter purpose"> -->

// 						<!-- <button type="button" class="cancel-btn" onclick="hideModal()">Cancel</button>
// 						<button type="submit" class="submit-btn">Add</button>
// 					</form>
// 				</div>
// 			</div> -->

					//document.getElementById('modal-title').textContent = title;
					// document.getElementById('modal').style.display = 'flex';
				}

				// Hide Modal
				function hideModal() {
					document.getElementById('modal').style.display = 'none';
				}


				//button-profile being active btn
				document.getElementById('button-profile').addEventListener('click', function () {
					this.classList.toggle('active');
					document.getElementById('adminProfile').classList.toggle('show');
				});


				//fetch data for general records and archiving
				function updateRecordsGeneralArchivingDatas(servicetype) {
					generalitemId = 1;
					generalitempurposeId = 1;
					recordsitemId = 1;
					archivingItemId = 1;
					$.ajax({
						url: '/JsonServiceListAPI',
						method: 'GET',
						data: {},
						dataType: 'json',
						success: function (data) {
							const tableGeneralProgramBody = $('#general-program-tablelist');
							const tableGeneralPurposeBody = $('#general-purpose-tablelist');
							const tableRecordsPurposeBody = $('#records-purpose-tablelist');
							const tableArchivePurposeBody = $('#archiving-purpose-tablelist');

							tableGeneralProgramBody.empty();
							tableGeneralPurposeBody.empty();
							tableRecordsPurposeBody.empty();
							tableArchivePurposeBody.empty();

							// Populate table with new data
							data.forEach(item => {

								if(item.course !== undefined && item.serviceType == 'GENERAL'){
								tableGeneralProgramBody.append(`
									<tr>
											<td>`+(generalitemId++)+ `</td>
											<td>`+item.course+ `</td>
											<td><button class="update-btn"
													onclick="showModal('Update Info')">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
               					`);
								}
								else if(item.purpose !== undefined && item.serviceType == 'GENERAL'){
								tableGeneralPurposeBody.append(`
										<tr>
											<td>`+(generalitempurposeId++)+`</td>
											<td>`+item.purpose+`</td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
								`);}
								
								if(item.purpose !== undefined && item.serviceType == 'RECORDS'){
								tableRecordsPurposeBody.append(`
									<tr>
										<td>`+(recordsitemId++)+`</td>
											<td>`+item.purpose+`</td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
								`);}
								else if(item.program === undefined && item.serviceType == 'ARCHIVING'){
								tableArchivePurposeBody.append(`
									<tr>
											<td>`+(archivingItemId++)+`</td>
											<td>`+item.purpose+`</td>
											<td><button class="update-btn">Update</button>
												<button class="delete-btn">Delete</button>
											</td>
										</tr>
								`);}

							});
						},
						error: function (error) {
							console.error('Error fetching data:', error);
						}
					});
				}
				updateRecordsGeneralArchivingDatas();

				

				
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