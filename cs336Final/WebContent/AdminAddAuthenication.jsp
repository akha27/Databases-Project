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

String insertPerson = "INSERT INTO Person(user_name, password, person_name)" + "VALUES (?, ?, ?);";
String insertCustomer = "";
String insertRepresentative = "";

boolean registrationStatus = false;

try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
						
			String typeUser = request.getParameter("userTypeRegister");
						
			if(typeUser.equals("customer")) {	
				
				insertCustomer = "INSERT INTO Customer(account_number, user_name)" + "VALUES (?, ?)";
				
			} else if(typeUser.equals("representative")) {
				
				insertRepresentative = "INSERT INTO Customer_Rep(user_name)" + "VALUES (?)";
				
			} else {
				out.print("Fuck");
			}
			
			String newUsername = request.getParameter("adminAddUsername");
			String newPassword = request.getParameter("adminAddPassword");
			String newName = request.getParameter("adminAddFirstName");

			PreparedStatement ps = con.prepareStatement(insertPerson);
			PreparedStatement ps2 = con.prepareStatement(insertCustomer);
			PreparedStatement ps3 = con.prepareStatement(insertRepresentative);

			
		
			if(typeUser.equals("customer")) {
				ps.setString(1, newUsername);
				ps.setString(2, newPassword);
				ps.setString(3, newName);	
				ps2.setInt(1,(int) (Math.random() * 10000000));	
				ps2.setString(2, newUsername);					
			} else if(typeUser.equals("representative")) {
				ps.setString(1, newUsername);
				ps.setString(2, newPassword);
				ps.setString(3, newName);
				ps3.setString(1, newUsername);	
			}
			
			
			registrationStatus = true;

			
			if(typeUser.equals("customer")) {
				ps.executeUpdate();
				ps2.executeUpdate();
							
			} else if(typeUser.equals("representative")) {
				ps.executeUpdate();
				ps3.executeUpdate();
			}
			

 
			con.close();
			
			if(typeUser.equals("customer")) {
				out.print("Registred Customer");
				
			} else if(typeUser.equals("representative")) {
				out.print("Registred Representative");

			}
			

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
    	 
    	 <form method="post" action="AdminControls.jsp">
	<table>
	<tr>
	<td><br>Return to Admin Control Panel<br></td>
	</table>
	<input type="submit" value="Return">
	</form>

</body>
</html>