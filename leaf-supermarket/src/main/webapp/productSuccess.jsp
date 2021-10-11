<% if ( session.getAttribute("auth1")!= null){%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Product Success</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<style>
		.card {
  			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  			transition: 0.3s;
  			width: 40%;
  			height:150px;
  			margin-right:20px;
  			margin-left:400px;
  			margin-top:150px;
  			background-color: #17141d; 
		}
		.card:hover {
  			box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}
		.container {
  			padding: 2px 16px;
		}
		.header{
			color: white;
		}
		@media(max-width:768px){
			.card{
				display:flex;
				justify-content:center;
				align-items:center;
				width:100%;
				height:100%;
				z-index:1;
			}
		}
	</style>
</head>
<body>
	<div class="card">
  		<img style="width:100%">
  		<div class="container">
			<h3 class="header">New Product is successfully entered to the system.</h3>
			<a href="displayProduct.jsp"><button type="button" class="btn btn-danger">Okay</button></a>
        </div>
	</div>
</body>
</html>
<%}else{
	response.sendRedirect("login.jsp");
}%>