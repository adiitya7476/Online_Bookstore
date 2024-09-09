<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Bookstore</title>
<link rel="stylesheet" type="text/css" href="css/landing.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class="hero">
    <div class="hero-background"></div>
    <div class="hero-content">
        <h1>Welcome to <span style="color: black;  text-shadow: -1px -1px 0 #000;">Book</span>
        <span style="color: red;">Scape</span> 
        Online Bookstore</h1>
        <p>Discover, Explore, and Buy Books Online</p>
        <a href="/getBooks" class="btn-primary">Browse Books</a>
    </div>
</section>


</body>
</html>