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
			
			
			String getFlights = "SELECT *" +
				" FROM departs JOIN arrives JOIN Flight" +
				" ON departs.airline_id = arrives.airline_id" +
				" AND arrives.airline_id = Flight.airline_id" +
				" AND departs.flight_number = arrives.flight_number" +
				" AND arrives.flight_number = Flight.flight_number" +
				" WHERE arrives.airport_id = " + request.getParameter("toCity") + 
				" AND departs.airport_id = " + request.getParameter("fromCity") +
				" AND departs.dept_time = " + request.getParameter("depart") +
				" AND arrives.arrv_time = " + request.getParameter("return");
			
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