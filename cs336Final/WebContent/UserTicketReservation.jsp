<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%String airlineId = request.getParameter("airlineId"); %>
		<%String flightNumber = request.getParameter("flightNumber"); %>
			


		<form method="post" action="PurchaseStatus.jsp">
			<table>
				<tr>
 			 		<td>
  						<input type="text" name="airlineId" readonly value="<%out.print(airlineId); %>"/>
  			 		</td>
    			</tr>
				<tr>
					<td colspan="2">
    					<input type="text" name="flightNumber" readonly value="<%out.print(flightNumber); %>"/>
    				</td>
				</tr>
				<tr>
					<td>	
						Price: $40
					</td>
				</tr>
			</table>
		<input type="submit" value="BUY">
		</form>
	</form>
</body>
</html>