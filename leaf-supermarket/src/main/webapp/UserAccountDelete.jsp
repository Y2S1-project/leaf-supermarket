 <% if ( session.getAttribute("auth")!= null && session.getAttribute("auth1")== null){%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="connection.*"%>
<%
    int id = (int)session.getAttribute("auth");
	CustomerDao pd=new CustomerDao(DbCon.getConnection());
    Customer pds = pd.getSingleUser(id);
    request.setAttribute("edit_User", pds);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>User Account Delete</title>

<style>
		.card {
  			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  			transition: 0.3s;
  			width: 40%;
  			height:200px;
  			margin-right:20px;
  			margin-left:400px;
  			margin-top:150px;
  			background-color: #17141d;
		}
		.card:hover {
  			box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}
		.container {
  			padding: 2px 16px;
		}
		.header{
			color: white;
		}
		@media(max-width:768px){
			.card{
				display:flex;
				justify-content:center;
				align-items:center;
				width:100%;
				height:100%;
				z-index:1;
			}
		}	





.button {
  background-color: #4CAF50;
  border: none;
  color: Green;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 8px;
}




</style>
</head>
<body>
         <form action="UserAccountDeleteServlet" method="post">
                        
                          
                              <div class="card">
                              <img style="width:100%">
  		                         <div class="container">
                                <input type ="hidden" class="form-control" name="id" value="${edit_User.id }" required>
                                <h1 style="color:Green;">Are you sure you want to delete your account?</h1><br>
                                        <button type="submit" class="button">Delete</button>
                                        <a href="UserAccountEdit.jsp?id=<%=id %>"><button type="button" class="button">Cancel</button></a>        
                               </div> 
                                      </div>
                                </form>
                                 
</body>
</html>
<% }else{
	response.sendRedirect("login.jsp");
}%>
