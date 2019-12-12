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
String insertTicket = "INSERT INTO Ticket(ticket_number, purchase_datetime, booking_fee, total_fare, one_way_or_round) VALUES(?, LOCALTIME(), 20, ?, 0);";
String insertSubticket = "INSERT INTO Subticket(subticket_number, ticket_number, seat_number, class, special_meal, flight_number, airline_id) VALUES(?, ?, ?, ?, 0, ?, ?);";
String insertReservation = "INSERT INTO Reservation (reservation_id, flexibility) VALUES (?, 0)";
String insertReserves = "INSERT INTO reserves (reservation_id, ticket_number) VALUES (?, ?);";
String insertMakes = "INSERT INTO makes (reservation_id, user_name) VALUES (?, ?);";
String updateCap = "UPDATE Flight SET remaining_cap = remaining_cap - 1 WHERE flight_number = ? AND airline_id = ?;";

boolean registrationStatus = false;

try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement stmt = con.createStatement();
			
			String airlineId = request.getParameter("airlineId");
			int flightNumber = Integer.parseInt(request.getParameter("flightNumber"));
			String classType = request.getParameter("mySelect").charAt(0) + "";
			int price = Integer.parseInt(request.getParameter("totalPrice"));
			int ticketNumber = (int)(Math.random() * 1000000);
			int subticketNumber = (int)(Math.random() * 1000000);
			int reservationId = (int)(Math.random() * 1000000);			
			String uname = (String)session.getAttribute("uName");
						
			PreparedStatement ps1 = con.prepareStatement(insertTicket);
			ps1.setInt(1, ticketNumber);
			ps1.setInt(2, price);
			PreparedStatement ps2 = con.prepareStatement(insertSubticket);
			ps2.setInt(1, subticketNumber);
			ps2.setInt(2, ticketNumber);
			ps2.setString(3, "E27");
			ps2.setString(4, classType);
			ps2.setInt(5, flightNumber);
			ps2.setString(6, airlineId);
			PreparedStatement ps3 = con.prepareStatement(insertReservation);
			ps3.setInt(1, reservationId);
			PreparedStatement ps4 = con.prepareStatement(insertReserves);
			ps4.setInt(1, reservationId);
			ps4.setInt(2, ticketNumber);
			PreparedStatement ps5 = con.prepareStatement(insertMakes);
			ps5.setInt(1, reservationId);
			ps5.setString(2, uname);
			PreparedStatement ps6 = con.prepareStatement(updateCap);
			ps6.setInt(1, flightNumber);
			ps6.setString(2, airlineId);
			
			
			registrationStatus = true;

			
			ps1.executeUpdate();
			ps2.executeUpdate();
			ps3.executeUpdate();
			ps4.executeUpdate();
			ps5.executeUpdate();
			ps6.executeUpdate();
 
			con.close();			

		} catch (Exception e) {
			out.print(e);
		} %>
		
	<h1>Success</h1>
	
	<div class= "rightLogout">
				<form method="post" action="LogOut.jsp">
				<input type="submit" value="Log out">
			</form> 
    	 </div>

</body>
</html>