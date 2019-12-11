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



	<table>
		<tr>
 			<td><%out.print(airlineId); %></td>
<%--   				<td colspan="2"><%out.print(result.getString("arrives.flight_number")); %></td>
 --%>		</tr>
		</table>
</body>
</html>