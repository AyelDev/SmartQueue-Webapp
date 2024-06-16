<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>login page</title>
</head>
<body>
	<form action=login_Servlet method=post>
	<label>Username</label>
	<input type="text" name="txtUsername">
	<label>Password</label>
	<input type="password" name="txtPassword">
	<input type="submit" value="login">
	</form>
</body>
</html>