<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<title>Your Reservations</title>
</head>
<body>
		<h2><%=session.getAttribute("uName")%>, here are your upcoming flights:</h2>
		
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
   							<td colspan="9"><input type="submit" value="DETAILS">></td>
   							
  						</tr>
					</table>
			</form>
		
		
		
		<h2><%=session.getAttribute("uName")%>, here are your past flights:</h2>
		
		
		<!-- TODO: make this work -->
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
   							<td colspan="9">
   									<input type="button" value="DETAILS">
   							</td>
   							
  						</tr>
					</table>
			</form>
		
		


</body>
</html>