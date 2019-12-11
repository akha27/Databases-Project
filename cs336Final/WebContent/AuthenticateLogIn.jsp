<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logged In</title>
</head>
<body>

	<%
		boolean loginStatus = false;
	
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			String getUser = "SELECT * FROM Person";

			//from logIn.jsp
			String username = request.getParameter("usernameCustomer");
			String password = request.getParameter("passwordCustomer");

			ResultSet result = stmt.executeQuery(getUser);

			while (result.next()) {
				//testing purposes
				/* System.out.println(result.getString(1) + "\t" + result.getString(2));
				System.out.println(username + "\t" + password); */

				if (result.getString(1).equals(username) && result.getString(2).equals(password)) {
					out.print("Log in Successful");
					session.setAttribute("uName", username);
					loginStatus = true;
					break;
				} else {
					//out.print("Log in Failed<br>");
					loginStatus = false;
				}
			}

			if (loginStatus == false) {
				out.print("<br>Log in Failed");
			}


		} catch (Exception e) {
			out.print("Log in Failed<br>");

			out.print("Error message" + e);
		}
	%>
	
	<%if (loginStatus == true) {  %>
	
	<form method="post" action="LogOut.jsp">
		<input type="submit" value="Log out">
	</form> 

	<form method="post" action="UserReservations.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Press here to Look at your Reservations"></td>
			</tr>
		</table>
	</form>

	<form method="post" action="CustomerSelectFlightNew.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Press here to Look for a flight"></td>
			</tr>
		</table>
	</form>
	
	<%} else {%>
	
	<form method="post" action="LogOut.jsp">
		<input type="submit" value="Return to log in page">
	</form> 
	
	<%} %>
</body>
</html>