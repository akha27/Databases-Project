<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Reservation</title>
</head>
<body>

		<%String airlineId = request.getParameter("airlineId"); %>
		<%String flightNumber = request.getParameter("flightNumber"); %>
		<%String bookingPrice = request.getParameter("flightPrice"); %>
		
		<%  double priceEconomy = Double.valueOf(bookingPrice); 
			double priceBusiness = priceEconomy * 1.5;
			double priceFirst = priceEconomy * 2;
			
			double bookingFee = 20.0;
			
			%>		
			
<form method="post" action="PurchaseStatus.jsp">
		
	<table>
		<tr>
			<td>
 				Airline ID: <td><input type="text" name="airlineId" readonly value="<%out.print(airlineId); %>"/></td>
 			<td>
		</tr>
		<tr>
			<td>	
				Flight Number: <td><input type="text" name="flightNumber" readonly value="<%out.print(flightNumber); %>"/></td>
			<td>
		</tr>
		<tr>
		<td>	
			<select id="mySelect" name="mySelect" onchange="copy();">
				<option value="">Select a Class:</option>
    			<option value="<%out.print("E" + priceEconomy);%>">Economy</option>
    			<option value="<%out.print("B" + priceBusiness);%>">Business Class</option>
    			<option value="<%out.print("F" + priceFirst);%>" >First Class</option>
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
 				Total price:$ <td> <input type="text" id="totalPrice" name="totalPrice" readonly value=""/> </td>
 		<td>			
		</table>
		

			<input type="submit" value="BUY">
		</form>

		 <script type="text/javascript"> 
		 	function copy() { document.getElementById("label").innerHTML=document.getElementById("mySelect").value.substring(1)
		 		
				var myString = parseFloat(document.getElementById("mySelect").value.substring(1))
		 		
		 		myString = myString+20
		 		
		 		document.getElementById("totalPrice").value= (myString)
		 		
		 		}
    	</script> 

</body>
</html>