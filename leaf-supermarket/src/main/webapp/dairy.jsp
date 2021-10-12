<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="connection.DbCon"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getCategoryProducts(6);
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/bootstrap-head.jsp" %>
<title>Insert title here</title>
<link rel="stylesheet" href="styles/vegetable.css">

</head>
<body>

	<div class="container">
		<div class="card-header my-3">Diary Products</div>
		<div class="row">
		<%
			if(!products.isEmpty()) {
				for(Product p:products) { %>
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
						<img src="images/<%= p.getImage() %>" class="card-img-top" alt="product image">
						<div class="card-body">
							<h5 class="card-title"><%= p.getName() %></h5>
							<h6 class="price">Rs. <%= p.getUnitPrice() %></h6>
							<h6 class="category"><%= p.getCategory() %></h6>
							<div class="mt-3 d-flex justify-content-between">
								<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>
				
				<%}
			}
		%>
		</div>
	</div>
	<%@include file="includes/bootstrap-body.jsp"%>
</body>
</html>