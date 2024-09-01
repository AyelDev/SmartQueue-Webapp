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
			<script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="./css/loader.css">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<title>List of Staff</title>
		</head>

		<body>
			<style>
				/* superlightblue - #DFF5FF
        light blue - 77B6EA
        dark blue - 00296B
        red - EE4E4E
        white - FFFFFF */
				* {
					margin: 0;
					padding: 0;
				}

				body {
					font-family: Verdana, Geneva, Tahoma, sans-serif;
					width: 100vw;
					height: 100vh;
					margin: 0;
					overflow: hidden;
				}

				.main-container {
					background-color: #F1F6F9;
					width: 85vw;
					height: 100vh;
					display: flex;
					align-items: center;
					justify-content: center;
					float: right;
				}

				.navbar {
					background-color: #EEEDEB;
					width: 16vw;
					height: 100vh;
					align-items: center;
					justify-content: center;
					position: fixed;
					z-index: 1;
					top: 0;
					left: 0;
					overflow-x: hidden;
				}

				.admintxt {
					text-align: center;
					align-items: center;
					display: flex;
					justify-content: center;
					padding: 20px;
					background-color: #77b6ea;
					border-style: ridge;
				}

				.menu-navbar {
					justify-content: space-evenly;
					align-items: center;
					text-align: center;
					line-height: 4;
					margin-top: 40%;
				}

				.menu-navbar,
				.dropdown-menu,
				.dropdown-menu a {
					text-decoration: none;
					background: none;
					outline: none;
					border: none;
					cursor: pointer;
					font-size: 18px;
					flex-direction: column;
					align-items: center;
					justify-content: center;
					display: block;
					padding: 3px 30px 10px 10px;
					text-align: center;
					margin: 3px;
					color: #7D7C7C;
				}

				.dropdown-menu:hover {
					color: #191717;
				}

				.dropdown-dashboard {
					display: none;
					padding: 2px;
					background-color: #B4B4B3;
					text-decoration: none;
					font-size: 10px;
					width: 100%;
					height: auto;
				}

				.dropdown-dashboard a {
					text-decoration: none;
					color: #ffff;
					padding: 10px;
				}

				.dropdown-dashboard a:hover {
					background-color: #D0D4CA;
					color: #191717;
				}

				.fa-caret-down {
					float: right;
					padding-left: 20%;
					position: absolute;
					left: 60%;
				}

				.title-page {
					display: flex;
					position: absolute;
					margin-top: -43%;
					margin-left: -70%;
				}

				.counter-list {
					font-family: Verdana, Geneva, Tahoma, sans-serif;
					width: 70vw;
					border-collapse: collapse;
					margin-top: -40%;
					font-size: 15px;
					text-align: center;
				}

				.counter-list td,
				.counter-list th {
					border: 1px solid #7D7C7C;
				}

				.counter-list th {
					background-color: #77B6EA;
				}

				.counter-list tr:hover {
					background-color: #DFF5FF;
				}
			</style>

			<div class="container">
				<div class="navbar">
					<div class="admintxt">
						<b>Admin</b>
					</div>
					<div class="menu-navbar">
						<a href="adminpage.jsp" class="dropdown-menu">Dashboard</a>

						<button class="dropdown-menu">
							Counter<i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-dashboard">
							<a href="#">add window</a><br> <a href="list_of_counter.jsp">list
								of counter</a>
						</div>
						<button class="dropdown-menu">
							User<i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-dashboard">
							<a href="#">add student info</a><br> <a href="#">add staff
								account</a><br> <a href="list_of_student.jsp">list of student
								info</a><br> <a href="http://localhost:8080/smartqueueweb/StaffList_Servlet">list
								of staff</a>
						</div>
						<button class="dropdown-menu">
							Entertainment<i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-dashboard">
							<a href="#">advertisement</a><br> <a href="#">add video</a>
						</div>
						<button class="dropdown-menu">
							Display<i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-dashboard">
							<a href="user/userinquiry.jsp">user inquiry</a><br> <a href="#">user window</a><br> <a
								href="#">counter window</a>
						</div>
						<form action="logout_Servlet">
							<button class="dropdown-menu">Logout</button>
						</form>


					</div>

				</div>
			</div>

			<div class="main-container">
				<b class="title-page">List of Staff</b>

				<table class="counter-list" id="tablelist">

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
					<c:forEach var="staff" items="${stafflists}">
						<tr>
						<tr>
							<td>${staff.staffID}</td>
							<td>${staff.firstname} ${staff.lastname}</td>
							<td>${staff.contactNumber}</td>
							<td>${staff.email}</td>
							<td>${staff.username}</td>
							<td>${staff.password}</td>
							<td>${staff.isLocked == 1 ? 'Locked' : 'Unlocked'}</td>
							<td><button class="update" style="background-color: #97BE5A;">Update</button>
								<button class="delete" style="background-color: #EE4E4E;">Delete</button>
							</td>
						</tr>
					</c:forEach>



				</table>

			</div>

			<a hidden="true" id="requestLink" href="http://localhost:8080/smartqueueweb/StaffList_Servlet">REQUEST</a>

			<script>
				var dropdown = document.getElementsByClassName("dropdown-menu");
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

				function clickLink() {
					document.getElementById('requestLink').click();
				}

				setInterval(clickLink, 10000); // 2000 milliseconds = 2 seconds

			</script>

			<div class="load-wrapper">
				<div class="main-loader">
					<div class="box-loader">
					</div>
				</div>
			</div>
		</body>

		</html>