<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%String airlineId = request.getParameter("airlineId3"); %>
		<%String flightNumber = request.getParameter("flightNumber"); %>
			



	<table>
		<tr>
 			<td><%out.print(airlineId); %></td>
		</tr>
		<tr>
		<td>	
			<%out.print(flightNumber); %>
		</td>
		</tr>
		<tr>
		<td>	
			Price: $40
		</td>
		</tr>
		</table>
		
		<form method="post" action="PurchaseStatus.jsp">
		<input type="submit" value="BUY">
	</form>
</body>
</html>