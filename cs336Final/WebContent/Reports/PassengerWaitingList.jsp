<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Airport Flight Listing</title>
</head>
<body>
<% 
try {
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	

	//Create a SQL statement
	Statement departureStmt = con.createStatement();

	String flightNumber = request.getParameter("FlightNumber");
	String airlineId = request.getParameter("Airline");
	String query = "SELECT account_number " +
	            "FROM waitlisted " +
	            "WHERE flight_number = " + flightNumber +
	            " AND airline_id = '" + airlineId + "'";
	out.print("<h1> Waitlist for " + flightNumber + " on airline " + airlineId + "</h1>");

	ResultSet result = departureStmt.executeQuery(query);

	out.print("<h2> Passengers </h2>");
	out.print("<table><tr><th>Account Number</th></tr>");
	while (result.next()) {
		out.print("<tr>");
		out.print(result.getInt(1));
		out.print("</tr>");
	}
	out.print("</table>");
} catch (Exception e) {
	out.print("Log in Failed<br>");

	out.print("Error message" + e);
	out.print(Arrays.asList(e.getStackTrace()));
}
%>
</body>
