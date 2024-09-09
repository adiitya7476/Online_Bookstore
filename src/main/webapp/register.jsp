<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<p style="text-align: center; color: red; font-weight: bold; margin: 10	px;">${error}</p>
	<div class="main-form">	
        <h2>Register</h2>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="first">First Name</label>
                <input type="text" id="first" name="first">
            </div>
            <div class="form-group">
                <label for="last">Last Name</label>
                <input type="text" id="last" name="last">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username">
            </div>
            <div class="form-group">
                <label for="number">Phone No</label>
                <input type="text" id="number" name="number">
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
            </div>
            <button type="submit">Register</button>
            <div class = "clickhere">
             Already have an account ?<a href="login.jsp">Click here</a>
             </div>
        </form>
    </div>
</body>
</html>