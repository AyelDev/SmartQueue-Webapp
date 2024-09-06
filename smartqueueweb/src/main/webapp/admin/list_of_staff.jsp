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
					

				</table>

			</div>
			
			


			<script>
			var staffListInfo = document.getElementById("tablelist");

			function updateData(){	
			    var request = new XMLHttpRequest();
			    request.open('GET', 'http://localhost:8080/smartqueueweb/JsonStaffListAPI');
			    request.onload = function(){
			        var data = JSON.parse(request.responseText);
			        renderHTML(data);
			    }
			    request.send();
			}

			function renderHTML(data){
			    var htmlString = `<tr>
					<th>Id No.</th>
					<th>Name</th>
					<th>Contact no.</th>
					<th>Email</th>
					<th>Username</th>
					<th>Password</th>
					<th>Restriction</th>
					<th>Actions</th>
				</tr>`;
			    
			    for(var i = 0; i < data.length; i++){
			    	
			    	htmlString += "<tr>";
			        htmlString += "<td>" + data[i].staffID + "</td>";
			        htmlString += "<td>" + data[i].firstname + "</td>";
			        htmlString += "<td>" + data[i].contactNumber + "</td>";
			        htmlString += "<td>" + data[i].email + "</td>";
			        htmlString += "<td>" + data[i].username + "</td>";
			        htmlString += "<td>" + data[i].password + "</td>";
			        htmlString += "<td>" + (data[i].isLocked === 1 ? "Locked" : "Not Locked") + "</td>";
			        htmlString += '<td><button class="update" style="background-color: #97BE5A;">Update</button>';	
			        htmlString += '<button class="delete" style="background-color: #EE4E4E;">Delete</button>';
			        htmlString += "</tr>";
			    }
			    
			    staffListInfo.innerHTML = htmlString; // Corrected to set htmlString, not updateData
			}

			setInterval(updateData, 1500);
			
			</script>

			<div class="load-wrapper">
				<div class="main-loader">
					<div class="box-loader">
					</div>
				</div>
			</div>
		</body>

		</html>