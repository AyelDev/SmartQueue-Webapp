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
			<script type="text/javascript" src="./scripts/ping.js"></script>
			<link rel="stylesheet" type="text/css" href="./css/jquery-confirm.min.css" />
			<script type="text/javascript" src="./scripts/jquery-confirm.min.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="./css/loader.css">
			<title>Admin | List of Staff</title>
		</head>
		<style>
			@import url('./admin/fonts.css');

			:root {
				--primary-color: #1e91d0;
				--secondary-color: #00509d;
				--body-fonts: "Roboto Condensed", sans-serif;
				--background-color: #f4f4f9;
				--select-text-color: #B4B4B8;
				--text-color: #3D3C42;
				font-optical-sizing: auto;
				font-style: normal;
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
				background-color: var(--background-color);
				align-items: center;
				justify-content: center;
				margin-top: 3%;
			}


			/*Navbar section*/
			.navbar {
				width: 15vw;
				height: 100vh;
				background-image: linear-gradient(90deg, #1e91d0 15%, #1477d4fb 100%);
				position: fixed;
				justify-content: center;
				align-items: center;
				left: 0;
				float: left;
				margin-top: -3%;
			}

			.logoContainer {
				width: 100%;
				text-align: center;
			}

			.logo {
				width: 50%;
				max-width: 100%;
				object-fit: contain;
				margin-top: 50px;
			}

			.title {
				color: var(--background-color);
				font-size: 0.8em;
			}

			/* menu */
			.menu-navbar {
				margin-top: 3rem;
				display: flex;
				flex-direction: column;
			}

			.dropdown {
				position: relative;
				display: inline-block;
			}

			.dropdown-dashboard {
				display: none;
				position: absolute;
				background-color: var(--background-color);
				width: 120px;
				top: 100%;
				left: 70%;
				z-index: 3;
				box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
				border-radius: 4px;
				padding: 10px;
				overflow-x: hidden;
			}

			.dropdown-dashboard a {
				display: flex;
				text-decoration: none;
				color: black;
				text-align: center;
				align-items: center;
				justify-content: center;
				font-size: 11px;
				flex-direction: column;
				padding: 10px;
				position: relative;
				z-index: 3;
			}

			.dropdown-dashboard a:hover {
				background-color: var(--select-text-color);
				border-radius: 4px;
				color: black;
				border-radius: 4px;
				padding: 10px;
				width: 120px;
				margin-left: -7.2%;
			}

			.dropdown-btn {
				background: none;
				display: flex;
				align-items: center;
				width: 14.3vw;
				height: 8vh;
				border: 0;
				font-size: 15px;
				border-radius: 16px 0 0 16px;
				padding-right: 60px;
				margin-left: 10px;
				cursor: pointer;
				position: relative;
				color: #F6F4EB;
				margin-top: 5%;
			}

			.dropdown-btn:hover {
				height: 8vh;
			}

			.dropdown-btn:hover svg,
			.dropdown-btn.active svg {
				fill: var(--text-color);
				color: black;
			}

			.dropdown-btn:hover .counter-icon,
			.dropdown-btn:hover .entertainment-icon,
			.dropdown-btn.active .counter-icon,
			.dropdown-btn.active .entertainment-icon {
				stroke: var(--text-color);
			}

			.dropdown-btn.active a {
				color: var(--text-color);
			}

			.dropdown-btn::after {
				content: '';
				border-radius: 50%;
			}

			.dropdown-btn a {
				text-decoration: none;
				color: #F6F4EB;
			}

			.dropdown-btn a:hover {
				color: black;
				font-weight: bold;
			}

			.dropdown:hover .dropdown-dashboard {
				display: block;

			}

			.dropdown {
				color: var(--background-color);
			}

			.dropdown:hover,
			.dropdown:hover a {
				color: black;
				font-weight: bold;
			}

			.dropdown-btn a:hover,
			.dropdown-btn:hover,
			.active {
				color: var(--text-color);
				font-weight: bold;
			}

			.active,
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
				width: 20px;

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

			/* Dashboard */
			.stafflist-section {
				width: 85vw;
				background-color: var(--background-color);
				float: right;
				margin-left: 15%;
				align-items: center;
				display: flex;
				justify-content: center;
				height: 100vh;
			}

			.dashboard-section h1 {
				color: var(--text-color);
				font-size: 2rem;
				margin-top: -35%;
				margin-left: -60%;
				position: absolute;

			}

			.dashboard-head {
				width: 86vw;
				margin-left: 2.2%;
				height: 7%;
				background-color: #1477d4fb;
				position: fixed;
				top: 0;
				z-index: 1000;
			}

			.icon-container {
				width: 5%;
				height: 100%;
				margin-left: 68%;
			}

			.bell-icon {
				object-fit: scale-down;
				width: 20px;
				margin-top: -7%;
				cursor: pointer;

			}

			.chat-icon {
				object-fit: scale-down;
				width: 25px;
				cursor: pointer;
				margin-bottom: 25%;
				margin-left: 10%;
			}

			.button-profile {
				align-items: center;
				justify-content: center;
				display: flex;
				width: 10vw;
				margin-top: -5.5%;
				margin-left: 84%;
				border-radius: 10px;
				padding: 15px 10px 15px 10px;
				/*tlbr*/
				overflow: hidden;
				cursor: pointer;
				border: none;
				background: none;
				color: white;
			}

			.profile {
				width: 20px;
				object-fit: scale-down;
				margin-right: 10px;
			}

			.caretdown {
				width: 20px;
				margin-left: 5px;
			}

			.adminProfile {
				margin-left: 84%;
				position: absolute;
				background-color: white;
				width: 8vw;
				align-items: center;
				justify-content: center;
				text-align: center;
				z-index: 1;
				display: none;
				border-radius: 7px;
				margin-top: -.1%;
			}

			.button-profile.active {
				background-color: #d5deef;
				color: #333;
				width: 9%;
				height: 5%;
				margin-top: -3%;
			}

			.button-profile.active svg {
				fill: var(--text-color);
				stroke: var(--text-color);
			}

			.adminProfile.show {
				display: flex;
				flex-direction: column;
			}

			.adminProfile a {
				text-decoration: none;
				color: var(--text-color);
				overflow: hidden;
				width: 8vw;
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
				border-radius: 7px;
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
				margin-top: -23%;
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
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round">
									</g>
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
							<div class="dropdown-dashboard">
								<a href="counterlist">List of Counter</a>
							</div>
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
							<button class="dropdown-btn"><svg class="entertainment-icon" width="64px" height="64px"
									viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none">
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round">
									</g>
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
								<a href="counterwindow">Counter Window</a>
							</div>
						</div>
					</div>
				</div>
				<div class="stafflist-section">
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
					<div class="stafflist-content">
						<button class="add-account-btn"> <img src="./images/add-account.png" alt=""
								class="add-account-icon"> Add Staff</button>
						<h1>Staff List</h1>
						<div class="search-container">
							<input type="text" placeholder="Search.." name="search" class="search-bar" id="searchInput"
								onkeyup="searchTable()">
							<button class="search-btn" type="submit"><img src="./images/search-icon.png" alt=""
									class="search-icon">
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
											name="txtContactno" maxlength="11">
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


						<table id="myTable">
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
						request.open('GET', '/JsonStaffListAPI');
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

							htmlString += '<tr>' +
								'<td>' + data[i].staffID + '</td>' +
								'<td>' + data[i].firstname + ' ' + data[i].lastname + '</td>' +
								'<td>' + data[i].contactNumber + '</td>' +
								'<td>' + data[i].email + '</td>' +
								'<td>' + data[i].username + '</td>' +
								'<td>' + data[i].password + '</td>' +
								'<td>' + (data[i].isLocked === 1 ? "Locked" : "Not Locked") + '</td>' +
								'<td><button onclick="updateStaff(' + data[i].staffID + ', \'' + data[i].firstname + '\', \'' + data[i].lastname + '\', \'' + data[i].username + '\', \'' + data[i].contactNumber + '\', \'' + data[i].email + '\', \'' + data[i].password + '\', \'' + data[i].isLocked + '\')" class="update" style="background-color: #97BE5A; font-size: .7em;">Update</button>' +
								'<button onclick="removeStaff(' + data[i].staffID + ')" class="delete" style="background-color: #EE4E4E; font-size: .7em;">Delete</button></td>' +
								'</tr>';




							// htmlString += "<tr>";
							// htmlString += "<td>" + data[i].staffID + "</td>";
							// htmlString += "<td>" + data[i].firstname + " " + data[i].lastname + "</td>";
							// htmlString += "<td>+63" + data[i].contactNumber + "</td>";
							// htmlString += "<td>" + data[i].email + "</td>";
							// htmlString += "<td>" + data[i].username + "</td>";
							// htmlString += "<td>" + data[i].password + "</td>";
							// htmlString += "<td>" + (data[i].isLocked === 1 ? "Locked" : "Not Locked") + "</td>";
							// htmlString += '<td><button onclick="updateStaff(' + data[i].staffID + ', \'' + data[i].firstname + '\')" class="update" style="background-color: #97BE5A; font-size: .7em;">Update</button></td>';
							// htmlString += '<button onclick="removeStaff(' + data[i].staffID + ')" class="delete" style="background-color: #EE4E4E; font-size: .7em;">Delete</button>';
							// htmlString += "</tr>";
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
												action: function () {
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

					//delete staff
					function removeStaff(id) {
						$.confirm({
							boxWidth: '30%',
							useBootstrap: false,
							type: 'blue',
							typeAnimated: true,
							title: 'Delete staff : ' + id + '?',
							content: 'This dialog will automatically trigger \'cancel\' in 10 seconds if you don\'t respond.',
							autoClose: 'cancel|10000',
							buttons: {
								deleteUser: {
									text: 'delete',
									btnClass: 'btn-red',
									action: function () {
										// Create the AJAX request
										$.ajax({
											url: 'RemoveStaff_Servlet?idNo=' + id, // Replace with your endpoint
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
												updateData();
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


					function updateStaff(id, firstname, lastname, username, contactnumber, email, password, islocked) {
						$.confirm({
							type: 'blue',
							boxWidth: '50%',
							useBootstrap: false,
							title: 'Update Staff : ' + id,
							content: `
								<div class="register-form">
								<form id="staffRegisterForm">
									<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
										<input class="firstname-input" required="required" type="text"
											name="txtFirstname" value="`+ firstname + `">
										<label for="firstname" class="firstname-label">First name</label>
									</div>
									<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
										<input class="lastname-input" required="required" type="text"
											name="txtLastname" value="`+ lastname + `">
										<label for="lastname" class="lastname-label">Last name</label>
									</div>

									<div class="input-container full-width" style="width: 40%; margin: 0 20px 0 20px;">
										<input class="username-input" required="required" type="text"
											name="txtUsername" value="`+ username + `">
										<label for="username" class="username-label">Username</label>
									</div>

									<div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
										<input class="contactno-input" required="required" type="text"
											name="txtContactno" value="`+ contactnumber + `" maxlength="11">
										<label for="contactno" class="contactno-label">Contact no.</label>
									</div>

									<div class="input-container" style="width: 91%; margin-left: 20px;">
										<input class="email-input" required="required" type="text" name="txtEmail" value="`+ email + `">
										<label for="email" class="email-label">Email</label>
									</div>

									
									<div class="input-container" style="width: 91%; margin-left: 20px;">
										<input class="password-input" required="required" type="password" name="txtPassword" value="`+ password + `">
										<label for="password" class="password-label">Password</label>
									</div>

									<div class="input-container" style="width: 91%; margin: 0 20px 5% 20px;">
										<input class="confirmpassword-input" required="required" type="password" name="txtConfirmpassword" value="`+ password + `">
										<label for="confirmpassword" class="confirmpassword-label">Confirm Password</label>
									</div>	

									<div class="input-container" style="width: 91%; margin: 0 20px 5% 20px;">
										<input class="checkbox-input" required="required" type="checkbox" name="txtConfirmpassword" `+ (islocked == 1 ? "checked" : "") + `>
										<label for="confirmpassword" class="confirmpassword-label">Lock Staff</label>
									</div>	
								</form>
							</div>
								`,
							buttons: {
								sayMyName: {
									text: 'Update',
									btnClass: 'btn-green',
									action: function () {

										var firstname = this.$content.find('.firstname-input');
										var lastname = this.$content.find('.lastname-input');
										var email = this.$content.find('.email-input');
										var contactno = this.$content.find('.contactno-input');
										var username = this.$content.find('.username-input');
										var password = this.$content.find('.password-input');
										var confirmpassword = this.$content.find('.confirmpassword-input');
										var checkbox = this.$content.find('.checkbox-input').is(':checked') ? 1 : 0;
										if (!firstname.val().trim() || !lastname.val().trim() || !email.val().trim() || !contactno.val().trim() || !username.val().trim() || !password.val().trim() || !confirmpassword.val().trim()) {
											$.alert({
												boxWidth: '30%',
												useBootstrap: false,
												content: "Please don't keep the field empty.",
												type: 'red'
											});
											return false;
										} else {

											if (password.val() != confirmpassword.val()) {
												$.alert({
													boxWidth: '30%',
													useBootstrap: false,
													content: "password and confirm password does not match.",
													type: 'red'
												});
												return false;
											} else {

												$.ajax({
													url: 'UpdateStaff_Servlet?idNo=' + id + '&firstname=' + firstname.val() + '&lastname=' + lastname.val() + '&email=' + email.val() + '&contactno=' + contactno.val() + '&username=' + username.val() + '&password=' + password.val() + '&islocked=' + checkbox, // Replace with your endpoint
													type: 'PUT', // Send the ID as data
													success: function (response) {
														var ischecked = checkbox == 1 ? "Locked" : "Not Locked";
														var successContent = `<h3>Name: ` + firstname.val() + `<br>
																Lastname: ` + lastname.val() + `<br>
																Username: ` + username.val() + `<br>
																Contact Number: ` + contactno.val() + `<br>
																Email: ` + email.val() + `<br>
																Password: `+ password.val() + `<br>
																Restriction: `+ ischecked + `</h3>`;

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