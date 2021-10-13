
<%
if (session.getAttribute("auth") != null && session.getAttribute("auth1") == null) {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
double total = Double.parseDouble(request.getParameter("total"));
%>

<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="styles/payment.css">
	<title>Payment</title>
</head>

<body>

	<div class="block">
		<img id="left" alt="leaf logo" src="images/Leaf.png">
		<img id="right" alt="leaf logo" src="images/HNB.png">
	</div>
	<div class="container">
		<div class="left body">
			<h3 id="req">Payment Details</h3>
			<span>* required field</span>
			<form method="post" action="payment">
			<br><br>
				<div class="payMethod">
					<span>card type *</span> 
					<input type="radio" name="method" required>
					<label for="method"><img alt="visa" src="images/visa.png"></label>
					<input type="radio" name="method" required> <label
						for="method"><img alt="master" src="images/master.png"></label>
				</div>
				<br><br>
				<div class="cardNum">
					<label for="card-number">card number*</label> <br><input type="text"
						name="card-number" pattern=[0-9]{16}
						title="This number is printed on the front side of your credit card"
						required>
				</div>
				<br><br>
				<div class="exp">
					<span> <label for="exp-month">Exp Month *</label> <select
						name="exp-month" id="exp-month" required>
							<option value="" selected disabled hidden>Month</option>
							<option value="January">01</option>
							<option value="February">02</option>
							<option value="March">03</option>
							<option value="April">04</option>
							<option value="May">05</option>
							<option value="June">06</option>
							<option value="July">07</option>
							<option value="August">08</option>
							<option value="September">09</option>
							<option value="October">10</option>
							<option value="November">11</option>
							<option value="December">12</option>
					</select>
					</span> <span> <label for="exp-year">Exp Year *</label> <select
						name="exp-year" id="exp-year" required>
							<option value="" selected disabled hidden>Year</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
					</select>
					</span>
				</div>
				<br><br>
				<div class="cvn">
					<label for="cvn">CVN *</label><br> <input type="text"
						pattern="[0-9]{3,4}"
						title="This code is a three or four digit number printed on the back or front side of your credit card"
						required>
				</div>
				<input type="hidden" name="total" value="<%=total%>"> <input
					type="hidden" name="user_id"
					value=<%=(int) session.getAttribute("auth")%>> <input
					type="submit" value="Pay" id="pay">
			</form>
			<button onclick="window.location.replace('cart.jsp')">Cancel</button>
		</div>
		<div class="right body">
			<h3>Your Order</h3> <br>
			<div class="grey-box">
				<span>total amount</span> <span>Rs <%=total%></span>
			</div>
		</div>
	</div>

	
</body>
</html>
<%
} else {
response.sendRedirect("index.jsp");
}
%>