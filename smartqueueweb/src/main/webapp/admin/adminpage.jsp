<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionAdmin.getUsername()}">
			<c:redirect url="/" />
		</c:if>
		<!DOCTYPE html>
		<head>
			<meta charset="UTF-8">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<title>Admin Page</title>
		</head>

		<body>
			<style>
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

				.total-video,
				.total-counter,
				.total-student,
				.total-staff {
					color: #EEEDEB;
					border-radius: 25px;
					width: 20vw;
					height: 20vh;
					display: flex;
					margin: 70px;
					margin-top: -30%;
					justify-content: center;
					align-items: center;

				}

				.total-staff:hover,
				.total-counter:hover,
				.total-student:hover,
				.total-video:hover {
					width: 30vw;
				}

				.total-counter {
					background: linear-gradient(90deg, rgba(0, 41, 107, 1) 5%, rgba(119, 182, 234, 1) 94%);
				}

				.total-video {
					background: linear-gradient(0deg, rgba(0, 41, 107, 1) 16%, rgba(119, 182, 234, 1) 100%);

				}

				.total-student {
					background: radial-gradient(circle, rgba(119, 182, 234, 1) 0%, rgba(0, 41, 107, 1) 100%);
				}

				.total-staff {
					background: linear-gradient(0deg, rgba(119, 182, 234, 1) 15%, rgba(0, 41, 107, 1) 100%);
				}

				.graph {
					width: 76vw;
					height: 60vh;
					background-color: #7D7C7C;
					display: flex;
					align-items: center;
					justify-content: center;
					position: absolute;
					border-radius: 25px;
					bottom: 5%;
					opacity: .5;
				}

				.totals {
					width: 78vw;
					height: 40vh;
					display: flex;
					align-items: center;
					justify-content: space-evenly;
					background-color: aqua;
					margin-top: -30%;
				}

				.main-container .title-page {
					display: flex;
					position: absolute;
					margin-top: -43%;
					margin-left: -70%;
				}

				.fa-video-camera {
					font-size: 30px;
					text-align: center;
					align-items: center;
					justify-content: center;
					display: flex;
				}

				.userpng {
					width: auto;
					height: 30px;
					color: #F1F6F9;

				}
			</style>
			<div class="container">
				<div class="navbar">
					<div class="admintxt"><b>
							Welcome
							<c:out value="${admin}"></c:out>
							<c:out value="${sessionScope.sessionAdmin.getUsername()}"></c:out>
						</b></div>
					<div class="menu-navbar">
						<a href="adminpage.jsp" class="dropdown-menu">Dashboard</a>

						<button class="dropdown-menu">Counter<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-dashboard">
							<a href="#">add window</a><br>
							<a href="list_of_counter.jsp">list of counter</a>
						</div>
						<button class="dropdown-menu">User<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-dashboard">
							<a href="#">add student info</a><br>
							<a href="#">add staff account</a><br>
							<a href="list_of_student.jsp">list of student info</a><br>
							<a href="list_of_staff.jsp">list of staff</a>
						</div>
						<button class="dropdown-menu">Entertainment<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-dashboard">
							<a href="#">advertisement</a><br>
							<a href="#">add video</a>
						</div>
						<button class="dropdown-menu">Display<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-dashboard">
							<a href="user/userinquiry.jsp">user inquiry</a><br>
							<a href="#">user window</a><br>
							<a href="#">counter window</a>
						</div>
						<form action=logout_Servlet method=get>
							<input type="submit" value="Logout" class="dropdown-menu">
						</form>
					</div>

				</div>
				<div class="main-container">
					<b class="title-page">Dashboard</b>

					<div class="total-staff"><svg xmlns="http://www.w3.org/2000/svg" height="40" width="40"
							viewBox="0 0 576 512">
							<path fill="#ffffff"
								d="M512 80c8.8 0 16 7.2 16 16V416c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V96c0-8.8 7.2-16 16-16H512zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM208 256a64 64 0 1 0 0-128 64 64 0 1 0 0 128zm-32 32c-44.2 0-80 35.8-80 80c0 8.8 7.2 16 16 16H304c8.8 0 16-7.2 16-16c0-44.2-35.8-80-80-80H176zM376 144c-13.3 0-24 10.7-24 24s10.7 24 24 24h80c13.3 0 24-10.7 24-24s-10.7-24-24-24H376zm0 96c-13.3 0-24 10.7-24 24s10.7 24 24 24h80c13.3 0 24-10.7 24-24s-10.7-24-24-24H376z" />
						</svg></div>
					<div class="total-counter"><svg xmlns="http://www.w3.org/2000/svg" height="40" width="40"
							viewBox="0 0 512 512">
							<path fill="#ffffff"
								d="M64 0C46.3 0 32 14.3 32 32V96c0 17.7 14.3 32 32 32h80v32H87c-31.6 0-58.5 23.1-63.3 54.4L1.1 364.1C.4 368.8 0 373.6 0 378.4V448c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V378.4c0-4.8-.4-9.6-1.1-14.4L488.2 214.4C483.5 183.1 456.6 160 425 160H208V128h80c17.7 0 32-14.3 32-32V32c0-17.7-14.3-32-32-32H64zM96 48H256c8.8 0 16 7.2 16 16s-7.2 16-16 16H96c-8.8 0-16-7.2-16-16s7.2-16 16-16zM64 432c0-8.8 7.2-16 16-16H432c8.8 0 16 7.2 16 16s-7.2 16-16 16H80c-8.8 0-16-7.2-16-16zm48-168a24 24 0 1 1 0-48 24 24 0 1 1 0 48zm120-24a24 24 0 1 1 -48 0 24 24 0 1 1 48 0zM160 344a24 24 0 1 1 0-48 24 24 0 1 1 0 48zM328 240a24 24 0 1 1 -48 0 24 24 0 1 1 48 0zM256 344a24 24 0 1 1 0-48 24 24 0 1 1 0 48zM424 240a24 24 0 1 1 -48 0 24 24 0 1 1 48 0zM352 344a24 24 0 1 1 0-48 24 24 0 1 1 0 48z" />
						</svg></div>
					<div class="total-student"><svg xmlns="http://www.w3.org/2000/svg" height="40" width="45"
							viewBox="0 0 640 512">
							<path fill="#ffffff"
								d="M211.2 96a64 64 0 1 0 -128 0 64 64 0 1 0 128 0zM32 256c0 17.7 14.3 32 32 32h85.6c10.1-39.4 38.6-71.5 75.8-86.6c-9.7-6-21.2-9.4-33.4-9.4H96c-35.3 0-64 28.7-64 64zm461.6 32H576c17.7 0 32-14.3 32-32c0-35.3-28.7-64-64-64H448c-11.7 0-22.7 3.1-32.1 8.6c38.1 14.8 67.4 47.3 77.7 87.4zM391.2 226.4c-6.9-1.6-14.2-2.4-21.6-2.4h-96c-8.5 0-16.7 1.1-24.5 3.1c-30.8 8.1-55.6 31.1-66.1 60.9c-3.5 10-5.5 20.8-5.5 32c0 17.7 14.3 32 32 32h224c17.7 0 32-14.3 32-32c0-11.2-1.9-22-5.5-32c-10.8-30.7-36.8-54.2-68.9-61.6zM563.2 96a64 64 0 1 0 -128 0 64 64 0 1 0 128 0zM321.6 192a80 80 0 1 0 0-160 80 80 0 1 0 0 160zM32 416c-17.7 0-32 14.3-32 32s14.3 32 32 32H608c17.7 0 32-14.3 32-32s-14.3-32-32-32H32z" />
						</svg></i></div>
					<div class="total-video"><i class="fa fa-video-camera"></i></div>

					<div class="graph"></div>
				</div>
			</div>



			<!-- <h1>
					Welcome
					<c:out value="${admin}"></c:out>
					<c:out value="${sessionScope.sessionName}"></c:out>
				</h1>


				<form action=logout_Servlet method=get>
					<input type="submit" value="logout">
				</form>

				
		 -->


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
			</script>
		</body>

		</html>