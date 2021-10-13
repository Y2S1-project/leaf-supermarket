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
      <%=name %>
     </a>
     &nbsp&nbsp&nbsp|
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
   <span>
      &nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
      <a class="register" href="register.jsp">Register</a>
   </span>
<%
} 
%>
   </div>

<div class="header-2">
   <a href="index.jsp">
      <img class="logo" src="images/Leaf.png" alt="leaf logo">
   </a>
   <div id="menu-bar" class="fas fa-bars"></div>
   <nav class="navbar">
      <a href="index.jsp">home</a>
      <% 
         if ( session.getAttribute("auth1")!= null){
      %>
      <a href="addProduct.jsp">Add Product</a>
      <a href="displayProduct.jsp">Display Product</a>
      <%
         } 
      %>  
		<a href="vegetable.jsp">Vegetables</a>
		<a href="fruit.jsp">Fruits</a>
		<a href="dairy.jsp">Dairy</a>
		<a href="bakery.jps">Bakery</a>
      <%
         if(session.getAttribute("auth1") == null){ 
      %>
      <a href="contact.jsp">Contact</a>
      <%
         }
      %>
   </nav>
   <div class="action">
      <a href="cart.jsp" onmouseover="active()" onmouseout="inactive()">
         <img class="cart" src="images/cart.svg" alt="shopping cart">
      </a>
   </div>
</div>

<div class="header-3">
	<form action="" class="search-box-container">
		<input type="search" id="search-box" placeholder="search here...">
		<label for="search-box"><img alt="search icon" src="images/search.svg"></label>
	</form>
</div>
  
  <script>
  const element = document.querySelector(".cart")
  function active(){
	  element.classList.toggle('active')
  }
  function inactive(){
	  element.classList.remove('active')
  }
  
  </script>