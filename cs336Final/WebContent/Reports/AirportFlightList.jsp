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
<%!
void printFlightListing(JspWriter out, ResultSet result) throws IOException, SQLException {
	String airline = result.getString(1);
	int flight = result.getInt(2);
	String airport = result.getString(3);
	out.print("<td>" + airline + "</td><td>" + flight + "</td><td>" + airport + "</td>");
}
%>
<% 
try {
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	

	//Create a SQL statement
	Statement departureStmt = con.createStatement();

	String airport = request.getParameter("Airport");
	String departures = "SELECT * " +
            "FROM departs JOIN Flight " +
            "ON departs.airline_id = Flight.airline_id " + 
            "AND departs.flight_number = Flight.flight_number " +
            "WHERE departs.airport_id = '" + airport + "'";
	String arrivals = "SELECT * " +
            "FROM arrives JOIN Flight " +
            "ON arrives.airline_id = Flight.airline_id " + 
            "AND arrives.flight_number = Flight.flight_number " +
            "WHERE arrives.airport_id = '" + airport + "'";
	
	ResultSet departureResults = departureStmt.executeQuery(departures);

	out.print("<h1> Flight Listings for " + airport + "</h1>");
	out.print("<h2> Departures </h2>");
	out.print("<table><tr><th>Airline</th><th>Flight</th><th>Airport</th></tr>");
	while (departureResults.next()) {
		out.print("<tr>");
		printFlightListing(out, departureResults);
		out.print("</tr>");
	}
	out.print("</table>");
	
	Statement arrivalStmt = con.createStatement();

	ResultSet arrivalsResults = arrivalStmt.executeQuery(arrivals);
	out.print("<h2> Arrivals </h2>");
	out.print("<table><tr><th>Airline</th><th>Flight</th><th>Airport</th></tr>");
	while (arrivalsResults.next()) {
		out.print("<tr>");
		printFlightListing(out, arrivalsResults);
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
