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
<title>Modify Airport</title>
</head>
<body>

	<h2> Add an airport</h2>
	<form method="post" action="AddAirport.jsp">
		<input type="text" name="airportIdAdd"/>
		<input type="submit" value="Add Airport">
	</form>	
	<div class= "rightLogout">
		<form method="post" action="LogOut.jsp">
			<input type="submit" value="Log out">
		</form> 
    </div>	 
    <form method="post" action="CustomerRepControls.jsp">
		<table>
			<td><br>Return to representative Control Panel<br></td>
		</table>
		<input type="submit" value="Return">
	</form>

</body>
</html>