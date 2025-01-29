<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionStaff}">
			<c:redirect url="/" />
		</c:if>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="./scripts/ping.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" type="text/css" href="./css/jquery-confirm.min.css" />
			<script type="text/javascript" src="./scripts/jquery-confirm.min.js"></script>
			<link rel="stylesheet" href="./css/loader.css">
			<link rel="stylesheet" href="../css/add_student.css">
			<title>Staff | List of Student</title>
		</head>
			
			<body>
				<div class="container">
					<div class="navbar">
					<div class="logoContainer">
						<img src="./images/logo.png" alt="" class="logo">
						<p class="title"><b>Cebu Eastern College</b></p>
					</div>
				   
					<div class="leftnav">
						<div class="bottom-lnav">
							<b><a href="staffdashboard"><img src="./images/dashboard.png" alt="Dashboard Icon">Dashboard</a></b>
							<b><a href="userwindow"><img src="./images/display.png" alt="UserWindow Icon">User Window</a></b>
							<b><a href="counterwindow"><img src="./images/counter.png" alt="CounterWindow Icon">Counter Window</a></b>
							<b><a href="addstudent"><img src="./images/studentlist.png" alt="StudentList Icon">Student List</a></b>
							<b><a href="entertainment"><img src="./images/entertainment.png" alt="Entertainment Icon">Entertainment</a></b>
						</div>
					</div>
				</div>				

				</div>
				</div>
				<div class="dash">
					<div class="right-icons">
						
						<div class="icon-container">
							<a href="#"></a>
							<img src="./images/message.png" class="picture"/>
							<span class="tooltip-text">Message</span>
						</div>
					</div>
					
					<button class="button-profile"><img src="./images/profile.png" alt="" class="profile">STAFF<img src="./images/caretdown.png" alt="" class="caretdown"></button>
						<div class="staffProfile" id="staffProfile">
							<a href="setting">Settings</a>
							<a href="logout">Signout</a>
						</div>
				</div>

				<div class="studentlist-content">
					<button class="add-account-btn">
						<img src="./images/add-account.png" alt="" class="add-account-icon">
						Add Student
					</button>
					<h1>Student List</h1>
					<div class="search-container">
						<input type="text" placeholder="Search.." name="search" class="search-bar"
							id="searchInput" onkeyup="searchTable()">
						<button class="search-btn" type="submit">
							<img src="./images/search-icon.png" alt="" class="search-icon">
						</button>
					</div>

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
										<option value="" disabled selected = hidden>Select course</option>
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
					<div class="table-container">
					<table id="myTable">
						<thead>
							<tr>
								<th>Student ID</th>
								<th>Name</th>
								<th>Course</th>
								<th>Options</th>
								<!-- Added Options Header -->
							</tr>
						</thead>
						<tbody id="tablelist">
							<tr>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
							</tr>
							<tr>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
							</tr>
							<tr>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
							</tr>
							<tr>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
							</tr>
							<tr>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
								<td><div class="tloader"></div></td>
							</tr>
						</tbody>
					</table>
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

				var staffListInfo = document.getElementById("tablelist");

				function updateData() {
					var request = new XMLHttpRequest();
					request.open('GET', '/JsonStudentListAPI');
					request.onload = function () {
						var data = JSON.parse(request.responseText);
						renderHTML(data);
						searchTable();
					}
					request.send();
				}

				function renderHTML(data) {
					var htmlString = ``;

					for (var i = 0; i < data.length; i++) {

						htmlString += "<tr>";
						htmlString += "<td>" + data[i].idnumber + "</td>";
						htmlString += "<td>" + data[i].firstname + " " + data[i].middlename + " " + data[i].lastname + " </td>";
						htmlString += "<td>" + data[i].course + "</td>";
						htmlString += '<td><button onclick="updateStudent(' + data[i].idnumber + ', \'' + data[i].firstname + '\', \'' + data[i].middlename + '\', \'' + data[i].lastname + '\', \'' + data[i].course + '\')" class="update" style="background-color: #97BE5A;">Update</button> ';
						htmlString += '<button onclick="removeStudent(' + data[i].idnumber + ')" button class="delete" style="background-color: #EE4E4E;">Delete</button>';
						htmlString += "</tr>";
					}

					staffListInfo.innerHTML = htmlString;
				}

				document.addEventListener("DOMContentLoaded", event =>{
				updateData();
			});

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
					$('#studentRegisterForm').on('submit', function (event) {
						event.preventDefault(); // Prevent the default form submission

						// Create a new AJAX request
						var url = 'studentRegister_Servlet';

						// Prepare the GET request with form data
						var params = $(this).serialize();

						$.ajax({
							url: url,
							type: 'POST',
							contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
							data: params,
							success: function (response) {
								closeModal()
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
											action: function () {
												closeModal()
											}
										}
									}
								});
							},
							error: function (xhr) {
								closeModal()
								$.confirm({
									boxWidth: '30%',
									useBootstrap: false,
									title: 'Encountered an error!',
									content: xhr.responseText,
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


				//delete student
				function removeStudent(id) {
					$.confirm({
						boxWidth: '30%',
						useBootstrap: false,
						type: 'blue',
						typeAnimated: true,
						title: 'Delete student : ' + id + '?',
						content: 'This dialog will automatically trigger \'cancel\' in 10 seconds if you don\'t respond.',
						autoClose: 'cancel|10000',
						buttons: {
							deleteUser: {
								text: 'delete user',
								btnClass: 'btn-red',
								action: function () {
									// Create the AJAX request
									$.ajax({
										url: 'RemoveStudent_Servlet?idNo=' + id, // Replace with your endpoint
										type: 'DELETE', // Send the ID as data
										success: function (response) {
											$.alert({
												boxWidth: '30%',
												useBootstrap: false,
												typeAnimated: true,
												type: 'green',
												title: 'Response',
												content: response
											});
										},
										error: function (xhr) {
											$.alert({
												boxWidth: '30%',
												useBootstrap: false,
												type: 'red',
												typeAnimated: true,
												title: 'error',
												content: xhr.statusText
											});
										}
									});
								}
							},
							cancel: function () {
								$.alert({
									boxWidth: '30%',
									useBootstrap: false,
									typeAnimated: true,
									type: 'red',
									title: 'Canceled',
									content: 'action is canceled'
								});
							}
						}
					});

				}

				//update student
				function updateStudent(id, firstname, middlename, lastname, course) {
					$.confirm({
						type: 'blue',
						boxWidth: '50%',
						boxHeight: '9	0%',
						useBootstrap: false,
						title: 'Update Student : ' + id,
						content: `
							<div class="register-form">
							<form id="studentRegisterForm">
								<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
									<input class="firstname-input" required="required" type="text"
										name="txtFirstname" value="`+ firstname + `"> <label for="firstname"
										class="firstname-label">First name</label>
								</div>
								<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
									<input class="middlename-input" required="required" type="text"
										name="txtMiddlename" value="`+ middlename + `"> <label for="middlename"
										class="middlename-label">Middle name</label>
								</div>

								<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
									<input class="lastname-input" required="required" type="text"
										name="txtLastname" value="`+ lastname + `"> <label for="lastname" class="lastname-label">Last
										name</label>
								</div>

								<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">

									<select name="purpose" class="purpose">
										<option value="`+ course + `" disabled selected hidden>` + course + `</option>
										<option value="BEED">BEED</option>
										<option value="BSHM">BSHM</option>
										<option value="BSIT">BSIT</option>
										<option value="BSTM">BSTM</option>
										<option value="BSED">BSED</option>
										<option value="BSCRIM">BSCRIM</option>
									</select>
								</div>
								<div class="input-container" style="width: 40%; margin: 0 20px 5% 20px;">
									<input id="id-input" class="lastname-input" required="required" type="text"
										name="txtIdnumber" value="`+ id + `"> <label for="lastname" class="lastname-label">Id
										number</label>
								</div>

							</form>
						</div>`,
						buttons: {
							sayMyName: {
								text: 'Update',
								btnClass: 'btn-green',
								action: function () {

									var studentId = this.$content.find('#id-input');
									var firstname = this.$content.find('.firstname-input');
									var middlename = this.$content.find('.middlename-input');
									var lastname = this.$content.find('.lastname-input');
									var courses = this.$content.find('.purpose');

									//no use line
									// var errorText = this.$content.find('.text-danger');

									if (!studentId.val().trim() || !firstname.val().trim() || !lastname.val().trim()) {
										$.alert({
											boxWidth: '30%',
											useBootstrap: false,
											content: "Please don't keep the name field empty.",
											type: 'red'
										});
										return false;
									} else {
										var coursecheck = courses.val() == null ? course : courses.val();
										$.ajax({
											url: 'UpdateStudent_Servlet?idnum=' + id +
												'&inputidnum=' + studentId.val() +
												'&firstname=' + firstname.val() +
												'&middlename=' + middlename.val() +
												'&lastname=' + lastname.val() +
												'&course=' + coursecheck,
											type: 'PUT',
											success: function (response) {
												var successContent = `<h3>Student Number : ` + studentId.val() + `<br>
													Firstname : ` + firstname.val() + `<br>
													Middle : ` + middlename.val() + `<br>
													Lastname : ` + lastname.val() + `<br>
													Course : ` + coursecheck + `</hr>`;

												updateData();
												$.alert({
													boxWidth: '30%',
													useBootstrap: false,
													typeAnimated: true,
													type: 'green',
													title: 'Response : ' + response,
													content: successContent
												});
											},
											error: function (xhr) {
												$.alert({
													boxWidth: '30%',
													useBootstrap: false,
													type: 'red',
													typeAnimated: true,
													title: 'error',
													content: xhr.statusText
												});
											}
										});
									}
								}
							},
							Close: function () {
								// do nothing.
							}
						}
					});
				}

				//searchbutton
				function searchTable() {
					// Declare variables
					var input, filter, table, tr, td, i, j, txtValue;
					input = document.getElementById("searchInput");
					filter = input.value.toLowerCase();
					table = document.getElementById("myTable");
					tr = table.getElementsByTagName("tr");

					// Loop through all table rows, and hide those who don't match the search query
					for (i = 1; i < tr.length; i++) {
						tr[i].style.display = "none"; // Initially hide all rows
						td = tr[i].getElementsByTagName("td");
						for (j = 0; j < td.length; j++) {
							if (td[j]) {
								txtValue = td[j].textContent || td[j].innerText;
								if (txtValue.toLowerCase().indexOf(filter) > -1) {
									tr[i].style.display = ""; // Show the row if any column matches the search
									break;
								}
							}
						}
					}
				}
			</script>

				<div class="load-wrapper">
					<div class="main-loader">
						<div class="box-loader"></div>
					</div>
				</div>
			</body>

		</html>