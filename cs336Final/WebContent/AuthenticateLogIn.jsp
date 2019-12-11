<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB"%>
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
<title>Logged In</title>
</head>
<body>

	<%
		boolean loginStatus = false;
	
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			String getUser = "SELECT * FROM Person";

			//from logIn.jsp
			String username = request.getParameter("usernameCustomer");
			String password = request.getParameter("passwordCustomer");

			ResultSet result = stmt.executeQuery(getUser);

			while (result.next()) {

				if (result.getString(1).equals(username) && result.getString(2).equals(password)) {
					out.print("Log in Successful");
					session.setAttribute("uName", username);
					loginStatus = true;
					String redirectURL = "UserControls.jsp";
					response.sendRedirect(redirectURL);
					break;
				} else {
					loginStatus = false;
				}
			}

			if (loginStatus == false) {
				out.print("<br>Log in Failed");
			}


		} catch (Exception e) {
			out.print("Log in Failed<br>");

			out.print("Error message" + e);
		}
	%>
	
	<%if (loginStatus == false) {  %>
		<form method="post" action="LogOut.jsp">
			<input type="submit" value="Return to log in page">
		</form> 	<%} else {%>
	
	<%} %>
</body>
</html>