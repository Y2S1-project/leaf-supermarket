<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Privacy & Policy</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="styles/privacy.css">
	<%@include file="includes/head.jsp" %>
	<link rel="stylesheet" href="styles/index.css">
</head>
<body>
<header>
	<%@include file="includes/navbar.jsp" %>
</header>
	<br>  <center><h1 id="ct_h1">Privacy Policy & Terms of Usage</h1></center>     
            <div class="p_t">	
				<h2 class="thath_h1">Privacy Policy</h2>
				<p>Leaf is committed to protect your privacy. This privacy Policy explains how your personal information is collected, used, and disclosed by Leaf.</p>
				<p>This privacy policy applies to our Leaf website. By accessing or using our service, you signify that you have clearly  read and understood, and agree to our use and disclosure of your personal information as explained in this Privacy Policy and our Terms of Service.</p>
				
					
				<h2 class="thath_h1">Terms Of Usage</h2>
				<p>By using and placing a vendor order with Leaf, you confirm that you are in agreement with our terms and usage as given below. This will be applied to our whole website.</p>
				
					
				<h2 class="thath_h1">What Data Do We Collect?</h2>
				<p>Our website gather information from you when you visit our grocery products, register, place an order to cart, and when filling the forms of our website.</p>
				<li>Name / Username</li>
				<li>Phone Numbers (If necessary)</li>
				<li>Email Addresses</li>
				<li>Debit / credit card information</li>
				<li>Password</li>
				
					
				<h2 class="thath_h1">How Do We Use The Data We Collect From Our Website?</h2>
				<p>These are the ways that we use your data</p>
				<li>To personalize your experience when you search a grocery product</li>
				<li>To improve our customer service</li>
				<li>To improve our website services according to your feedbacks</li>
				<li>To process online payments</li>
				
					
				<h2 class="thath_h1">Where And When Is Data Collected From Our Customers?</h2>
				<p>The data you submit will be collected by our website.</p>
				
					
				<h2 class="thath_h1">How Do We Use The Email Address You Entered When You Are Registering?</h2>
				<p>When you  subscribe to our Newsletter, you agree to receive emails from us. You can cancel receiving emails from us by clicking unsubscribe button. The payment processing email will not be used for any subscribed services.</p>
				
					
				<h2 class="thath_h1">Can A Customer Can Update The Data They Entered?</h2>
				<p>Customer can update their personal data from the profile update option.<p/>
				
					
				<h2 class="thath_h1">How long do we keep your data entered to the website?</h2>
				<p>Our website will keep your data as long as you use our website. When there is no need to keep your data, we will remove your data from the system.</p>
				
					
				<h2 class="thath_h1">How Do We secure Your Data?</h2>
				<p>We ensure that the username and password details, and the payment details will not be disclosed to anyone.</p>
				
					
				<h2 class="thath_h1">Term And Termination</h2>
				<p>The agreement will remain until terminated by our website or customer</p>
				
					
				<h2 class="thath_h1">Customer Consent</h2>
				<p>By accessing our website, registering to our website account, or making online payment, Customer should consent to our privacy Policy and Terms of usage.</p>
				
					
				<h2 class="thath_h1">Updates To Our Privacy Policy And Terms Of Usage</h2>
				<p>We may update our privacy policy and terms of usages anytime according to the needs of our website.</p>
				
					
				<h2 class="thath_h1">Cookies</h2>
				<p>Our website use cookies to personalize the content you visited in our website. A cookie is a small piece of data on your device stored by your web browser. You can disable your cookies by your browser. If you disable the cookies, you cannot be accessed the our website functions correctly.</p>
				
					
				<h2 class="thath_h1">Sessions</h2>
				<p>Our website use sessions to identify the places of the website you have visited. A session is a small piece of data on your device stored by your web browser.</p>
				
					
				<h2 class="thath_h1">Contact Us</h2>
				<p>Feel free to contact us</p>
				<li>Via Email: leaf.super0@gmail.com</li>
				
			</div><br>
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
<%@include file="includes/footer.jsp" %>
</footer>	
</body>
</html>
