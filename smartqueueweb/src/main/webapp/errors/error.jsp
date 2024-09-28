<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="statusCode"
	value="${requestScope['javax.servlet.error.status_code']}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error <c:out
		value="${requestScope['javax.servlet.error.status_code']}"
		default="N/A"></c:out></title>
</head>
<body>
	<h1>
		<c:choose>
			<c:when test="${statusCode == 400}">
				<p>Bad Request</p>
			</c:when>
			<c:when test="${statusCode == 401}">
				<p>Unauthorized</p>
			</c:when>
			<c:when test="${statusCode == 403}">
				<p>Forbidden</p>
			</c:when>
			<c:when test="${statusCode == 404}">
				<p>Not Found</p>
			</c:when>
			<c:when test="${statusCode == 500}">
				<p>Internal Server Error</p>
			</c:when>
			<c:otherwise>
				<p>Unknown Error</p>
			</c:otherwise>
		</c:choose>
	</h1>
	<p>Status Code: ${requestScope['javax.servlet.error.status_code']}</p>
	<p>
		Error Message:
		<c:out value="${requestScope['javax.servlet.error.message']}"
			default="N/A"></c:out>
	</p>
	<p>
		Exception Type:
		<c:out value="${requestScope['javax.servlet.error.exception_type']}"
			default="N/A"></c:out>
	</p>
	<p>
		Exception:
		<c:out value="${requestScope['javax.servlet.error.message']}"
			default="N/A"></c:out>
	</p>
	<p>
		Request URI:
		<c:out value="${requestScope['javax.servlet.error.request_uri']}"
			default="N/A"></c:out>
	</p>
	<p>
		Servlet Name:
		<c:out value="${requestScope['javax.servlet.error.servlet_name']}"
			default="N//A"></c:out>
	</p>
	<a href="/smartqueueweb/login">Go back</a>
</body>
</html>