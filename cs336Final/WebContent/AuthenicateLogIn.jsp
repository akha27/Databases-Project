<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String getUser = "SELECT * FROM USERS";
			
			//from logIn.jsp
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			ResultSet result = stmt.executeQuery(getUser);
			
			// get result from query into table		
			//PreparedStatement ps = con.prepareStatement(getUser);
			
			while (result.next()) {
				if(result.getString(1).equals(username) && result.getString(2).equals(password)) {
					out.print("Log in Successfull");
				}
				
			}

		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>