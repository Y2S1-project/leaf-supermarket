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
<title>User Account Update</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<style>
body{
	 background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url(images/bgi.jpg);
	background-size:cover;
                   
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
            
            
     .inner{   
              position: relative;
              margin: 0 auto;
              width: 650px;
              display: block;
              padding: 50px 0;
      }
            
            
       h3{
              text-align: center;
              border-bottom: 2px solid midnightblue;
              margin-bottom: 20px;
       }
      label{
          	color:white;
      }
        </style>
        <script type="text/javascript">
    	function Validate() {
        	var password = document.getElementById("password").value;
        	var confirmPassword = document.getElementById("confirm-password").value;
        	if (password != confirmPassword) {
            	alert("Passwords do not match.");
            	return false;
        	}
        	return true;
   		}
	</script> 
</head>
<body>

<div class="inner">
            <div class=" container">
                <div class="row">
                    <div class="col-12">
                        <h1 style="color:Green;">Edit user Details</h1>
          <form action="UserAccountEditServlet" method="post">
                                <input type ="hidden" class="form-control" name="id" value="${edit_User.id }" required>
                            <div class="form-group">
                                <label>User Name</label>
                                <input class="form-control" name="user_name" value="${edit_User.name }" required>
                            </div>
                            <div class="form-group">
                                <label>User Email</label>
                                <input class="form-control" name="email" value="${edit_User.email }" required>
                            </div>
							<div class="form-group">
                                <label>New Password</label>
                                <input type="password" class="form-control" name="password" id="password"placeholder="new Password" >
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" name="confirm-password" id="confirm-password" placeholder="Re-enter Password" >
                            </div>
  
							<button type="submit" onclick="return Validate()" class="button">Edit</button>
							 <a href="UserAccountDelete.jsp?id=<%=id %>"><button type="button" class="button">Delete</button></a>
                      </form>
 </div>
</div>
</div>
</div> 
                  
</body>
</html>
<% }else{
	response.sendRedirect("login.jsp");
}%>
