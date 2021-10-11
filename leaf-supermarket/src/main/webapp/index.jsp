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
        <img src="images/banner-1.jpg" alt="">
        <div class="content">
            <p>A range of </p>
            <h3>Fresh Vegetables</h3>
            <p>From farm to store within 24 hours.</p>
            <a href="vegetable.jsp" class="btn">Explore fresh range</a>
        </div>
    </div>

    <div class="banner" id="banner2">
        <img  src="images/banner-2.jpg" alt="">
        <div class="content">
            <p>Value has never looked so good</p>
            <h3>A range of Dairy Products</h3>
            <p>To choose from</p>
            <a href="dairy.jsp" class="btn">Explore range</a>
        </div>
    </div>

</section>

<!-- product section starts  -->

<section class="category" id="product">

    <h1 class="heading">latest <span>products</span></h1>

    <div class="box-container">

        <div class="box">
            <img src="images/product-1.png" alt="">
            <h3>organic banana</h3>
            <div class="price"> Rs 10.50 <span> $13.20 </span> </div>
            <div class="quantity">
                <span>quantity : </span>
                <input type="number" min="1" max="1000" value="1">
                <span> /kg </span>
            </div>
            <a href="#" class="btn">add to cart</a>
        </div>
        <div class="box"></div>
        <div class="box"></div>
        <div class="box"></div>

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