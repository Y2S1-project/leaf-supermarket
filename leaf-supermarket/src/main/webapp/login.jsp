 <% if ( session.getAttribute("auth")== null){%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>Login</title>
<link rel="stylesheet" href="styles/login.css">	
</head>
<body>
	<section>
		<div class="contentBx">
			<div class="formBx">
				<center><h2>Login</h2></center>
				<form action="LoginServlet" method="post">
					<div class="inputBx">
						<span>User Email</span>
						<input type="email" name="email" required>
					</div>
					<div class="inputBx">
						<span>Password</span>
						<input type="password" name="password" required>
					</div>
					<div class="inputBx">
						<input type="submit" value="Login">
					</div>
					<div class="inputBx">
						<p> Don't have an account? <a href="register.jsp">  Register With Us </a></p>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>
<% }else{
	response.sendRedirect("index.jsp");
}%>