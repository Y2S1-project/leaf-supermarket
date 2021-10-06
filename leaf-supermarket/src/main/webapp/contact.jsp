<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Contact Us</title>
	<meta charset = "UTF-8">
	<meta http-equiv="X-UA-Comptible" content = "IE=edge">
	<meta name = "viewport" content ="width=device-width,initial-scale=1.0">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel = "stylesheet" href="styles/contact.css">
</head>
<body>
<div class="contact">
	<section class="contact-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2">
					<form action="ContactServlet" method="post" class="contact-form">
						<div class="contact-title mt-5">
							<center><h2>Contact Us</h2></center>
						</div>
						<div class="row">
							<div class="col-md-6">
								<input type="text" name = "name" placeholder = "Full Name" required>
							</div>
							<div class="col-md-6">
								<input type="text" name = "email" placeholder = "Email" required>
							</div>
							<div class="col-md-6">
								<input type="text" name = "telephone" placeholder = "Phone Number" required>
							</div>
							<div class="col-md-6">
								<select name="type" required>
									<option value = "Genaral Inquiry ">General Inquiry</option>
									<option value = "Advertising ">Delivery Issue</option>
									<option value = "Jobs ">Jobs</option>
									<option value = "Product issue ">Product issue</option>
									<option value = "Account settings ">Account settings</option>
									<option value = "Availability ">Availability</option>
									<option value = "Reviews ">Reviews</option>
									<option value = "Feedback ">Feedback</option>
									<option value = "Other ">Other</option>	
								</select>
							</div>
							<div class="col-md-12">
								<textarea name = "message" placeholder ="Message Here" required></textarea>
							</div>
							<div class="col-md-12">
								<div class="contact-btn">
									<button type="submit">Submit Now</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section><br><br>
	</div>
</body>

 
</html>