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
.colWidth {
	width: 90px;
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
			String reservationRequest = "SELECT Reservation.reservation_id, Flight.airline_id, Flight.flight_number, departs.dept_time, departs.airport_id, arrives.arrv_time, arrives.airport_id, Flight.stops, Flight.price, Subticket.class FROM Reservation NATURAL JOIN reserves  NATURAL JOIN makes NATURAL JOIN ((Flight NATURAL JOIN Subticket) JOIN arrives JOIN departs ON arrives.flight_number = Subticket.flight_number AND departs.flight_number = Subticket.flight_number AND arrives.airline_id = Subticket.airline_id AND departs.airline_id = Subticket.airline_id) WHERE user_name = \"" + uname + "\"";
			
			ResultSet result = stmt.executeQuery(reservationRequest);%>
			
				<table style="width:100%">
  					<tr>
   						<th class ="colWidth">Reservation ID</th>
   						<th class ="colWidth" colspan="2">Airline</th>
    					<th class ="colWidth" colspan="3">Flight Number</th>
	    				<th class ="colWidth" colspan="4">Depart Airport</th>
			    		<th class ="colWidth" colspan="5">Depart Time</th>
						<th class ="colWidth" colspan="6">Arrival Airport</th>
			    		<th class ="colWidth" colspan="7">Arrival Time</th> 
			    		<th class ="colWidth" colspan="8">Number of Stops</th>   			
			    		<th class ="colWidth" colspan="9">Price</th> 
			    	    <th class ="colWidth" colspan="10">Action</th>   			  			
  					</tr>
  				</table>
  			<%
  					if(result.next()){
  						result.beforeFirst();
  					
  					while (result.next()) {%>	
  					
  					<form action="ReservationDetails.jsp" method="POST">
  					<table style="width:100%">
  						<tbody>
  							<tr>
  								<td class ="colWidth">
  						     		<input type="text" class ="colWidth" name="reservationId" readonly value="<%out.print(result.getString("Reservation.reservation_id")); %>"/>
  						    	</td>
  						    	<td class ="colWidth" colspan="2">
  						     		<input type="text" class ="colWidth" name="airlineId" readonly value="<%out.print(result.getString("Flight.airline_id")); %>"/>
  						    	</td>
    							<td class ="colWidth" colspan="3">
    								<input type="text" class ="colWidth" name="flightNumber" readonly value="<%out.print(result.getString("Flight.flight_number")); %>"/>
    							</td>
    							<td class ="colWidth" colspan="4"><%out.print(result.getString("departs.airport_id")); %></td>
   								<td class ="colWidth" colspan="5"><%out.print(result.getString("departs.dept_time")); %></td>
   								<td class ="colWidth" colspan="6"><%out.print(result.getString("arrives.airport_id")); %></td>
   								<td class ="colWidth" colspan="7"><%out.print(result.getString("arrives.arrv_time")); %></td>
    							<td class ="colWidth" colspan="8"><%out.print(result.getString("stops"));%></td>
   								<td class ="colWidth" colspan="9">
       								<input class ="colWidth" type="text" name="flightPrice" readonly value="<%out.print(result.getString("price")); %>"/>			
   								</td>
   							<% if(!result.getString("Subticket.class").equals("E")) {%>
   								<td  class ="colWidth"colspan="10"><input class ="colWidth" type="submit" value="cancel"></td>
   								<% } else {%>
   								<td  class ="colWidth"colspan="10">Can't cancel  :(</td>
   								<%}%>
   								</tr>
  						 </tbody>
  						
					</table>
			</form>
   							
   							
   							<% }
  					}%>
   							
  						
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