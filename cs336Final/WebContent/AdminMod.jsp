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
<title>Admin MOD</title>
</head>
<body>

<h2> Modify a user or a customer</h2>
	<form method="post" action="AdminModAuthentication.jsp">
			<table>
			<tr>
				<td>User-name </td><td><input required type="text" name="adminModUsername"></td>
			</tr>
			
			<tr>
				<td>Password </td><td><input required type="text" name="adminModPassword"></td>
			</tr> 
			
			<tr>
				<td>First name </td><td><input required type="text" name="adminModFirstName"></td>
			</tr> 
			
			</table>
			
				<input type="submit" value="Modify">
			</form>	
			
			
			<div class= "rightLogout">
				<form method="post" action="LogOut.jsp">
				<input type="submit" value="Log out">
			</form> 
    	 </div>
    	 
    	 <form method="post" action="AdminControls.jsp">
			<table>
				<tr>
				<td><br>Return to Admin Control Panel<br></td>
			</table>
				<input type="submit" value="Return">
		</form>

</body>
</html>