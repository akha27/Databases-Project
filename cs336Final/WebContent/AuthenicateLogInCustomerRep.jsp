<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time to REPRESENT</title>
</head>
<body>


	<%
		boolean repLogInStatus = false;
	
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			String getUser = "SELECT * FROM Customer_Rep";

			//from logIn.jsp
			String username = request.getParameter("usernameRep");
			String password = request.getParameter("passwordRep");

			ResultSet result = stmt.executeQuery(getUser);

			while (result.next()) {
				//testing purposes
				/* System.out.println(result.getString(1) + "\t" + result.getString(2));
				System.out.println(username + "\t" + password); */

				if (result.getString(1).equals(username) && result.getString(2).equals(password)) {
					out.print("Log in Successful");
					session.setAttribute("uName", username);
					repLogInStatus = true;
					break;
				} else {
					//out.print("Log in Failed<br>");
					repLogInStatus = false;
				}
			}

			if (repLogInStatus == false) {
				out.print("<br>Log in Failed");
			}


		} catch (Exception e) {
			out.print("Log in Failed<br>");

			out.print("Error message" + e);
		}
	%>
	


<%if (repLogInStatus == true) {  %>

	<form method="post" action="UserReservations.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Press here to Look at your Reservations"></td>
			</tr>
		</table>
	</form>

	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="MAKE flight reservation for a user"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="EDIT flight reservation for a user"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="MODIFY flight information"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="RETRIEVE waiting list for a flight"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="LogOut.jsp">
		<input type="submit" value="Log out">
	</form> 
	<%} else {%>
	
	<form method="post" action="LogOut.jsp">
		<input type="submit" value="Return to log in page">
	</form> 
	
	<%} %>



</body>
</html>