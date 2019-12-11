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
<title>Customer Rep Portal</title>
</head>
<body>

     <h2>Here are some Customer Rep Controls: </h2>

	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="MAKE flight reservation for a user"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="EDIT flight reservation for a user"></td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="TODO">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="MODIFY flight information"></td>
			</tr>
		</table>
	</form>
	
	<h3> Retrieve Waiting List for a Flight </h3>
	<form method="get" action="Reports/PassengerWaitingList.jsp">
		<label for="FlightNumber"> Flight Number </label>
		<input type="text" name="FlightNumber" /> <br>
		<label for="Airline"> Airline ID </label>
		<input type="text" name="Airline" /> <br>
		<input type="submit" value="Retrieve">
	</form>
	
	<div class= "rightLogout">
		<form method="post" action="LogOut.jsp">
			<input type="submit" value="Log out">
		</form> 
     </div>
</body>
</html>