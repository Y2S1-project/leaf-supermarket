<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%if(session.getAttribute("auth") != null && session.getAttribute("auth1") == null){ %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Out</title>
<%@include file="includes/head.jsp" %>
<link rel="stylesheet" href="styles/checkOut.css">
</head>
<body>
   <form method="post" action="checkOutServlet">
      <div class="container">
         <div id="shippingDetails">
            <h6>Shipping Details</h6>
            <div class="shippingMethod">
               <label>Shipping Method</label><br>
               <input type="radio" value="delivery" onclick="addDeliveryCharge()" name="shippingMethod" required>
               <label for="shippingMethod">Delivery</label>
               <input type="radio" value="pickup" onclick="removeDeliveryCharge()" name="shippingMethod" required>
               <label for="shippingMethod">Pick Up</label>
            </div>
            <div class="username">
               <label for="username">Name</label><br>
               <input type="text" value=<%=session.getAttribute("username") %> disabled>
            </div>
<%
      if(session.getAttribute("phone") != null){ 
%>
            <div class="telephone">
               <label for="telephone">Phone Number(Primary)</label><br>
               <input type="text" value=<%=session.getAttribute("phone") %> disabled>
            </div>
<%
      } 
%>
   
            <div class="recipient">
               <label for="recipientName">Recipient Name</label><br>
               <input type="text" name="recipientName" placeholder=<%=session.getAttribute("username") %>>
            </div>
            <div class="rContact">
               <label for="recipientContact">Recipient Contact No *</label><br>
<%
      if(session.getAttribute("phone")!=null){
%>	   
               <input type="text" name="recipientContact" placeholder=<%=session.getAttribute("phone")%>>   
<% 
      }else{ 
%>   
               <input type="text" name="recipientContact" placeholder="Contact No" pattern="[0-9]{9}" title="input should look like this eg: 752312345">
<%
      }
%>
            </div>
            <div class="address">
               <h6>Shipping Address</h6>
<%
      if(session.getAttribute("address") != null){ 
%>
               <div class="stored-address">
                  <input type="radio" name="address" value=<%=session.getAttribute("address")%> onclick="inactive()" required>
                  <label><%=session.getAttribute("address") %></label><br>
               </div>
               <div class="new-address">
                  <input type="radio" name="address" value="new-address" onclick="active()" required>
                  <label for="address">Enter a new address</label>
                  <div class="newAdd inactive">
                     <label for="house-no">House No *</label><br>
                     <input type="text" name="house-no" id="house-no" placeholder="House No/Lane"><br>
                     <label for="street-name">Street Name *</label><br>
                     <input type="text" name="street-name" id="street-name" placeholder="Street Name"><br>
                     <label for="city">City *</label><br>
                     <input type="text" name="city" id="city" placeholder="City">
                  </div>
               </div>
<%
      }else{
%>
               <div class="new-address">               
                  <label>Enter address</label>
                  <div class="newAdd">
                     <label for="house-no">House No *</label><br>
                     <input type="text" name="house-no" placeholder="House No" required><br>
                     <label for="street-name">Street Name *</label><br>
                     <input type="text" name="street-name" placeholder="Street Name" required><br>
                     <label for="city">City *</label><br>
                     <input type="text" name="city" placeholder="City" required>                 
                  </div>
               </div>
<%
      }
%>
            </div>
         </div>
         <div id="payment">
            <div class="payment-method">
               <h6>Payment Method</h6>
               <input type="radio" name="payment-method" value="cash" required>
               <label for="payment-method">Cash</label><br>
               <input type="radio" name="payment-method" value="card" required>
               <label for="payment-method">Card</label>
            </div>
            <div class="delivery-option">
               <h5>Delivery Options</h5>
               <h6>Choose how you want your order to be delivered.</h6>
               <input type="radio" name="delivery-option" value="leave-at-door" required>
               <label for="delivery-option">Leave at door/gate(Contactless delivery)</label><br>
               <input type="radio" name="delivery-option" value="meet-at-door" required>
               <label for="delivery-option">Meet at door/gate</label>
            </div>
         </div>
         <div id="order-review">
            <h6>Order Review</h6>
            <div class="selected-items">            
               <table>                                
                     <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Qty</th>
                     </tr>
                     <tr>
                        <td>a</td>
                        <td>a</td>
                        <td>a</td>
                     </tr>
                     <tr>
                        <td>a</td>
                        <td>a</td>
                        <td>a</td>
                     </tr>                                 
               </table>            
            </div>
            <div class="summary">
               <ul>
                  <li>Item Count: </li>
                  <li>Subtotal: Rs 50.00</li>
                  <li id="delivery" class="inactive">Delivery Charges: Rs 150.00</li>
                  <li>Total Discounts: Rs 0.00</li>
                  <li id="total">Total: 200.00</li>          
               </ul>
            </div>
            <button onclick="window.location.replace('index.jsp')">Continue Shopping</button>
            <input type="submit" value="Proceed to payment">
         </div>
      </div>
   </form>
<% 
}else{
   response.sendRedirect("index.jsp");
}
%>

<%@include file="includes/footer.jsp" %>
<script >
		let div = document.querySelector(".newAdd")
		let houseNo = document.querySelector("#house-no")
		let street = document.querySelector("#street-name")
		let city = document.querySelector("#city")
		let deliveryCharge = document.getElementById("delivery")
		
	function active(){
		div.classList.add('active')
		houseNo.setAttribute("required", "")
		street.setAttribute("required", "")
		city.setAttribute("required", "")
	}
	function inactive(){
		div.classList.remove('active')
		houseNo.removeAttribute("required", "")
		street.removeAttribute("required", "")
		city.removeAttribute("required", "")
	}
	function addDeliveryCharge(){
		deliveryCharge.classList.add('active')		
	}
	function removeDeliveryCharge(){
		deliveryCharge.classList.remove('active')
	}
</script>
</body>
</html>