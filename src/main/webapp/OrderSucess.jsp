<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.main{
		display: flex;
		font-family: cursive;
	}
	.sucess
	{
		justify-content: center;
		margin: auto;
	}
	.sucess h1
	{
		color: green;
		font-weight: bold;
		font-size: 3rem;
	}
	.sucess a
	{
		color: grey;
		color: grey;
        margin-left: 43%;
	}
	
</style>
<body>
<jsp:include page="header.jsp"/>
<div class="main">
	<div class="sucess">
		<h1>Order placed successfully</h1>
		<a href="/orderdetails">Track here</a>
	</div>
</div>
</body>
</html>