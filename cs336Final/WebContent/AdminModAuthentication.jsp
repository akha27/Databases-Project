<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
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
<title>Admin Add</title>
</head>
<body>

<% 

String insertPerson = "UPDATE Person SET password = ?, person_name = ? WHERE user_name = ?";

try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String username = request.getParameter("adminModUsername");
			String newPassword = request.getParameter("adminModPassword");
			String newName = request.getParameter("adminModFirstName");

			PreparedStatement ps = con.prepareStatement(insertPerson);

			ps.setString(1, newPassword);
			ps.setString(2, newName);
			ps.setString(3, username);

			ps.executeUpdate();

 
			con.close();
			
			out.print("Modded User");
			

		} catch (Exception e) {
			out.print("Registration UNSUCCESSFUL<br>");
			out.print(e);
		} %>
		
	<form method="post" action="AdminMod.jsp">
	<table>
	<tr>
	<td><br>Press here to modify another user<br></td>
	</table>
	<input type="submit" value="Register">
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