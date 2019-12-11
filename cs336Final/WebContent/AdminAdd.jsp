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
			<table>
			<tr>
				<td> 		
					<select name="userType" class="choose">
						<option value="economy">Add customer</option>
						<option value="business">Add Representative</option>
					</select>
						
				</td>
			</tr>
			<tr>
				<td>User-name </td><td><input type="text" name="username"></td>
			</tr>
			
			<tr>
				<td>Password </td><td><input type="text" name="password"></td>
			</tr> 
			
			<tr>
				<td>First name </td><td><input type="text" name="firstName"></td>
			</tr> 
			
			</table>
			
			<form method="post" action="TODO">
				<input type="submit" value="Add">
			</form>

</body>
</html>