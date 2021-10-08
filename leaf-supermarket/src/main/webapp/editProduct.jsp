<% if ( session.getAttribute("auth1")!= null){%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="connection.*"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
	ProductDao pd=new ProductDao(DbCon.getConnection());
    Product pds = pd.getSingleProduct(id);
    request.setAttribute("edit_products", pds);
%>
<!DOCTYPE html>
<html>
<head>
	<title>Edit Product</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<style>
		.inside{
			background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url(images/editProduct.png);
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
         	font-weight:600;
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
			color:white;
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
	<div class="inside"><br>
		<div class="inner">
            <div class=" container">
                <div class="row">
                    <div class="col-12">
                        <h3>Edit Product Details</h3>
						<form action="EditProductServlet" method="post">
							<div class="form-group">
                                <label>Product ID</label>
                                <input class="form-control" name="id" value="${edit_products.id }" required>
                            </div>
                            <div class="form-group">
                                <label>Product Name</label>
                                <input class="form-control" name="product_name" value="${edit_products.name }" required>
                            </div>
							<div class="form-group">
                                <label>Quantity</label>
                                <input class="form-control" name="quantity" value="${edit_products.quantity }" required>
                            </div>
                            <div class="form-group">
                                <label>Unit Price</label>
                                <input class="form-control" name="unit_price" value="${edit_products.unitPrice }" required>
                            </div>
                            <div class="form-group">
                                <label>Increment Unit</label>
                                <input class="form-control" name="increment_unit" value="${edit_products.incrementUnit }" required>
                            </div>
                            <div class="form-group">
                                <label>Product Discount</label>
                                <input class="form-control" name="discount_rate" value="${edit_products.discount }" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <input class="form-control" name="category" value="${edit_products.category }" required>
                            </div>
  							<input type="submit" value="Submit" class="mybtn">
                      </form>
					</div>
				</div>
			</div>
		</div><br>
	</div>
</body>
</html>
<% }else{
	response.sendRedirect("login.jsp");
}%>