<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>

<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String insertUser = "INSERT INTO Users(userId, login, password)"
					+ "VALUES (?, ?, ?)";
			
			//from logIn.jsp
			String newUsername = request.getParameter("registerUsername");
			String newPassword = request.getParameter("registerPassword");
						
		
			PreparedStatement ps = con.prepareStatement(insertUser);
			
			ps.setString(1, newUsername);
			ps.setString(2, newPassword);
			
			ps.executeUpdate();

			con.close();

			out.print("User Registred");


		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>