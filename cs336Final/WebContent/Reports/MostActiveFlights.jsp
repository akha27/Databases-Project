<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Most Active Flights</title>
</head>
<body>
<%!
void printFlightListing(JspWriter out, ResultSet result) throws IOException, SQLException {
	String airline = result.getString(1);
	int flight = result.getInt(2);
	int count = result.getInt(3);
	out.print("<td>" + airline + "</td><td>" + flight + "</td><td>" + count + "</td>");
}
%>
<% 
try {
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	

	//Create a SQL statement
	//TODO: query is broken
	String flights = "SELECT airline_id, flight_number, COUNT(*) " +
            "FROM Ticket " +
            "GROUP BY airline_id, flight_number";


	Statement flightStmt = con.createStatement();

	ResultSet flightsResults = flightStmt.executeQuery(flights);
	out.print("<h2> Flights </h2>");
	out.print("<table><tr><th>Airline</th><th>Flight</th><th>Airport</th></tr>");
	while (flightsResults.next()) {
		out.print("<tr>");
		printFlightListing(out, flightsResults);
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
