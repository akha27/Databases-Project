<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin ADD</title>
</head>
<body>

<h2> Add a user or a customer</h2>
	<form method="post" action="AdminAddAuthenication.jsp">
			<table>
			<tr>
				<td> 		
					<select name="userTypeRegister" class="choose">
						<option value="customer">Add customer</option>
						<option value="representative">Add Representative</option>
					</select>
						
				</td>
			</tr>
			
			<tr>
				<td>User-name </td><td><input type="text" name="adminAddUsername"></td>
			</tr>
			
			<tr>
				<td>Password </td><td><input type="text" name="adminAddPassword"></td>
			</tr> 
			
			<tr>
				<td>First name </td><td><input type="text" name="adminAddFirstName"></td>
			</tr> 
			
			</table>
			
				<input type="submit" value="Add">
			</form>
			
			

</body>
</html>