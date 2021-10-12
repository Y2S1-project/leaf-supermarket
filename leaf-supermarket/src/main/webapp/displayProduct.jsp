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
	<%@include file="includes/head.jsp" %>
	<link rel="stylesheet" href="styles/index.css">
</head>
<body>
<header>
	<%@include file="includes/navbar.jsp" %>
</header>
	<div class="inside">
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
<%}else{
	response.sendRedirect("login.jsp");
}%>
