<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.sessionStaff}">
	<c:redirect url="/" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</body>
</html>