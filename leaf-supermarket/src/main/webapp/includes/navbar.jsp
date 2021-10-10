<%String name;
   if(session.getAttribute("auth") != null && session.getAttribute("auth1") == null){
      name = (String) session.getAttribute("username");	
   }else if(session.getAttribute("auth1") != null){
      name = (String) session.getAttribute("adminname");
   }else{
      name = "Guest";
   }
%>
<div class="header-1">
   <span>
     <img class="log" src="images/user.svg">
     Welcome,&nbsp
     <a class="profile" href="UserAccountDisplay.jsp">
<%
out.print(name); 
%>
     </a>
     &nbsp|
   </span>
<%
if(session.getAttribute("auth") != null){ 
%>
   <span class="log-right">
      <img class="log" src="images/logout.svg">
      &nbsp
      <a class="logout" href="LogOutServlet">
         Logout
      </a>
   </span>
<%
}else{ 
%>
   <span class="log-right">
      <img class="log" src="images/login.svg">
      &nbsp
      <a class="logout" href="login.jsp">
         Login
      </a>
   </span>
<%
} 
%>
   </div>

<div class="header-2">
   <a href="index.jsp">
      <img class="logo" src="images/Leaf.png" alt="leaf logo">
   </a>
   <a href="#">
      <img class="cart" src="images/cart.svg" alt="shopping cart" onmouseover="active()" onmouseout="inactive()">
   </a>
</div>

<!-- <div class="header-3">

	<div id="menu-bar" class="fas fa-bars"></div>
	<nav class="navbar">
		<a href="#home">home</a> <a href="#category">category</a> <a
			href="#product">product</a> <a href="#deal">deal</a> <a
			href="#contact">contact</a>
	</nav>

	<form action="" class="search-box-container">
		<input type="search" id="search-box" placeholder="search here...">
		<label for="search-box" class="fas fa-search"></label>
	</form>
</div>
 -->

<!-- 
 
 <% if ( session.getAttribute("auth1")!= null){%>
<a href="addProduct.jsp">Add Product</a>
<a href="displayProduct.jsp">Display Product</a>
<%} %>
<%if(session.getAttribute("auth") == null){%>
<a href="login.jsp">Login</a>
<a href="register.jsp">Register</a>
<%} %>
<%if(session.getAttribute("auth1") == null){ %>
<a href="product.jsp">Product</a>
<%} %>
<%if(session.getAttribute("auth") != null){ %>
<a href="LogOutServlet">Logout</a>
<%} %>
<%if(session.getAttribute("auth") != null && session.getAttribute("auth1") == null){ %>
<a href="contact.jsp">Contact</a>
<a href="UserAccountDisplay.jsp">User Account</a>
<%} %>
<a href="privacy.jsp">Privacy</a>
 
 
  -->
  
  <script>
  const element = document.queryselector(".cart")
  function active(){
	  element.classList.toggle('active')
  }
  function inactive(){
	  element.classList.remove('active')
  }
  
  </script>