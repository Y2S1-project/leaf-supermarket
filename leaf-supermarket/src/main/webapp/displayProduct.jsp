<% if ( session.getAttribute("auth1")!= null){%>
<%@page import="connection.DbCon"%>
<%@page import="model.*" %>
<%@page import="dao.*" %>
<%@page import="java.util.List" %><%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    ProductDao pd=new ProductDao(DbCon.getConnection());
    List<Product> products=pd.getAllProducts(); 
%>
<!DOCTYPE html>
<html>
<head>
	<title>Display Product</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel = "stylesheet" href="styles/display.css">
	<meta charset="ISO-8859-1">
</head>
<body>
	<div class="col-md-12">
         <center><h3 class="Ptitle">-Product Information-</h3></center><br>
         	<table class="table">
                    <thead class="bg-light">
						 <tr>
                            <th scope="col">Product Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Unit Price</th>
                            <th scope="col">Increment Unit</th>
                            <th scope="col">Discount</th>
                            <th scope="col">Category</th>
                            <th scope="col">Action</th>
                        </tr>
					</thead>
                    <tbody>
                    <%if(!products.isEmpty()){
						for(Product p:products){%>           
						  <tr>
                             <td><%= p.getName() %></td>
                             <td><%= p.getQuantity() %></td>
                             <td><%= p.getUnitPrice() %></td>
                             <td><%= p.getIncrementUnit() %></td>
                             <td><%= p.getDiscount() %></td>
                             <td><%= p.getCategory() %></td>
                             <td><a class="link" href="editProduct.jsp?id=<%= p.getId() %>">Edit</a> 
                             <a class="link" href="deleteProduct.jsp?id=<%= p.getId() %>">Delete</a></td>
                         </tr>
                        <%}
                    }%>
                  </tbody>
          </table>
	</div>
</body>
</html>
<%}else{
	response.sendRedirect("login.jsp");
}%>