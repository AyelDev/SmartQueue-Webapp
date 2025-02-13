<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:set var="statusCode" value="${requestScope['javax.servlet.error.status_code']}" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<link rel="icon" type="image/x-icon" href="./images/logo.png">
			<title>Error <c:out value="${requestScope['javax.servlet.error.status_code']}" default="N/A"></c:out>
			</title>
			<style>
				* {
					transition: all 0.6s;
				}

				html {
					height: 100%;
				}

				body {
					font-family: 'Lato', sans-serif;
					color: #888;
					margin: 0;
					background: #f9f9f9;
				}

				#main {
					display: table;
					width: 100%;
					height: 100vh;
					text-align: center;
				}

				.fzf {
					display: table-cell;
					vertical-align: middle;
				}

				.fzf h1 {
					font-size: 50px;
					display: inline-block;
					padding-right: 12px;
					animation: type .5s alternate infinite;
				}

				[data-wipe] {
					display: inline-block;
					padding: 12px 18px;
					text-decoration: none;
					position: relative;
					border: 2px solid #77B6EA;
					border-radius: 3px;
					text-transform: uppercase;
					letter-spacing: 0.1em;
					text-align: left;
					color: #888;
					overflow: hidden;
				}

				[data-wipe]:before,
				[data-wipe]:after {
					content: attr(data-wipe);
					padding-top: inherit;
					padding-bottom: inherit;
					white-space: nowrap;
					position: absolute;
					top: 0;
					overflow: hidden;
					color: #FFF;
					background: #77B6EA;
				}

				[data-wipe]:before {
					left: 0;
					text-indent: 18px;
					width: 0;
				}

				[data-wipe]:after {
					padding-left: inherit;
					padding-right: inherit;
					left: 100%;
					text-indent: calc(-100% - 36px);
					transition: 0.2s ease-in-out;
				}

				[data-wipe]:hover:before {
					width: 100%;
					transition: width 0.2s ease-in-out;
				}

				[data-wipe]:hover:after {
					left: 0;
					text-indent: 0;
					transition: 0s 0.2s ease-in-out;
				}


				@keyframes type {
					from {
						box-shadow: inset -3px 0px 0px #888;
					}

					to {
						box-shadow: inset -3px 0px 0px transparent;
					}
				}
			</style>

		</head>

		<body>

			<div id="main">
				<div class="fzf">
					<c:choose>
						<c:when test="${statusCode == 400}">
							<h1>Opps!... 400 Bad Request</h1>
						</c:when>
						<c:when test="${statusCode == 401}">
							<h1>Opps!... 401 Unauthorized</h1>
						</c:when>
						<c:when test="${statusCode == 403}">
							<h1>Opps!... 403 Forbidden</h1>
						</c:when>
						<c:when test="${statusCode == 404}">
							<h1>Opps!... 404 Not Found</h1>
						</c:when>
						<c:when test="${statusCode == 500}">
							<h1>Opps!... 500 Internal Server Error</h1>
						</c:when>
						<c:otherwise>
							<p>Opps!... Unknown Error</p>
						</c:otherwise>
					</c:choose>
					<h3>Sorry, this is not working properly. We now know about this mistake and are working to fix it.
					</h3>
					<p>error logs: </p>

						<p>Status Code: ${requestScope['javax.servlet.error.status_code']}</p>
						<p>
							Error Message:
							<c:out value="${requestScope['javax.servlet.error.message']}" default="N/A"></c:out>
						</p>
						<p>
							Exception Type:
							<c:out value="${requestScope['javax.servlet.error.exception_type']}" default="N/A"></c:out>
						</p>
						<p>
							Exception:
							<c:out value="${requestScope['javax.servlet.error.message']}" default="N/A"></c:out>
						</p>
						<p>
							Request URI:
							<c:out value="${requestScope['javax.servlet.error.request_uri']}" default="N/A"></c:out>
						</p>
						<p>
							Servlet Name:
							<c:out value="${requestScope['javax.servlet.error.servlet_name']}" default="N//A"></c:out>
						</p>
					<a href="/" class="btn" data-wipe="Take Me Home">Take Me Home</a>
				</div>
			</div>
		</body>

		</html>
