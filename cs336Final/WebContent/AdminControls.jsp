<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.rightLogout {
  position: absolute;
  top: 10px;
  right: 10px;
}
</style>
<meta charset="UTF-8">
<title>Admin Controls</title>
</head>
<body>

     <h2>Here are some Admin Controls: </h2>

	<h3> Add a Customer or Representative </h3>
	<form method="post" action="AdminAdd.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Add Customer or Representative"></td>
			</tr>
		</table>
	</form>

	<h3> Delete a Customer or Representative </h3>
	<form method="post" action="AdminDelete.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Delete Customer or Representative"></td>
			</tr>
		</table>
	</form>

	<h3> Edit a Customer or Representative </h3>
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Edit Customer or Representative"></td>
			</tr>
		</table>
	</form>
	
	<h3> Get a List of Reservations by Flight Number </h3>
	<form method="get" action="Reports/ListOfReservations.jsp">
		<label for="FlightNumber"> Flight Number </label>
		<input type="text" name="FlightNumber" /> <br>
		<label for="Airline"> Airline ID </label>
		<input type="text" name="Airline" /> <br>
		<input type="submit" value="Get a List of Reservations">
	</form>
	
	<h3> Get a List of Reservations by Customer Name </h3>
	<form method="get" action="Reports/ListOfReservations.jsp">
		<label for="CustomerName"> Customer Name </label>
		<input type="text" name="CustomerName" /> <br>
		<input type="submit" value="Get a List of Reservations">
	</form>
	
	<h3> Get a Sales Report </h3>
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Get a sales report"></td>
			</tr>
		</table>
	</form>
	
	<h3> Get Revenue Listings </h3>
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Generate revenue listings"></td>
			</tr>
		</table>
	</form>
	
	<h3> Get Top-Revenue Listings </h3>
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Top-revenue Customer"></td>
			</tr>
		</table>
	</form>
	
	<h3> Get a Listing of the Most Active Flights</h3>
	<form method="get" action="Reports/MostActiveFlights.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Most Active Flights"></td>
			</tr>
		</table>
	</form>
	
	<h3> Get a Flight Listing for an Airport</h3>
	<form method="get" action="Reports/AirportFlightList.jsp">
		<label for="Airport"> Choose an Airport:</label> <br>
		<input type="text" name="Airport" />
		<input type="submit" value="Flights per Airport">
	</form>
	
	 <div class= "rightLogout">
		<form method="post" action="LogOut.jsp">
			<input type="submit" value="Log out">
		</form> 
     </div>
	

</body>
</html>