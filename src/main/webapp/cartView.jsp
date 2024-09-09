<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cart</title>
<link rel="stylesheet" type="text/css" href="css/cartView.css">
</head>
<style>
	#order{
		text-decoration: none;
		font-size: 1.5rem;
		margin-left: 90%;
	}
	#order a:hover{
		text-decoration: underline;
	}
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="cart-container">
    <h1>Your Cart</h1>
    <% boolean isCartEmpty = true; %>
    <c:if test="${not empty cart.cartItems}">
   	<c:set var="totalPrice" value="0.0" />
    	<%isCartEmpty = false; %>
        <table>
            <thead>
                <tr>
                    <th>Book Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Quantity +/-</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cart.cartItems}">
                    <tr>
                    
                        <td>${item.bookName}</td>
                        <td>${item.price} Rs</td>
                        <td>${item.quantity}</td>
                        <td>${item.price * item.quantity} Rs</td>
                        <td><a href="#" onclick="change(${item.id});return false;">Change</a></td>
                        <td><a href="/removeItem/${item.id}">Remove</a></td>
                    </tr>
                 	<c:set var="totalPrice" value="${totalPrice + (item.price * item.quantity)}" />
                </c:forEach>
            </tbody>
        </table>
        <h2>Total Price: ${totalPrice} Rs</h2>
        
        <a id="order" href="/order/${cart.id}">Proceed</a>
    </c:if>
    
    <%if(isCartEmpty){ %>
        <p>${message}</p>
   	<%} %>
</div>
</body>
<script type="text/javascript">
	function change(id) {
		var quantity = prompt('Enter new Quantity');
		 if (quantity !== null && quantity !== "" && quantity !== "0") { 
	 	        window.location.href = '/changeQuan/' + id + '?quantity=' + encodeURIComponent(quantity);
	 	 } else {
	 	        alert("Enter valid quantity");
	 	 }
	}
</script>
</html>
