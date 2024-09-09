<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Orders</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/OrderAdmin.css">
</head>
<body>
    <jsp:include page="adminHeader.jsp"></jsp:include>
	<h1 style="text-align: center; font-family: cursive;">Manage Orders</h1>
    <div class="container">
        <c:if test="${not empty orders}">
            <table class="order-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>User</th>
                        <th>Order Date</th>
                        <th>Total Price</th>
                        <th>Payment</th>
                        <th>Transaction ID</th>
                        <th>Status</th>
                        <th>Update Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.user.username}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.totalPrice}</td>
                            <td>${order.paymentMode}</td>
                            <td>${order.transactionId}</td>
                            <td>${order.status}</td>
                            <td>
                            <c:choose>
							    <c:when test="${order.status != 'Delivered'}">
							        <form action="/updateStatus/${order.id}" method="post">
							            <select name="status">
							                <option value="Order Placed" ${order.status == 'Order Placed' ? 'selected' : ''}>Order Placed</option>
							                <option value="Processing" ${order.status == 'Processing' ? 'selected' : ''}>Processing</option>
							                <option value="Shipped" ${order.status == 'Shipped' ? 'selected' : ''}>Shipped</option>
							                <option value="In transit" ${order.status == 'In transit' ? 'selected' : ''}>In transit</option>
							                <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
							            </select>
							            <input type="submit" value="Update" class="btn-update">
							        </form>
							    </c:when>
							    <c:otherwise>
							        <span style="color: green; font-weight: bold;">Order is Delivered</span>
							    </c:otherwise>
							</c:choose>

                             
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty orders}">
            <p>No orders found.</p>
        </c:if>
    </div>
</body>
</html>
