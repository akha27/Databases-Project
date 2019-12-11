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
<title>Delete User</title>
</head>
<body>

<h2> Delete a user or a customer</h2>
	<form method="post" action="AdminDeleteAuthentication.jsp">
			<table>
			<tr>
				<td> 		
					<select name="userTypeDelete" class="choose">
						<option value="customer">Delete customer</option>
						<option value="representative">Delete Representative</option>
					</select>
						
				</td>
			</tr>
			
			<tr>
				<td>User-name </td><td><input type="text" name="adminDeleteUsername"></td>
			</tr>
			
			</table>
				<input type="submit" value="DELETE">
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