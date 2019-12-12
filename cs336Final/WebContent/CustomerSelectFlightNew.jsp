<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>


<style>
.rightLogout {
  position: absolute;
  top: 40px;
  right: 40px;
}

.rightUserControls {
  position: absolute;
  top: 10px;
  right: 10px;
}
</style>
<meta charset="UTF-8">
<title>Search for trips</title>
</head>
<body>

<!-- INFO: This is the screen that sends a query for flights. The output is meant to be displayed on the next screen. -->
     
	
	<form method="post" action = DisplayAndSortFlights.jsp>  						
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
				<td>Optional Filters</td>
				<td>
					<select name="filterPrice" class="choose">
						<option value="cheaperThan300">Cheaper than $300</option>
						<option value="cheaperThan600">Cheaper than $600</option>
						<option value="cheaperThan1000">Cheaper than $1000</option>
					</select>
				</td>
				<td>
				<select name="filterTakeOff" class="choose">
						<option value="AM">Depart AM</option>
						<option value="PM">Depart PM</option>
					</select>
				</td>
				
				<td>
				<select name="filterLanding" class="choose">
						<option value="AM">Depart AM</option>
						<option value="PM">Depart PM</option>
					</select>
				</td>
				
			</tr>
			
			<tr>
				<td><input type="submit" value="submit"></td>
			</tr>
			
		</table>
		</form>	
		
		
		 <div class= "rightLogout">
		<form method="post" action="LogOut.jsp">
			<input type="submit" value="Log out">
		</form> 
     </div>
     
     <div class= "rightUserControls">
		<form method="post" action="UserControls.jsp">
			<input type="submit" value="Return to User Controls">
		</form> 
     </div>	
			

</body>
</html>