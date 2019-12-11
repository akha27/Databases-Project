<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Add</title>
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
			
			String typeUser = request.getParameter("userTypeRegister");
			

			String insertUser = "";
			
			out.print(typeUser);

						
			if(typeUser == "customer") {
				insertUser = "INSERT INTO Customer(account_number, user_name, password, person_name)"
					+ "VALUES (?, ?, ?, ?)";
			} else if(typeUser =="representative") {
				insertUser = "INSERT INTO Customer_Rep(user_name, password, person_name)"
						+ "VALUES (?, ?, ?)";
			}
			

			
			//from logIn.jsp
			String newUsername = request.getParameter("adminAddUsername");
			String newPassword = request.getParameter("adminAddPassword");
			String newName = request.getParameter("adminAddFirstName");

			
			out.print(insertUser);


			PreparedStatement ps = con.prepareStatement(insertUser);
			
			
			if(typeUser == "customer") {
				ps.setInt(1, 0);
				ps.setString(2, newUsername);
				ps.setString(3, newPassword);
				ps.setString(4, newName);	
				
			} else if(typeUser =="representative") {
				ps.setString(1, newUsername);
				ps.setString(2, newPassword);
				ps.setString(3, newName);	
			}
			
			
			
			registrationStatus = true;

			
			ps.executeUpdate();

			con.close();
			
			if(typeUser == "customer") {
				out.print("Registred Customer");
				
			} else if(typeUser =="representative") {
				out.print("Registred Representative");

			}
			

			

		} catch (Exception e) {
			out.print("Registration UNSUCCESSFUL<br>");
			out.print(e);
		}
	%>
		
	<form method="post" action="AdminAdd.jsp">
	<table>
	<tr>
	<td><br>Press here to register another user<br></td>
	</table>
	<input type="submit" value="Register">
	</form>

</body>
</html>