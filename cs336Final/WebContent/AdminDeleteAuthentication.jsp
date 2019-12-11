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
<title>Insert title here</title>
</head>
<body>

<% 

String deletePerson = "DELETE FROM Person WHERE user_name = ?";
String deleteCustomer = "";
String deleteRepresentative = "";

boolean registrationStatus = false;

try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement stmt = con.createStatement();
						
			String typeUser = request.getParameter("userTypeDelete");
						
			if(typeUser.equals("customer")) {	
				
				deleteCustomer = "DELETE FROM Customer WHERE user_name = (?)";
				
			} else if(typeUser.equals("representative")) {
				
				deleteRepresentative = "DELETE FROM Customer_Rep WHERE user_name = (?)";
				
			} else {
				out.print("Fuck");
			}
			
			String deleteUsername = request.getParameter("adminDeleteUsername");

			PreparedStatement ps = con.prepareStatement(deletePerson);
			PreparedStatement ps2 = con.prepareStatement(deleteCustomer);
			PreparedStatement ps3 = con.prepareStatement(deleteRepresentative);
		
			if(typeUser.equals("customer")) {
				ps2.setString(1, deleteUsername);					
				ps.setString(1, deleteUsername);
			} else if(typeUser.equals("representative")) {
				ps3.setString(1, deleteUsername);	
				ps.setString(1, deleteUsername);
			}
			
			
			registrationStatus = true;

			
			if(typeUser.equals("customer")) {
				ps2.executeUpdate();

				ps.executeUpdate();
							
			} else if(typeUser.equals("representative")) {
				ps3.executeUpdate();

				ps.executeUpdate();
			}
			

 
			con.close();
			
			if(typeUser.equals("customer")) {
				out.print("Customer DELETED");
				
			} else if(typeUser.equals("representative")) {
				out.print("Representative DELETED");

			}
			

		} catch (Exception e) {
			out.print("Deletion UNSUCCESSFUL<br>");
			out.print(e);
		} %>
		
	<form method="post" action="AdminDelete.jsp">
	<table>
	<tr>
	<td><br>Press here to DELETE another user<br></td>
	</table>
	<input type="submit" value="DELETE">
	</form>
	
	<form method="post" action="AdminControls.jsp">
	<table>
	<tr>
	<td><br>Return to Admin Control Panel<br></td>
	</table>
	<input type="submit" value="Return">
	</form>
	
	<div class= "rightLogout">
				<form method="post" action="LogOut.jsp">
				<input type="submit" value="Log out">
			</form> 
    	 </div>

</body>
</html>