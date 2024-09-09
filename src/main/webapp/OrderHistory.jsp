<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderHistory.css">
    <script>
        function toggleItems(orderId) {
            var itemsRow = document.getElementById('items-' + orderId);
            if (itemsRow.style.display === 'none' || itemsRow.style.display === '') {
                itemsRow.style.display = 'table-row';
            } else {
                itemsRow.style.display = 'none';
            }
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h2>Your Order History</h2>

        <c:if test="${not empty details}">
            <table class="order-history">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Delivery Address</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>Payment Mode</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${details}">
                        <tr onclick="toggleItems(${order.id})" style="cursor: pointer;">
                            <td>${order.id}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.deliveryAddress}</td>
                            <td>${order.totalPrice}</td>
                            <td>${order.status}</td>
                            <td>${order.paymentMode}</td>
                        </tr>
                        <tr id="items-${order.id}" style="display: none;">
                            <td colspan="6">
                                <!-- Order Items Table -->
                                <table class="order-items">
                                    <thead>
                                        <tr>
                                            <th>Book Name</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${order.orderItems}">
                                            <tr>
                                                <td>${item.bookName}</td>
                                                <td>${item.quantity}</td>
                                                <td>${item.price}</td>
                                                <td>${item.quantity * item.price}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty details}">
            <p>No orders found.</p>
        </c:if>
    </div>
</body>
</html>
