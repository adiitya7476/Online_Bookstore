<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Your Order</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/PlaceOrder.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h3 style="color: red; text-align: center;">${error}</h3>
    <div class="order-form">
        <h2>Place Your Order</h2>
		
        <form action="/placeOrder" method="post">
            <div class="form-group">
            	<label for="name">Name: <span>&nbsp;&nbsp;&nbsp;&nbsp;${user.first} ${user.last}</span></label>
            	<label for="name">Email:<span>&nbsp;&nbsp;&nbsp;&nbsp;${user.email}</span></label>
            	<label for="name">Phone:<span>&nbsp;&nbsp;&nbsp;&nbsp;${user.number}</span></label>
            	<label for="name">Items:</label>
            	
            	<c:forEach var="item" items="${item}">
	            	<c:set var="itemTotal" value="${item.price * item.quantity}"/>
	   				<c:set var="totalP	rice" value="${totalPrice + itemTotal}"/>
            	 	Book Name :<span style="font-weight: bold; font-style: italic;">${item.bookName}</span><br>
            	 	Quantity :<span style="font-weight: bold; font-style: italic;">${item.quantity}</span><br>
            	 	Price : <span style="font-weight: bold; font-style: italic;">${item.price}</span><br>
            	 	Total : <span style="font-weight: bold; font-style: italic;">${itemTotal}</span>
            	 	<br><br>
            	</c:forEach>
				<span style="font-weight: bold; color: green;" >Grand Total : ${totalPrice }</span><br>
                <label for="deliveryAddress" style="margin-top: 10px;">Delivery Address:</label>
                <textarea id="deliveryAddress" name="deliveryAddress" required></textarea>
            </div>

            <div class="form-group payment-section">
                <label for="paymentMode">Payment Mode:</label>
                <select id="paymentMode" name="paymentMode" onchange="toggleUPIDetails(this.value)" required>
                    <option value="COD">Cash On Delivery</option>
                    <option value="upi">UPI</option>
                    
                </select>
            </div>

            <div class="upi-details" id="upiDetails">
                <div class="form-group qr-code">
                    <label>Scan QR Code:</label>
                    <img src="/images/qr.jpg" alt="QR Code">
                </div>
                <div class="form-group upi-id">
                    <label for="upiId">Scan above QR or Complete the payment on 7887954951@ybl UPI and fill the transaction ID below.</label>
                </div>
                <div class="form-group transaction-id">
                    <label for="transactionId">Transaction ID:</label>
                    <input type="text" id="transactionId" name="transactionId">
                </div>
            </div>

            <div class="form-group">
                <button type="submit">Place Order</button>
            </div>
        </form>
    </div>

    <script>
        function toggleUPIDetails(paymentMode) {
            var upiDetails = document.getElementById('upiDetails');
            if (paymentMode === 'upi') {
                upiDetails.classList.add('active');
            } else {
                upiDetails.classList.remove('active');
            }
        }
    </script>
</body>
</html>
