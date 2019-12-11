<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search for trips</title>
</head>
<body>

	
	<form method="post" action = SearchFlights.jsp>  						
		<table>

			<tr>
				<td> 		
					<select name="trip" class="choose">
					<option value="one-way" selected>One Way</option>
					<option value="round-trip">Round Trip</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td> 		
					<select name="class" class="choose">
						<option value="economy">Economy</option>
						<option value="business">Business-Class</option>
						<option value="firstClass">First-Class</option>
					</select>
						
				</td>
			</tr>
		
			<tr>
				<td>From: </td><td><input type="text" name="fromCity"></td>
			</tr>
		
			<tr>
				<td>To:</td><td><input type="text" name="toCity"></td>
			</tr>
			
			<tr>
				<td>Depart</td><td><input type="date" name="depart" placeholder="MM/DD/YY"></td>
			</tr>
		
			<tr>
				<td>Return</td><td><input type="date" name="return" placeholder="MM/DD/YY"></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="submit"></td>
			</tr>
			
		</table>
		</form>		
		
	
		
		

</body>
</html>