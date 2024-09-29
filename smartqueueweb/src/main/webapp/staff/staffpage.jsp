<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionStaff}">
			<c:redirect url="/" />
		</c:if>
		
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="./css/loader.css">
			<link rel="stylesheet" href="./css/staffpage.css">
			<title>staff page</title>
		</head>
		<body>
			<div class="container">
				<div class="cover">
					<div class="rightnav">
						<div class="tp-rnav">
							<div class="dash"><b>DASHBOARD</b></div>

							<div class="card-container">
								<div class="card"></div>
								<div class="card"></div>
								<div class="card"></div>
								<div class="card"></div>
							</div>
						</div>

						<div class="b-container"></div>
					</div>
					<div class="leftnav">
                        
						<div class="top-lnav">
							<img src="./images/logo.png" class="cec">
                            <b class="title"><br>Cebu Eastern College</b>
						</div>
						<!-- staff profile -->
						<button class="button-profile"><img src="./images/profile.png" alt=""
								class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt=""
								class="caretdown"></button>
						<div class="staffProfile" id="staffProfile">
							<a href="#">Settings</a>
							<a href="login">Signout</a>
						</div>
						<div class="bottom-lnav">
							<div class="dropdown">
								<h3>QUEUEING</h3>
								<div class="dropdown-content">
									<a href="userwindow">User Window</a>
									<a href="counterwindow">Counter Window</a>
								</div>
							</div>
							<div class="dropdown">
								<h3>ENTERTAINMENT</h3>
								<div class="dropdown-content">
									<a href="staff/entertainment.jsp">Advertisement</a>
									<a href="staff/entertainment.jsp" class="video-link">Add Video</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				document.addEventListener("DOMContentLoaded", function () {
					var dropdownButton = document.querySelector(".button-profile");
					var staffProfile = document.getElementById("staffProfile");

					staffProfile.style.display = "none";

					dropdownButton.addEventListener("click", function () {
						if (staffProfile.style.display === "block") {
							staffProfile.style.display = "none";
						} else {
							staffProfile.style.display = "block";
						}
					});
				});

				    //delete staff
					function removeStaff(id) {
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
                                                        title: 'Canceled',
                                                        content: 'action is canceled'
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
			</script>






			<!-- <h1>
				Welcome staff
				<c:out value="${sessionStaff.getUsername()}"></c:out>
			</h1> -->

			<!-- <form action=login method=get>
				<input type="submit" value="logout">
			</form> -->

			<div class="load-wrapper">
				<div class="main-loader">
					<div class="box-loader">
					</div>
				</div>
			</div>
		</body>

		</html>