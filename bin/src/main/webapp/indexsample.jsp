<%-- Document : index Created on : Jun 11, 2020, 7:06:53 PM Author : Learn new here --%>

	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>JSP Page</title>
				<style media="screen" type="text/css">
					.chat {
						width: 100%;
						height: 200px;
						border: 1px solid silver;
						overflow-y: scroll;
					}

					#msg {
						width: 99%;
					}

					h1 {
						text-align: center;
					}
				</style>
			</head>
			<script type="text/javascript">

				function getcookieAuth() {
					let authCookieValue = document.cookie
						.split('; ')
						.find(row => row.startsWith('_auth='))
						?.split('=')[1];

					return authCookieValue || null; // Return null if the cookie doesn't exist
				}

				var wsUrl;
				if (window.location.protocol == 'http:') {
					wsUrl = 'ws://';
				} else {
					wsUrl = 'wss://';
				}
				var ws = new WebSocket(wsUrl + window.location.host + "/smartqueueweb/chat");

				ws.onmessage = function (event) {
					var mySpan = document.getElementById("chat");
					mySpan.innerHTML += event.data + "<br/>";
				};

				ws.onerror = function (event) {
					console.log("Error ", event);
				};

				function sendMsg() {
					var msg = document.getElementById("msg").value;
					if (msg) {
						ws.send(getcookieAuth() + ": " + msg);
					}
					document.getElementById("msg").value = "";
				}

			</script>

			<body>
				<h1>Live Chat updates</h1>

				<c:choose>
			
					<c:when test="${not empty sessionAdmin.username}">
						<p id="welcome">
							<c:out value="${sessionAdmin.username}" />
						</p>
					</c:when>

				
					<c:otherwise>
						<p id="welcome">
							<c:out value="${sessionStaff.username}" />
						</p>
					</c:otherwise>
				</c:choose>
				<div>
					<div id="chat" class="chat"></div>
					<div>
						<input type="text" name="msg" id="msg" placeholder="Enter message here" />
						<button onclick="return sendMsg();">Enter</button>
					</div>
				</div>
			</body>

			</html>