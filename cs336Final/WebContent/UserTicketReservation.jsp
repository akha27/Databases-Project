<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Reservation</title>
</head>
<body>

		<%String airlineId = request.getParameter("airlineId3"); %>
		<%String flightNumber = request.getParameter("flightNumber"); %>
		<%String bookingPrice = request.getParameter("flightPrice"); %>
		
		<%  double priceEconomy = Double.valueOf(bookingPrice); 
			double priceBusiness = priceEconomy * 1.5;
			double priceFirst = priceEconomy * 2;
			
			double bookingFee = 20.0;
			
			%>		
		
	<table>
		<tr>
			<td>
 				Airline ID: <td><%out.print(airlineId);%></td>
 			<td>
		</tr>
		<tr>
			<td>	
				Flight Number: <td><%out.print(flightNumber);%></td>
			<td>
		</tr>
		<tr>
		<td>	
			<select id="mySelect" onchange="copy();">
				<option value="">Select a Class:</option>
    			<option value="<%out.print(priceEconomy);%>">Economy</option>
    			<option value="<%out.print(priceBusiness);%>">Business Class</option>
    			<option value="<%out.print(priceFirst);%>" >First Class</option>
		</select>		
		</td>
		
		<td><div id="label"></div></td>
		</tr>
		
		<tr>
				<td> 		
					Booking fee: <td>$<%out.print(bookingFee);%></td>
		</tr>
		
		<tr>
		<td>
 				Total price: <td>$<div id="totalPrice"></div></td>
 			<td>
	
			
		</table>
		

		<form method="post" action="PurchaseStatus.jsp">
			<input type="submit" value="BUY">
		</form>

		 <script type="text/javascript"> 
		 	function copy() { document.getElementById("label").innerHTML=document.getElementById("mySelect").value
		 		
				var myString = parseFloat(document.getElementById("mySelect").value)
		 		
		 		myString = myString+20
		 		
		 		document.getElementById("totalPrice").innerHTML= (myString)
		 		
		 		}
    	</script> 
</body>
</html>