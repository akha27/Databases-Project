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

	String month = request.getParameter("Month");
	String year = request.getParameter("Year");
	String query = "SELECT Ticket.ticket_number, Ticket.total_fare " +
            "FROM Ticket " +
            "WHERE MONTH(Ticket.purchase_datetime) = " + month +
            " AND YEAR(Ticket.purchase_datetime) = " +  year;
	out.print("<h1> Sales Report for " + month + "/" + year + "</h1>");
	ResultSet result = departureStmt.executeQuery(query);

	out.print("<h2> Sales </h2>");
	out.print("<table><tr><th>Ticket ID</th><th>Total Fare</th></tr>");
	while (result.next()) {
		out.print("<tr><td>");
		out.print(result.getInt(1));
		out.print("</td><td>");
		out.print(result.getInt(2));
		out.print("</td></tr>");
	}
	out.print("</table>");
} catch (Exception e) {
	out.print("Log in Failed<br>");

	out.print("Error message" + e);
	out.print(Arrays.asList(e.getStackTrace()));
}
%>
</body>
