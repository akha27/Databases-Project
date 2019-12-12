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
<title>Add Airport</title>
</head>
<body>

<% 

String deleteAirport = "INSERT INTO Airport(airport_id)" + "VALUES (?);";

try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
						
			String airportId = request.getParameter("airportIdAdd");
						
			PreparedStatement ps = con.prepareStatement(insertAirport);
			
		
			ps.setString(1, airportId);
			ps.executeUpdate();
 
			con.close();
			out.print("Registered Airport");
		} catch (Exception e) {
			out.print("Registration UNSUCCESSFUL<br>");
			out.print(e);
		} %>
		
	<form method="post" action="AdminAdd.jsp">
	<table>
	<tr>
	<td><br>Press here to register another user<br></td>
	</table>
	<input type="submit" value="Register">
	</form>
	
	<div class= "rightLogout">
				<form method="post" action="LogOut.jsp">
				<input type="submit" value="Log out">
			</form> 
    	 </div>
    	 
    	 <form method="post" action="CustomerRepControls.jsp">
	<table>
	<tr>
	<td><br>Return to representative Control Panel<br></td>
	</table>
	<input type="submit" value="Return">
	</form>

</body>
</html>