<% if ( session.getAttribute("auth1")!= null){%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<style>
			.inside{
				background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url(images/editproduct.jpg);
				background-size:cover;
			}
            .inner{
                position: relative;
                margin: 0 auto;
                width: 500px;
                display: block;
                padding: 50px 0;
                color:white;
            }
            h3{
                text-align: center;
                margin-bottom: 20px;
                color:white;
            }
        </style>
</head>
<body>
<div class="inside">
<div class="inner">
            <div class=" container">
                <div class="row">
                    <div class="col-12">
                        <h3>-Edit Product Details-</h3>
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