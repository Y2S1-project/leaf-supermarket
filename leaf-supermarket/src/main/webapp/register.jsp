 <% if ( session.getAttribute("auth")== null){%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="styles/register.css">
	<title>Register</title>
<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirm-password").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script> 
</head>
<body>
	<div class="inside">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<h1 class="text-left">Register With Us</h1>
				<p class="text-left">Leaf is a biggest online sustenance and grocery store located in Colombo. With more than 18,000 items and over a 1000 brands in our list you will discover all that you are searching for. Appropriate from new Fruits and Vegetables, Rice and Lentils, Spices and Seasonings to Packaged items, Beverages, Personal consideration items, Meats. Join with us to enjoy our services.</p>
			
			</div>
			<div class="col-md-5">
				<div class="row">
					<div class="col-md-6">
						<h3 class="text-left">Register With Us</h3>
					</div>
					<div class="col-md-6">
						<span class="glyphicon glyphicon-pencil"></span></div>
					</div>
					<hr>
					<form action="RegisterServlet" method="post">
					<div class="row">
						<label class="label col-md-2 control label">Name</label>
						<div class="col-md-10">
							<input type="text" class="form-control" name="name" placeholder="User Name" required>
						</div>
					</div>
					<div class="row">
						<label class="label col-md-2 control label">Email</label>
						<div class="col-md-10">
							<input type="email" class="form-control" name="email" placeholder="User Email" required>
						</div>
					</div>
					<div class="row">
						<label class="label col-md-2 control label">Password</label>
						<div class="col-md-10">
							<input type="password" class="form-control" name="password" id="password"placeholder="User Password" required>
						</div>
					</div>
					<div class="row">
						<label class="label col-md-2 control label">Confirm Password</label>
						<div class="col-md-10">
							<input type="password" class="form-control" name="confirm-password" id="confirm-password" placeholder="Re-enter Password" required>
						</div>
					</div>
					<button type="submit" onclick="return Validate()" id="submit" class="btn btn-info">Submit</button>
					</form>
				</div>
			
			</div>
			
	</div>
</div>
</body>
</html>
<%}
 else{
	response.sendRedirect("index.jsp");
}%>