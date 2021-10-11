<%@page import="connection.DbCon"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Leaf | Cart</title>
<%@include file="includes/bootstrap-head.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price: $ 452</h3>
			<a class="mx-3 btn btn-primary" href="#">Check Out</a>
		</div>
		<table class="table table-loght">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Women Shoes</td>
					<td>Shoes</td>
					<td>45$</td>
					<td>
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="id" value="1" class="form-input">
							<div class="form=group d-flex justify-content-between">
								<a class="btn btn-sm btn-decre" href=""><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" class="form-control" value="1" readonly>
								<a class="btn btn-sm btn-incre" href=""><i
									class="fas fa-plus-square"></i></a>
							</div>
						</form>
					<td><a class="btn btn-sm btn-danger" href="">Remove</a></td>
				</tr>
			</tbody>
		</table>
	</div>

	<%@include file="includes/bootstrap-body.jsp"%>
</body>
</html>