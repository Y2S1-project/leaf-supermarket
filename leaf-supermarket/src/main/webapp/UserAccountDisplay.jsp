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
<title>User Account</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<style>

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 50%;
  height:80%;
  margin: 4px 300px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
.card img{
	 margin: 4px 125px;
}
.container1{
	 margin: 4px 125px;
}
.container1 label{
	font-weight:400;
}
.container1 h4{
	font-weight:500;
	font-size:18px;
}
.container1 li{
	font-size:15px;
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
  width:100%
}

</style>
<%@include file="includes/head.jsp" %>
	<link rel="stylesheet" href="styles/index.css">
</head>
<body>
<header>
	<%@include file="includes/navbar.jsp" %>
</header>                    
       <div class=" container"> 
            <br> <h1 style="color:Green; text_align : center"><center><b>User Details</b></center></h1><br><br>
                 <div class="card">                      
                        <img src="images/UserAccount.jpg" alt="Avatar" style="width:50%">
                  	<div class=" container1">      
                        <input type ="hidden" class="form-control" name="id" value="${edit_User.id }" required>
                        <label> <h4><b> Name</b></h4></label><li>${edit_User.name }</li><br>
                        <label> <h4><b>Email  </b></h4></label><li>${edit_User.email }</li><br>
                        <label><h4> <b>Phone Number </b></h4></label><li>${edit_User.phone }</li><br>
                        <label><h4><b> Address </b></h4></label><li>${edit_User.address }</li><br>
                         <a href="UserAccountEdit.jsp"><button type="submit" class="button">Edit</button></a><br><br>
				 	</div> 
                 </div> 
       </div><br>
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
<% }else{
	response.sendRedirect("login.jsp");
}%>
