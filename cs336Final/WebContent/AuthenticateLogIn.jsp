<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
</head>
<body>

<% 
boolean loginStatus= false;
boolean isAdmin = false;

try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String getUser = "SELECT * FROM Person";
			
			//from logIn.jsp
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			ResultSet result = stmt.executeQuery(getUser);
			
			while (result.next()) {
				//testing purposes
				/* System.out.println(result.getString(1) + "\t" + result.getString(2));
				System.out.println(username + "\t" + password); */
				
				if(result.getString(1).equals(username) && result.getString(2).equals(password)) {
					out.print("Log in Successful");
					session.setAttribute("uName", username);
					loginStatus = true;
					break;
				} else {
					//out.print("Log in Failed<br>");
					loginStatus = false;
				}
			}
			
			 if(loginStatus == false) {
				out.print("<br>Log in Failed");
			}
			 
			String findAdmin = "SELECT * FROM Admin WHERE user_name = '" + username + "'";
			
			ResultSet adminResult = stmt.executeQuery(getUser);
			isAdmin = adminResult.next();
			 
			 
 
		} catch (Exception e) {
			out.print("Log in Failed<br>");

			out.print("Error message" + e);
		}
	%>
	<form method="post" action="LogIn.jsp">
	<table>
	<tr>
	<td><br>Return to Log-in Page</td>
	</table>
	<input type="submit" value="Return">
	</form>
	
		<form method="post" action="RegisterCustomer.jsp">
	<table>
	<tr>
	<td><br>Press here to register user<br></td>
	</table>
	<input type="submit" value="Register">
	</form>
	<%if(isAdmin) { %>
	<h1> Admin Dashboard </h1>
	<%-- TODO: Add, edit, delete info for a customer rep --%>
	<%-- TODO: obtain a sales report --%>
	<%-- TODO: produce a list of reservations --%>
	<%-- TODO: produce a summary listing --%>
	<%-- TODO: find out which customer generated revenue --%>
	<%-- TODO: a list of most active flights --%>
	<h3> A List of All Flights for a Given Airport </h3>
	<form method="get" action="Reports/AirportFlightList.jsp">
		<label for="Airport"> Select an Airport </label>
		<input type="text" name="Airport" >
		<br>
		<input type="submit" value="Get Report">
	</form>
	<% } else { %>
	No Admin Access
	<% } %>


</body>
</html>