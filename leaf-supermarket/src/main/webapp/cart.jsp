<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	//ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");	
	//List<Cart> cartProduct = null;
	//if(cart_list != null) {
		//ProductDao pDao = new ProductDao(DbCon.getConnection());
		//cartProduct = pDao.getCartProducts(cart_list);
		//double total = pDao.getTotalCartPrice(cart_list);
		///request.setAttribute("cart_list", cart_list);
		//request.setAttribute("total", total);
	//}
	 ProductDao pd=new ProductDao(DbCon.getConnection());
    List<Product> products=pd.displayCartProducts(); 
%>
<!DOCTYPE html>
<html>
<head>
<title>Leaf | Cart</title>
<%@include file="includes/bootstrap-head.jsp" %>

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
			<h3>Total Price: Rs. ${ total } </h3>
			<a class="mx-3 btn btn-primary" href="#">Check Out</a>
		</div>
		<table class="table table-loght">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<%
				//if(cart_list != null) {
					//for(Cart c:cartProduct) { %>
			<%if(!products.isEmpty()){
						for(Product p:products){%>           
						  <tr>
                             <td><%= p.getName() %></td>
                             <td><%= p.getCategory() %></td>
                             <td><%= p.getUnitPrice() %></td>
                             <td><%= p.getIncrementUnit() %></td>
                         </tr>
                        <%}
                    }%>
						
					<!-- 	<tr>
					/<td><%//= c.getName() %></td>
					<td><%//= c.getCategory() %></td>
						<td><%//= c.getUnitPrice() %></td>
						<td>
							<form action="" method="post" class="form-inline">
								<input type="hidden" name="id" value="1" class="form-input">
								<div class="form=group d-flex justify-content-between">
									<!-- <a class="btn btn-sm btn-decre"  href="quantity-inc-dec?action=dec&id=<%//= c.getId()%>"<i
										class="fas fa-minus-square"></i></a> -->
									<!-- 	<input type="number" name="quantity" class="form-control" value=<%//= c.getQuantity() %> max="2000" min="1" step=<%//= c.getIncrementUnit() %> > -->
									<!--  <a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%//= c.getId()%>"><i
										class="fas fa-plus-square"></i></a> -->
						<!-- 
						</div>
							</form>
						<td><a class="btn btn-sm btn-danger" href="">Remove</a></td>
					</tr> -->
						 

			<!-- %> -->

			</tbody>
		</table>
	</div>

	<%@include file="includes/bootstrap-body.jsp"%>
</body>
</html>