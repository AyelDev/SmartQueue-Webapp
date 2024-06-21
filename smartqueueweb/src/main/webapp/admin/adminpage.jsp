<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.sessionName}">
	<c:redirect url="/" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin page</title>
</head>
<body>



	<h1>
		Welcome
		<c:out value="${admin}"></c:out>
		<c:out value="${sessionScope.sessionName}"></c:out>
	</h1>


	<form action=logout_Servlet method=get>
		<input type="submit" value="logout">
	</form>

	<h1>create staff account</h1>
	<form action=method=get></form>

</body>
</html>