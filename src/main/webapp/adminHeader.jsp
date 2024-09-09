<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/adminHeader.css">
</head>
<body>
    <header class="admin-header">
        <div class="container">
            <div class="logo">
                <a >Admin Panel</a>
            </div>
            <nav class="nav-links">
                <ul>
                    <li><a href="adminHome.jsp">Dashboard</a></li>
                    <li><a href="users">User Management</a></li>
                    <li><a href="books">Book Management</a></li>
                    <li><a href="/adminOrder">Orders</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
</body>
</html>