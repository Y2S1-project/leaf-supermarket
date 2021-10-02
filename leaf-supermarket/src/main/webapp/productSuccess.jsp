<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Success</title>
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