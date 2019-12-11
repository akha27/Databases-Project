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


	<form method="post" action="AdminAdd.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Add Customer or Representative"></td>
			</tr>
		</table>
	</form>

	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Edit Customer or Representative"></td>
			</tr>
		</table>
	</form>

	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Get a sales report"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Generate revenue listings"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Top-revenue Customer"></td>
			</tr>
		</table>
	</form>
	
	<!--  <form method="get" action="Reports/MostActiveFlights.jsp">  -->
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Most Active Flights"></td>
			</tr>
		</table>
	</form>
	
	<form method="get" action="Reports/AirportFlightList.jsp">
		<table>
			<tr>
				<td><br>
				<label for="Airport"> Choose an Airport:</label> <br>
				<input type="text" name="Airport" />
				<input type="submit" value="Flights per Airport"></td>
			</tr>
		</table>
	</form>
	
	 <div class= "rightLogout">
		<form method="post" action="LogOut.jsp">
			<input type="submit" value="Log out">
		</form> 
     </div>
	

</body>
</html>