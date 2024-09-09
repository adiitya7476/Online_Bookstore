<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/fetchBooks.css">
</head>
<style>
   .mainnn{
    display: flex;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
   }

   .userrr{
    margin: auto;
   }

   .containerrr{
    display: flex;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    }
   .instruction{
    margin: auto;
   }
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>

    <div class="mainnn">
        <div class="userrr">
            <h1 style="color: chocolate; font-size: 2rem; font-family: cursive;">
                Welcome ${firstName}
            </h1>
        </div>
    </div>

    <div class="containerrr">
        <div class="instruction">
            <h3 style="color: cornflowerblue; font-size: 1.5rem;">
                Here are our top discounted books!
            </h3>
        </div>
    </div>

	
	<div class="main">
	
	<c:forEach var="data" items="${discBook}">
	<c:if test="${data.discount!=0}">
	    <div class="container">
	        <div class="image">
	            <img src="${data.imageUrl}" alt="Image">
	        </div>
	        <div class="title" style="color: black; font-size: 1.5rem;">${data.title}</div>
	        <div class="author" style="color: grey;">${data.author}</div>
	        <div class="price">
	            Price: ${data.price} Rs. (Discount : ${data.discount}% )
	            <c:if test="${data.discountedPrice != data.price}">
	                <p>Discounted Price: ${data.discountedPrice} Rs.</p>
	            </c:if>
	        </div>
	        <div class="btn">
	        	 <a href="/viewSingleBook/${data.id }"><button style="margin-right: 30px;">View</button></a>
	            <a href="/cartReq/${data.id}"><button>Add to cart</button></a>
	        </div>
	    </div>	
	</c:if>
	</c:forEach>
        
     </div>
</body>
</html>
