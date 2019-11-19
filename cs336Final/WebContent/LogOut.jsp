<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log out</title>
</head>
<body>
    <%
    	session.setAttribute("uName", null);
		session.invalidate();
		response.sendRedirect("LogIn.jsp");
	%>
</body>
</html>