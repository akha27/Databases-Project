<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time to REPRESENT</title>
</head>
<body>


	<%
		boolean repLogInStatus = false;
	
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			String getUser = "SELECT * FROM Customer_Rep NATURAL JOIN Person";

			//from logIn.jsp
			String username = request.getParameter("usernameRep");
			String password = request.getParameter("passwordRep");

			ResultSet result = stmt.executeQuery(getUser);

			while (result.next()) {

				if (result.getString(1).equals(username) && result.getString(2).equals(password)) {
					out.print("Log in Successful");
					session.setAttribute("uName", username);
					repLogInStatus = true;
					String redirectURL = "CustomerRepControls.jsp";
					response.sendRedirect(redirectURL); 
					break;
				} else {
					repLogInStatus = false;
				}
			}

			if (repLogInStatus == false) {
				out.print("<br>Log in Failed");
			}


		} catch (Exception e) {
			out.print("Log in Failed<br>");

			out.print("Error message" + e);
		}
	%>
	


<%if (repLogInStatus == false) {  %>

<form method="post" action="LogOut.jsp">
		<input type="submit" value="Return to log in page">
	</form> 

	<%}%>

</body>
</html>