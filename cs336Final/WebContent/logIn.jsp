<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in page</title>
</head>
<body>

<br>

	<form method="post" action="AuthenticateLogIn.jsp">
	<table>
	<tr>
	<td>User Name:</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password:</td><td><input type="password" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="Login">
	</form>
<br>

<br>

	<form method="post" action="RegisterCustomer.jsp">
	<table>
	<tr>
	<td>If you don't have an account, press Register</td>
	</table>
	<input type="submit" value="Register">
	</form>
<br>


</body>
</html>