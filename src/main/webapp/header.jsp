<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookScape</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #e699ff;
            color: white;
            padding: 15px 0;
            width: 100%;
        }

        nav {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            margin-left: 20px;
            justify-content: flex-start;
            flex-grow: 1;
        }

        .logo a {
            font-weight: bold;
            font-size: 1.5rem;
            text-decoration: none;
        }

        .nav-links {
            margin-right: 20px;
            display: flex;
            align-items: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            padding: 5px 10px;
        }

        nav a:hover {
            background-color: #cc99ff;
        }
    </style>
</head>

<body>
    <header>
        <nav>
            <div class="logo">
                <a href="<%= (session.getAttribute("user") != null) ? "/withname" : "index.jsp" %>">
                    <span style="color:black;">Book</span><span style="color: #ff0000;">Scape</span>
                </a>
            </div>

            <div class="nav-links">
            	<a href="/withname">Discount</a>
                <a href="/getBooks">Browse Books</a>
                <% if (session.getAttribute("user") != null) { %>
                    <a href="/viewCart">Cart</a>
                    <a href="/orderdetails">My Orders</a>
                    <a href="/logout">Logout</a>
                <% } else { %>
                    <a href="login.jsp">Login</a>
                    <a href="register.jsp">Register</a>
                <% } %>
            </div>
        </nav>
    </header>
</body>
</html>
