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

<style>


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



.text-block {
  position:  relative;
  up : 100px;
  background-color: #7FFFD4;
  align-items: center;
  padding-left: 20px;
  padding-right: 20px;
}
</style>
</head>
<body>
         <form action="UserAccountDeleteServlet" method="post">
                        
                          
                              <div class="text-block">
                                <input type ="hidden" class="form-control" name="id" value="${edit_User.id }" required>
                                <h1 style="color:Green;">Are you sure you want to delete your account?</h1><br>
                                        <button type="submit" class="button">Delete</button>
                                        <a href="UserAccountEdit.jsp?id=<%=id %>"><button type="button" class="button">Cancle</button></a>        
                               </div> 
                                      
                                </form>
                                 
</body>
</html>
<% }else{
	response.sendRedirect("login.jsp");
}%>