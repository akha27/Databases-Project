<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Your Reservations</title>
</head>
<body>
		<h2><%=session.getAttribute("uName")%>, here are your upcoming flights:</h2>
		<%try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String uname = (String)session.getAttribute("uName");
			String reservationRequest = "SELECT Flight.airline_id, Flight.flight_number, departs.dept_time, departs.airport_id, arrives.arrv_time, arrives.airport_id, Flight.stops, Flight.price FROM Reservation NATURAL JOIN reserves  NATURAL JOIN makes NATURAL JOIN ((Flight NATURAL JOIN Subticket) JOIN arrives JOIN departs ON arrives.flight_number = Subticket.flight_number AND departs.flight_number = Subticket.flight_number AND arrives.airline_id = Subticket.airline_id AND departs.airline_id = Subticket.airline_id) WHERE user_name = \"" + uname + "\"";
			
			ResultSet result = stmt.executeQuery(reservationRequest);
			%>
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
  						    	<td>
  						     		<input type="text" name="airlineId" readonly value="<%out.print(result.getString("Flight.airline_id")); %>"/>
  						    	</td>
    							<td colspan="2">
    								<input type="text" name="flightNumber" readonly value="<%out.print(result.getString("Flight.flight_number")); %>"/>
    							</td>
    							<td colspan="3"><%out.print(result.getString("departs.airport_id")); %></td>
   								<td colspan="4"><%out.print(result.getString("departs.dept_time")); %></td>
   								<td colspan="5"><%out.print(result.getString("arrives.airport_id")); %></td>
   								<td colspan="6"><%out.print(result.getString("arrives.arrv_time")); %></td>
    							<td colspan="7"><%out.print(result.getString("stops"));%></td>
   								<td colspan="8">
       								<input type="text" name="flightPrice" readonly value="<%out.print(result.getString("price")); %>"/>			
   								</td>
   							<td colspan="9"><input type="submit" value="cancel"></td>
   							
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