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
<title>User Controls</title>
</head>
<body>
     
     <h2>Here are some User Controls: </h2>

	<form method="post" action="UserReservations.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Press here to Look at your Reservations"></td>
			</tr>
		</table>
	</form>

	<form method="post" action="CustomerSelectFlightNew.jsp">
		<table>
			<tr>
				<td><br>
				<input type="submit" value="Press here to Look for a flight"></td>
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