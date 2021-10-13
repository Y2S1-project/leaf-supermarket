<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Leaf Online</title>
<%@include file="includes/head.jsp" %>
<link rel="stylesheet" href="styles/index.css">
</head>
<body>

<header>
	<%@include file="includes/navbar.jsp" %>
</header>
 <main>
<section class="home" id="home">

    <div class="image">
        <img src="images/home-img.png" alt="">
    </div>

    <div class="content">
        <span>fresh and organic</span>
        <h3>your daily need products</h3>
        <a href="#category" class="btn">get started</a>
    </div>

</section>
<div class="motto">
   <div class="flex">  
      <img alt="" src="images/schedule.svg"> 
      <span>Delivery within 24 Hours</span>
   </div>
   <div class="flex">   
      <img alt="" src="images/delivery.svg">
      <span>Deliver to Doorstep</span>
   </div>
   <div class="flex">
      <img alt="" src="images/verify.svg">
      <span>Freshness Guaranteed</span>   
   </div>
</div>
<!-- home section ends -->
<h1 class="heading">shop by <span>category</span></h1>
<section class="banner-container">

    <div class="banner">
        <img src="images/food-cupboard-home-banner.jpeg" alt="">
        <div class="content">
            <p>A range of </p>
            <h3>Fresh Vegetables</h3>
            <p>From farm to store within 24 hours.</p>
            <a href="vegetable.jsp" class="btn">Explore fresh range</a>
        </div>
    </div>

    <div class="banner" id="banner2">
        <img  src="images/hand-sanitizer-home.jpeg" alt="">
        <div class="content">
            <p>To keep you safe</p>
            <h3>A range of Personal Safety products</h3>
            <p>To choose from</p>
            <a href="personal-care.jsp" class="btn">Explore range</a>
        </div>
    </div>
    <br><br> <br>
    <div class="banner">
        <img src="images/beverages-home-banner.jpeg" alt="">
        <div class="content">
            <p>A range of </p>
            <h3>Delicious Beverages</h3>
            <p>To quench your thirst</p>
            <a href="beverages.jsp" class="btn">Explore fresh range</a>
        </div>
    </div>

    <div class="banner" id="banner2">
        <img  src="images/household-home-banner.jpeg" alt="">
        <div class="content">
            <p>To keep your life beautiful</p>
            <h3>A range of Personal Care products</h3>
            <p>To choose from</p>
            <a href="dairy.jsp" class="btn">Explore range</a>
        </div>
    </div>
    
    
    <div class="banner" id="banner2">
        <img  src="images/frozen-food-home-banner.jpeg" alt="">
        <div class="content">
            <p>To keep your life beautiful</p>
            <h3>A range of Personal Care products</h3>
            <p>To choose from</p>
            <a href="dairy.jsp" class="btn">Explore range</a>
        </div>
    </div>
    
    
    <div class="banner" id="banner2">
        <img  src="images/pharmacy-home-banner.jpeg" alt="">
        <div class="content">
            <p>To keep your life beautiful</p>
            <h3>A range of Personal Care products</h3>
            <p>To choose from</p>
            <a href="dairy.jsp" class="btn">Explore range</a>
        </div>
    </div>
    
    
    <div class="banner" id="banner2">
        <img  src="images/baby-home-banner.jpeg" alt="">
        <div class="content">
            <p>To keep your life beautiful</p>
            <h3>A range of Personal Care products</h3>
            <p>To choose from</p>
            <a href="dairy.jsp" class="btn">Explore range</a>
        </div>
    </div>
    
    
    <div class="banner" id="banner2">
        <img  src="images/personal-care-home-banner.jpeg" alt="">
        <div class="content">
            <p>To keep your life beautiful</p>
            <h3>A range of Personal Care products</h3>
            <p>To choose from</p>
            <a href="dairy.jsp" class="btn">Explore range</a>
        </div>
    </div>

</section>



 </main>
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