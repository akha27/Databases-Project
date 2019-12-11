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
	String customerName = request.getParameter("CustomerName");
	String query;
	if(customerName == null) {
		query = "SELECT reservation_id " +
	            "FROM Reservation NATURAL JOIN reserves NATURAL JOIN Ticket NATURAL JOIN Subticket " +
	            "WHERE Subticket.flight_number = " + flightNumber +
	            " AND airline_id = '" + airlineId + "'";
		out.print("<h1> Reservations for " + flightNumber + " on airline " + airlineId + "</h1>");
	} else {
		query = "SELECT reservation_id " +
				"FROM Reservation NATURAL JOIN makes NATURAL JOIN Customer NATURAL JOIN Person " +
				"WHERE Person.person_name = '" + customerName + "'";
		out.print("<h1> Reservations for " + customerName + "</h1>");
	}
	
	ResultSet result = departureStmt.executeQuery(query);

	out.print("<h2> Reservations </h2>");
	out.print("<table><tr><th>Reservation ID</th></tr>");
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
