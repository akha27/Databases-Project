<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			String getFlights = "SELECT * FROM Flight";
			
			ResultSet result = stmt.executeQuery(getFlights);

			out.print("Airline ID");
			while (result.next()) {
			out.print(result.getString(1) + result.getString(2) + result.getString(3) + "\n\n");%> <br></br> <% 
			}
					
			
			

		} catch (Exception e) {
			out.print("Registration UNSUCCESSFUL<br>");
			out.print(e);
		}
%>

</body>
</html>