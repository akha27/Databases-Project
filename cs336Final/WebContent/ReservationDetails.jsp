<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.ApplicationDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Details</title>
</head>
<body>
	<%
		String deleteMakes = "DELETE FROM makes WHERE reservation_id = ?";
		String deleteReserves = "DELETE FROM reserves WHERE reservation_id = ?";
		String deleteReservation = "DELETE FROM Reservation WHERE reservation_id = ?";
		
		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement stmt = con.createStatement();
			
			int reservationId = Integer.parseInt(request.getParameter("reservationId"));			
						
			PreparedStatement ps1 = con.prepareStatement(deleteMakes);
			ps1.setInt(1, reservationId);
			PreparedStatement ps2 = con.prepareStatement(deleteReserves);
			ps2.setInt(1, reservationId);
			PreparedStatement ps3 = con.prepareStatement(deleteReservation);
			ps3.setInt(1, reservationId);
			
			ps1.executeUpdate();
			ps2.executeUpdate();
			ps3.executeUpdate();
		} catch (Exception e) {
			out.print(e);
		}
	%>
	<h2>Reservation Canceled</h2>
</body>
</html>