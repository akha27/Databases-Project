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

	String query = "SELECT Person.person_name, SUM(Ticket.total_fare) AS fare " +
				"FROM Customer NATURAL JOIN Person NATURAL JOIN makes NATURAL JOIN Reservation NATURAL JOIN reserves NATURAL JOIN Ticket " +
				"GROUP BY Customer.account_number ORDER BY fare " +
				"LIMIT 1";
	out.print("<h1> Top Revenue Customer </h1>");
	ResultSet result = departureStmt.executeQuery(query);
	if(result.next()) {
		out.print("Name: " + result.getString(1));
	} else {
		out.print("No customers with revenue!");
	}
} catch (Exception e) {
	out.print("Log in Failed<br>");

	out.print("Error message" + e);
	out.print(Arrays.asList(e.getStackTrace()));
}
%>
</body>
