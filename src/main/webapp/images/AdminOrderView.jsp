<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Orders</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminOrder.css">
    <!-- jQuery for handling form submission dynamically -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>Manage Orders</h2>

        <c:if test="${not empty orders}">
            <table class="order-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>User</th>
                        <th>Order Date</th>
                        <th>Total Price</th>
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
                            <td>${order.status}</td>
                            <td>
                            
                                <form action="" method="post">
                                    <select name="status">
                                        <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                        <option value="Processing" ${order.status == 'Processing' ? 'selected' : ''}>Processing</option>
                                        <option value="Shipped" ${order.status == 'Shipped' ? 'selected' : ''}>Shipped</option>
                                        <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                    </select>
                                    <input type="submit" value="Update" class="btn-update">
                                </form>
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
