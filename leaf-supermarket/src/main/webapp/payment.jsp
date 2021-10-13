
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
	<%@include file="includes/head.jsp"%>
	<link rel="stylesheet" href="styles/index.css">
	<link rel="stylesheet" href="styles/payment.css">
	<title>Payment</title>
</head>

<body>
	<header>
		<%@include file="includes/navbar.jsp" %>
	</header>
	<div class="block">
		<img alt="" src="">
	</div>
	<div class="container">
		<div class="left body">
			<h3>Payment Details</h3>
			<span>* required field</span>
			<form method="post" action="payment">
				<div class="payMethod">
					<span>card type *</span> <input type="radio" name="method" required>
					<label for="method"><img alt="visa" src="images/visa.png"></label>
					<input type="radio" name="method" required> <label
						for="method"><img alt="master" src="master.png"></label>
				</div>
				<div class="cardNum">
					<label for="card-number">card number</label> <input type="text"
						name="card-number" pattern=[0-9]{16}
						title="This number is printed on the front side of your credit card"
						required>
				</div>
				<div class="exp">
					<span> <label for="exp-month">Expiration Month *</label> <select
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
					</span> <span> <label for="exp-year">Expiration Year *</label> <select
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
				<div class="cvn">
					<label for="cvn">CVN *</label> <input type="text"
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
			<h3>Your Order</h3>
			<div class="grey-box">
				<span>total amount</span> <span>Rs <%=total%></span>
			</div>
		</div>
	</div>

	<footer>
		<script>

let menu = document.querySelector('#menu-bar');
let navbar = document.querySelector('.navbar');
let header = document.querySelector('.header-2');

menu.addEventListener('click', () =>{
    menu.classList.toggle('fa-times');
    navbar.classList.toggle('active');
});

window.onscroll = () =>{
    menu.classList.remove('fa-times');
    navbar.classList.remove('active');

    if(window.scrollY > 150){
        header.classList.add('active');
    }else{
        header.classList.remove('active');
    }

}

</script>
		<%@include file="includes/footer.jsp"%>
	</footer>
</body>
</html>
<%
} else {
response.sendRedirect("index.jsp");
}
%>