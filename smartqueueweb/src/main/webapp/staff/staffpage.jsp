<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${empty sessionScope.sessionStaff}">
			<c:redirect url="/" />
		</c:if>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="./scripts/fadetransition.js"></script>
			<link rel="stylesheet" href="./css/loader.css">
			<title>Staff Page</title>
		</head>

		<body>
			<h1>
				Welcome staff
				<c:out value="${sessionStaff.getUsername()}"></c:out>
			</h1>

			<form action=logout_Servlet method=get>
				<input type="submit" value="logout">
			</form>

			<div class="load-wrapper">
				<div class="main-loader">
					<div class="box-loader">
					</div>
				</div>
			</div>
		</body>

		</html>