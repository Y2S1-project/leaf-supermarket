<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="connection.DbCon"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
int id = (int)session.getAttribute("auth");
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getCategoryProducts(12);
%>

<!DOCTYPE html>
<html>
	<head>
		<%@include file="includes/bootstrap-head.jsp" %>
		<title>Insert title here</title>
			<%@include file="includes/head.jsp" %>
		<link rel="stylesheet" href="styles/index.css">
		<link rel="stylesheet" href="styles/categoryDisplay.css">
		
	</head>
<body>
	<header>
		<%@include file="includes/navbar.jsp" %>
	</header>
	<div class="container">
		<div class="card-header my-3"><center>Personal Safety Products</center></div>
		<div class="category-head"><img src="images/personal-safety-banner.jpeg" alt="fruit banner"></div>
		<div class="row">
		<%
			if(!products.isEmpty()) {
				for(Product p:products) { %>
					<div class="col-md-3 my-3">
					<form action="add-product-to-cart" method="post">
						<div class="card w-100" style="width: 18rem;">
							<img src="images/<%= p.getImage() %>" class="card-img-top" alt="product image">
							<div class="card-body">
								<input type="hidden" name="productID" value="<%= p.getId()%>">
								<input type="hidden" name="userID" value="<%= id %>">
								<input type="hidden" name="unitPrice" value="<%= p.getUnitPrice() %>">
								<input type="hidden" name="increment-unit" value="<%= p.getIncrementUnit() %>">
								<h5 class="card-title"><%= p.getName() %></h5>
								<h6 class="price">Rs. <%= p.getUnitPrice() %></h6>
								<a href="cart.jsp"><button type="submit" class="btn btn-success">Add to Cart</button></a> 
							</div>
						</div>
					</form>
					</div>
				
			<%}
		}%>
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
<%@include file="includes/footer.jsp" %>
</footer>
</body>
</html>