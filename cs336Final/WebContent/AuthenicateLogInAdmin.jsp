<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN MODE</title>
</head>
<body>

<%
		boolean adminLoginStatus = false;

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			String getUser = "SELECT * FROM Admin";

			//from logIn.jsp
			String username = request.getParameter("usernameAdmin");
			String password = request.getParameter("passwordAdmin");

			ResultSet result = stmt.executeQuery(getUser);

			while (result.next()) {

				if (result.getString(1).equals(username) && result.getString(2).equals(password)) {
					out.print("Log in Successful");
					out.print("You are an admin, don't break anything!");
					session.setAttribute("uName", username);
					adminLoginStatus = true;
					break;
				} else {
					adminLoginStatus = false;
				}
			}

			if (adminLoginStatus == false) {
				out.print("<br>Log in Failed");
				
				
			}

		} catch (Exception e) {
			out.print("Log in Failed<br>");

			out.print("Error message" + e);
		}
	%>
	
	<%if (adminLoginStatus == true) {  %>
	<form method="post" action="LogOut.jsp">
		<input type="submit" value="Log out">
	</form> 

	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Edit Customer or Representative"></td>
			</tr>
		</table>
	</form>

	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Get a sales report"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Generate revenue listings"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Top-revenue Customer"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Most Active Flights"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Flights per Airport"></td>
			</tr>
		</table>
	</form>
	
	<%} else {%>
	
	<form method="post" action="LogOut.jsp">
		<input type="submit" value="Return to log in page">
	</form> 
	
	<%} %>
	
	<%-- <%
		if (isAdmin) {
	%>
	<h1>Admin Dashboard</h1>
	TODO: Add, edit, delete info for a customer rep
	TODO: obtain a sales report
	TODO: produce a list of reservations
	TODO: produce a summary listing
	TODO: find out which customer generated revenue
	TODO: a list of most active flights
	<h3>A List of All Flights for a Given Airport</h3>
	<form method="get" action="Reports/AirportFlightList.jsp">
		<label for="Airport"> Select an Airport </label> <input type="text"
			name="Airport"> <br> <input type="submit"
			value="Get Report">
	</form>
	<%
		} else {
	%>
	No Admin Access
	<%
		}
	%>
 --%>
</body>
</html>