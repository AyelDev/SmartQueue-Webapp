<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>login page</title>
</head>
<body>
	
	<p>
	<c:out value="${errorLogin}"></c:out>
	</p>

	

	<form action=login_Servlet method=post>
		<label>Username</label> <input required="required" type="text" name="txtUsername">
		<label>Password</label> <input required="required" type="password" name="txtPassword">
		<input type="submit" value="login">
	</form>
</body>
</html>