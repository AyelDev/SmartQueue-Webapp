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
			<style>
                :root {
                    font-size: 16px;
                }
        
                * {
                    margin: 0;
                    padding: 0;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                }
        
                .container {
                    width: 100%;
                    height: 100vh;
                    background-color: white;
                    overflow: hidden;
                }
        
                .cover {
                    width: 100%;
                    height: 100%;
                    background-color: white;
                }
        
                .rightnav {
                    width: 85%;
                    height: 100%;
                    background-color: transparent;
                    float: right;
                }
        
                .tp-rnav {
                    width: 100%;
                    height: 40%;
                    background-color: transparent;
                    display: flex;
                    flex-direction: column;
                }
        
                .dash {
                    width: 20%;
                    height: 15%;
                    background-color: transparent;
                    text-align: center;
                    font-size: 1.5625rem;
                    display: inline-block;
                    position: relative;
                    color: black;
                    margin-bottom: 1.25rem;
                }
        
                .card-container {
                    width: 100%;
                    height: 73%;
                    background-color: transparent;
                    display: flex;
                    justify-content: space-evenly;
                    flex-wrap: wrap;
                }
        
                .card {
                    width: 20%;
                    height: 95%;
                    background-color: #ADDFFF;
                    box-sizing: border-box;
                    margin-top: 0.3125rem;
                    border: 0.125rem solid blue;
                    border-radius: 1.875rem;
                    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
                }
        
                .card:hover {
                    background-color: #00BFFF;
                }
        
                .b-container {
                    width: 80%;
                    height: 50%;
                    background-color: #ADDFFF;
                    justify-content: center;
                    align-items: center;
                    display: flex;
                    margin-top: 1.875rem;
                    margin-left: 7.5rem;
                    border-radius: 1.875rem;
                    border: 0.125rem solid blue;
                    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
                }
        
                .b-container:hover {
                    background-color: #00BFFF;
                }
        
                .leftnav {
                    width: 15%;
                    height: 100%;
                    background-color: #5CB3FF;
                    color: white;
                }
        
                .top-lnav {
                    width: 100%;
                    height: 20%;
                    background-color: #5CB3FF;
                    text-align: center;
                    display: block;
                    position: relative;
                    line-height: 10px;
                    font-size: 0.875rem;
                    color: white;
                }
        
                .cec {
                    width: 50%;
                    max-width: 100%;
                    object-fit: contain;
                    margin-top: 15px;
                    margin-bottom: 5px;
                }
        
                .title {
                    color: #F6F4EB;
                    font-size: 1.15em;
                }
        
                .bottom-lnav {
                    width: 100%;
                    height: 80%;
                    background-color: transparent;
                    text-align: center;
                    padding-top: 2rem; 
                }
        
                .bottom-lnav a {
                    display: block;
                    margin: 1rem 0;
                    color: white;
                    text-decoration: none;
                    font-size: 1.2rem;
                    transition: color 0.3s ease;
                    /* line-height: 60px; */
                    margin-top: 60px;
                    text-align: center;
                    justify-content: center;
                    align-items: center;
                }
        
                .bottom-lnav a:hover {
                    padding: 5px 10px;
                    background-color: white;
                    position: relative;
                    left: 20px;
                    color: black; 
                    border-radius: 30px;
                    transition-timing-function:cubic-bezier(0.445, 0.05, 0.55, 0.95);
                }
        
                .button-profile {
                    align-items: center;
                    justify-content: center;
                    display: flex;
                    width: 10vw;
                    text-align: center;
                    margin-top: auto;
                    margin-left: 1.875rem;
                    border-radius: 0.625rem;
                    padding: 0.9375rem 0.625rem;
                }
        
                .profile {
                    width: 10%;
                    object-fit: scale-down;
                    margin-right: 1.25rem;
                }
        
                .caretdown {
                    mix-blend-mode: multiply;
                    width: 0.625rem;
                    margin-left: 1.25rem;
                }
                .staffProfile a {
				text-decoration: none;
				color: white;
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
                margin-left: 30px;
			}

			.staffProfile a:hover {
				background-color: lightgrey;
				border-radius: 7px;
                color: black;
			}
        
                @media (max-width: 1200px) {
                    :root {
                        font-size: 15px;
                    }
                }
        
                @media (max-width: 768px) {
                    :root {
                        font-size: 14px;
                    }
                }
        
                @media (max-width: 480px) {
                    :root {
                        font-size: 13px;
                    }
        
                    .button-profile {
                        width: 50vw;
                    }
        
                    .card {
                        width: 90%;
                    }
        
                    .dash {
                        font-size: 1.2rem;
                    }
        
                    .bottom-lnav a {
                        font-size: 1rem; 
                    }
                }
            </style>
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
                        <button class="button-profile"><img src="./images/profile.png" alt="" class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt="" class="caretdown"></button>
                        <div class="staffProfile" id="staffProfile">
                            <a href="#">Settings</a>
                            <a href="logout">Signout</a>
                        </div>
                        <div class="bottom-lnav">
                            <b><a href="userwindow">User Window</a></b>
                            <b><a href="counterwindow">Counter Window</a></b>
                            <b><a href="staff/entertainment.jsp">Advertisement</a></b>
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
				Welcome staff
				<c:out value="${sessionStaff.getUsername()}"></c:out>
			</h1> -->

			<!-- <form action=login method=get>
				<input type="submit" value="logout">
			</form> -->

			
		</body>

		</html>