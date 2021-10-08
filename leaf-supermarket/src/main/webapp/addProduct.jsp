<% if ( session.getAttribute("auth1")!= null){%>
<%@page import="model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Add Product</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<meta charset="ISO-8859-1">
	<style>
		.inside{
			background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url(images/addproduct.jpg);
			background-size:cover;
		}
    	.inner{
        	margin: 0 auto;
         	width: 500px;
         	display: block;
         	padding: 50px 0;
         	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
     	}
     	.inside h3{
         	text-align: center;
         	margin-bottom: 20px;
         	color:white;
         	font-weight:700;
		 	font-size:2em;
      	}
      	.inside .form-group{
         	color:white;
      	}
      	.inside .form-group input{
         	width:100%;
			padding : 10px 20px;
			outline :none;
			font-weight:400;
			border:2px solid #607d8b;
			font-size:16px;
			letter-spacing:1px;
			color:#607d8b;
			background:transparent;
			border-radius:30px;	
      	}
      	.inside .form-group select{
         	width:100%;
			padding : 10px 20px;
			outline :none;
			font-weight:400;
			border:2px solid #607d8b;
			font-size:16px;
			letter-spacing:1px;
			color:#607d8b;
			background:transparent;
			border-radius:30px;	
			height:47px;
      	}
      	.mybtn{
      		width:100%;
			padding : 10px 20px;
			outline :none;
			font-weight:400;
			border:2px solid #607d8b;
      		background:#013220;
			color:#fff;
			outline:none;
			border:none;
			font-weight:500;
			cursor:pointer;
			border-radius:30px;	
			font-size:20px;
      	}
      	@media(max-width:765px){
			.inside{
				width:100%;
				height:100%;
			}	
		}
	</style>
</head>
<body>
	<div class="inside">
   		<div class="inner">
            <div class=" container">
                <div class="row">
                    <div class="col-12">
       					<h3>Add New Product</h3>
						<form action="AddProductServlet" method="post">
              				<div class="form-group">
                   				<label>Product Name</label>
                   				<input class="form-control" name="name"  required>
              				</div>
			  				<div class="form-group">
                   				<label>Quantity</label>
                   				<input class="form-control" name="quantity"  required>
               				</div>
			  				<div class="form-group">
                   				<label>Unit Price</label>
                   				<input class="form-control" name="unitPrice"  required>
              				</div>
              				<div class="form-group">
                   				<label>Product Increment Unit</label>
                   				<input class="form-control" name="incrementUnit"  required>
              				</div>
			  				<div class="form-group">
                   				<label>Discount</label>
                   				<input class="form-control" name="discount" required>
              				</div>
			  				<div class="form-group">
                   				<label>Product Category</label> 
                   				<select id="inputState" class="form-control" name="category">
        							<option value="Vegetable">Vegetable</option>
        							<option value="Fruit">Fruit</option>
        							<option value="Bakery">Bakery</option>
        							<option value="Beverages">Beverages</option>
        							<option value="Baby Products">Baby Products</option>
        							<option value="Diary">Diary</option>
        							<option value="Food Cupboard">Food Cupboard</option>
        							<option value="Frozen Food">Frozen Food</option>
        							<option value="Personal Care">Personal Care</option>
        							<option value="Pharmacy">Pharmacy</option>
        							<option value="Personal Safety">Personal Safety</option>
        							<option value="Household">Household</option>
      							</select>
              				</div>
			  				<input type="submit" value="Submit" class="mybtn">
        				</form><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<% }else{
	response.sendRedirect("login.jsp");
}%>