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

	<%
		if ((session.getAttribute("uName") == null)) {
	%>
	You are not logged in
	<br />
	<br>
	<form method="post" action="AuthenticateLogIn.jsp">
		<table>
			<tr>
				<td>Log in as CUSTOMER</td>
			</tr>
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="usernameCustomer"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="passwordCustomer"></td>
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

	<br>
	<form method="post" action="AuthenticateLogInCustomerRep.jsp">
		<table>
			<tr>
				<td>Log in as CUSTOMER REPRESENTATIVE</td>
			</tr>
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="usernameRep"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="passwordRep"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
	<br>

	<br>
	<form method="post" action="AuthenticateLogInAdmin.jsp">
		<table>
			<tr>
				<td>Log in as ADMIN</td>
			</tr>
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="usernameAdmin"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="passwordAdmin"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
	<br>

	<%
		} else {
	%>
	<%=session.getAttribute("uName")%>, You are already logged in!
	<form method="post" action="LogOut.jsp">
		<input type="submit" value="Logout">
	</form>

	Go to the menu!
	<form method="post" action="AuthenticateLogIn.jsp">
		<input type="submit" value="Menu">
	</form>
	<%
		}
	%>


</body>
</html>