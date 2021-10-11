<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="connection.DbCon"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/bootstrap-head.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
					<div class="col-12 col-sm-8 col-md-6 col-lg-4">
						<div class="card">
							<img class="card-img"
								src="images/productDefault.jpg"
								alt="Product Image">
							<div class="card-img-overlay d-flex justify-content-end">
						
							</div>
							<div class="card-body">
								<h4 class="card-title"><%= p.getName() %></h4>
								<h6 class="card-subtitle mb-2 text-muted"><%= p.getCategory() %></h6>
								<div class="options d-flex flex-fill">
									<select class="custom-select ml-1">
										<option selected><%= p.getIncrementUnit() %></option>
										<option value="1">41</option>
										<option value="2">42</option>
										<option value="3">43</option>
									</select>
								</div>
								<div
									class="buy d-flex justify-content-between align-items-center">
									<div class="price text-success">
										<h5 class="mt-4">Rs. <%= p.getUnitPrice() %></h5>
									</div>
									<a href="#" class="btn btn-danger mt-3"><i
										class="fas fa-shopping-cart"></i> Add to Cart</a>
								</div>
							</div>
						</div>
					</div>
			<%
			}
			}
			%>
		</div>
	</div>
	<%@include file="includes/bootstrap-body.jsp"%>
</body>
</html>