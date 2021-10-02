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
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<style>

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 100%;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
<% }else{
	response.sendRedirect("login.jsp");
}%>


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
}

</style>
</head>
<body>
                           
                           <div class=" container"> 
                              <br> <h1 style="color:Green; text_align : center">User Details</h1><br><br>
                            <div class="card">                      
                                 <img src="images/UserAccount.jpg" alt="Avatar" style="width:50%">
                             <div class=" container">      
                                <input type ="hidden" class="form-control" name="id" value="${edit_User.id }" required>
                                <label> Name      -    ${edit_User.name }</label><br><br>
                                <label> Email  -    ${edit_User.email }</label><br><br>
                                <label> phone number  -    ${edit_User.phone }</label><br><br>
                                 <label> address  -    ${edit_User.address }</label><br><br>
                             
  
							<a href="UserAccountEdit.jsp"><button type="submit" class="button">Edit</button></a>
							
                          </div> 
                       </div> 
                    </div>           
</body>
</html>