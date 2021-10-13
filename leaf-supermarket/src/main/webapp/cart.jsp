<%if(session.getAttribute("auth") != null && session.getAttribute("auth1") == null){ %>
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
    List<Product> products= pd.displayCartProducts(); 
    ProductDao pd1 = new ProductDao(DbCon.getConnection());
    double total = pd1.getTotal((int)session.getAttribute("auth"));
    
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
			<h3>Total Price: Rs. <%=total %> </h3>
			<a class="mx-3 btn btn-primary" href="checkOut.jsp?total=<%=total%>">Check Out</a>
		</div>
		<table class="table table-loght">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
			<%if(!products.isEmpty()){
						for(Product p:products){%>           
						  <tr>
                             <td><%= p.getName() %></td>
                             <td><%= p.getCategory() %></td>
                             <td><%= p.getUnitPrice()*p.getInc() %></td>
                             <% total += p.getUnitPrice()*p.getInc();%>
                             <td>                             
                             	<form method="post" action="IncrementServlet">
                             		<input type="hidden" name="product-id" value="<%= p.getId()%>">
                             		<input type="hidden" name="unit-price" value="<%= p.getUnitPrice()%>">
                             		<input type="number" name="increment" value="<%= p.getInc() %>" min=<%=p.getIncrementUnit() %> max=100 step="<%=p.getIncrementUnit() %>">
                             		<button type="submit" class="btn btn-success">Submit</button>                             		
                           		</form>
                           		<form method="post" action="remove-product">
                           			<input type="hidden" name="product-id" value="<%= p.getId()%>">
                           			<input type="hidden" name="userId" value="<%= (int)session.getAttribute("auth")%>">
                           			<button type="submit" class="btn btn-danger">Remove</button>
                           		</form>
                           		</td>
                         </tr>
                        <%}
                    }%>
		

			</tbody>
		</table>
	</div>

	<%@include file="includes/bootstrap-body.jsp"%>
</body>
</html>
<%}else{
   response.sendRedirect("index.jsp");
   }
%>
   
   