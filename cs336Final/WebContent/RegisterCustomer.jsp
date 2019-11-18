<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>

<br>

	<form method="post" action="AuthenticateRegistration.jsp">
	<table>
	<tr>
	<td>Register New Account</td>
	</tr>
	<tr>
	<td>Enter your user name:</td><td><input type="text" name="registerUsername"></td>
	</tr>
	<tr>
	<td>Enter your Password:</td><td><input type="password" name="registerPassword"></td>
	</tr>
	</table>
	<input type="submit" value="Register">
	</form>
<br>

<form method="post" action="logIn.jsp">
	<table>
	<tr>
	<td>Return to Log In</td>
	</table>
	<input type="submit" value="Register">
	</form>

</body>
</html>