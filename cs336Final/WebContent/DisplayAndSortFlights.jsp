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
			
			String trip = request.getParameter("trip");
			String tripClass = request.getParameter("class");
			String fromCity = request.getParameter("fromCity");
			String toCity = request.getParameter("toCity");
		 


			
	
			/* String sort = "";
			if(request.getParameter("sortPrice").equals("lowToHigh"))
				sort = " ORDER BY price";
			else if(request.getParameter("sortPrice").equals("highToLow"))
				sort = " ORDER BY price DESC"; */
			
			/* String getFlights = "SELECT Flight_flight_number, departs.airport_id, dept_time, arrives.airport_id, stops, price" +
								" FROM departs JOIN arrives JOIN Flight" +
								" ON departs.airline_id = arrives.airline_id" +
								" AND arrives.airline_id = Flight.airline_id" +
								" AND departs.flight_number = arrives.flight_number" +
								" AND arrives.flight_number = Flight.flight_number" +
								" WHERE arrives.airport_id =\"" + toCity + "\""+
								" AND departs.airport_id = \"" + fromCity + "\"";
							//	+ " sort"; */
							
								String getFlights = "SELECT *" +
								" FROM departs JOIN arrives JOIN Flight" +
								" ON departs.airline_id = arrives.airline_id" +
								" AND arrives.airline_id = Flight.airline_id" +
								" AND departs.flight_number = arrives.flight_number" +
								" AND arrives.flight_number = Flight.flight_number" +
								" WHERE arrives.airport_id =\"" + toCity + "\""+
								" AND departs.airport_id = \"" + fromCity + "\"";
			
			ResultSet result = stmt.executeQuery(getFlights);
			

			
			%>s

		<h2>Sort it:</h2>

		<form method="post" action ="TODO: re-sort flights">  						
		<table style="margin:50 px;">
			<tr>
				<td> 		
					<select name="sortPrice" class="choose">
					<option value="lowToHigh" selected>I'm feeling poor</option>
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
  						
  					<%
  					if(result.next()){
  						result.beforeFirst();
  					
  					while (result.next()) {%>
  					 <tbody>
  					
  						<tr>
  						    <td><%out.print(result.getString("arrives.airline_id")); %></td>
    						<td colspan="2"><%out.print(result.getString("arrives.flight_number")); %></td>
    						<td colspan="3"><%out.print(result.getString("departs.airport_id")); %></td>
   							<td colspan="4"><%out.print(result.getString("dept_time")); %></td>
   							<td colspan="5"><%out.print(result.getString("arrives.airport_id")); %></td>
   							<td colspan="6"><%out.print(result.getString("arrv_time")); %></td>
    						<td colspan="7"><%out.print(result.getString("stops"));%></td>
   							<td colspan="8"><%out.print("$" + result.getString("price"));%></td>
   							<td colspan="9"><input type="submit" value="RESERVE"></td>
   							
   							<% }
  					}
  					else {

  					
  					}
  					%>
   							
  						</tr>
  						 </tbody>
  						
					</table>
			</form>
					
			
			
<%
		} catch (Exception e) {
			out.print(e);
		}
%>



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