 <% if ( session.getAttribute("auth1")!= null){%>
<%@page import="model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
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
     h3{
         text-align: center;
         margin-bottom: 20px;
         color:white;
         font-style:italic;
         text-decoration:underline;
         font-weight:600;
		 font-size:2em;
      }
      .form-group{
         color:white;
      }	
      @media(max-width:765px){
		.inside{
		
		width:100%;
		height:100%;
	}
	
}
}
        </style>
<title>Add Product</title>
</head>
<body>
<div class="inside">
   <div class="inner">
            <div class=" container">
                <div class="row">
                    <div class="col-12">
       <h3>-Add New Product-</h3>
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
			  <button type="submit" class="btn btn-success">Submit</button>
        </form>
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