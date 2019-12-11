<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
  text-align: left;    
}
</style>
<meta charset="UTF-8">
<title>Flights</title>
</head>
<body>

<!-- This screen is meant to display and sort flights. Will somehow need to connect it to reservation. -->


<%
try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String sort = "";
			if(request.getParameter("sortPrice").equals("lotToHigh"))
				sort = " ORDER BY price";
			else if(request.getParameter("sortPrice").equals("highToLow"))
				sort = " ORDER BY price DESC";
			
			String getFlights = "SELECT flight_number, departs.airport_id, dept_time, arrives.airport_id, stops, price" +
								" FROM departs JOIN arrives JOIN Flight" +
								" ON departs.airline_id = arrives.airline_id" +
								" AND arrives.airline_id = Flight.airline_id" +
								" AND departs.flight_number = arrives.flight_number" +
								" AND arrives.flight_number = Flight.flight_number" +
								" WHERE arrives.airport_id = var_destination " +
								" AND departs.airport_id = var_origin " +
								" sort";
			
			ResultSet result = stmt.executeQuery(getFlights);

		// out.print("Airline ID");
		//	while (result.next()) {
		//	out.print(result.getString(1) + result.getString(2) + result.getString(3) + "\n\n");%> <br></br> <% 
		//	} 
					
			
			

		} catch (Exception e) {
			out.print(e);
		}
%>



		<h2>Sort it:</h2>

		<form method="post" action ="TODO: re-sort flights">  						
		<table style="margin:50 px;">
			<tr>
				<td> 		
					<select name="sortPrice" class="choose">
					<option value="lotToHigh" selected>I'm feeling poor</option>
					<option value="highToLow">I'm feeling rich</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td> 		
					<select name="sortStops" class="choose">
						<option value="moreThanThree"> more than 3</option>
						<option value="lessThanThree"> less than 3 </option>
					</select>
						
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="sort"></td>
			</tr>
		</table>
		</form>	
		
		<br>
		
		<h2>Here are available flights:</h2>
		<br>


			<form action="" method="POST">
					<table style="width:100%">
  						<tr>
   							<th>AIRLINE</th>
    						<th colspan="2">Flight Number</th>
	    					<th colspan="3">Depart Airport</th>
			    			<th colspan="4">Depart Time</th>
							<th colspan="5">Arrival Airport</th>
			    			<th colspan="6">Arrival Time</th> 
			    			<th colspan="7">Number of Stops</th>   			
			    			<th colspan="8">Price</th>   			
  						</tr>
  						<tr>
  						    <td>Ex. Jet Blue</td>
    						<td colspan="2">Ex: 100500</td>
    						<td colspan="3">JFK</td>
   							<td colspan="4">4:20 pm</td>
   							<td colspan="5">RIX</td>
   							<td colspan="6">4:69 pm</td>
    						<td colspan="7">2</td>
   							<td colspan="8">$31</td>
   							<td colspan="9"><input type="submit" value="RESERVE">></td>
   							
  						</tr>
					</table>
			</form>



</body>
</html>