<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>

<% 
 boolean registrationStatus = false;


try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			String insertUser = "INSERT INTO Person(user_name, password, person_name)"
					+ "VALUES (?, ?, ?)";
			String insertCustomer = "INSERT INTO Customer(user_name, account_number) VALUES(?, ?)";
			
			//from logIn.jsp
			String newUsername = request.getParameter("registerUsername");
			String newPassword = request.getParameter("registerPassword");
						
		
			PreparedStatement ps = con.prepareStatement(insertUser);
			PreparedStatement ps2 = con.prepareStatement(insertCustomer);
			
			ps.setString(1, newUsername);
			ps.setString(2, newPassword);
			ps.setString(3, "test");
			ps2.setString(1, newUsername);
			ps2.setInt(2, (int)(Math.random() * 1000000));
			
			registrationStatus = true;

			
			ps.executeUpdate();
			ps2.executeUpdate();

			con.close();
			
			out.print("Registration SUCCESSFUL");

			

		} catch (Exception e) {
			out.print("Registration UNSUCCESSFUL<br>");
			out.print(e);
		}
	%>
		
	<form method="post" action="RegisterCustomer.jsp">
	<table>
	<tr>
	<td><br>Press here to register another user<br></td>
	</table>
	<input type="submit" value="Register">
	</form>
	
	<form method="post" action="LogIn.jsp">
	<table>
	<tr>
	<td>Return to Log In Page</td>
	</table>
	<input type="submit" value="Return">
	</form>
		
	

</body>
</html>