
<%
if (session.getAttribute("auth1") == null) {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%if(session.getAttribute("auth") != null){ %>
		<h1>Welcome user</h1>
	<%}
	else{%>
		<h1>Welcome Guest</h1> 
	<%}%>
</body>
</html>
<%
} else {
response.sendRedirect("login.jsp");
}
%>