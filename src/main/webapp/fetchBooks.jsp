<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/fetchBooks.css">

<style>
/* CSS for search bar */
.search-bar-container {
    margin:auto;
    max-width: 600px;
    padding: 10px;
    padding-bottom:0px; 
}

.search-bar-container form {
    display: flex;
    align-items: center;
}

.search-bar-container input[type="text"] {
    flex: 1;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
    margin-right: 10px;
}

.search-bar-container select {
    padding: 10px;
    padding-right:20px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
    margin-right: 10px;
}

.search-bar-container button {
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #e8acd6;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}


</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- Search form -->
<div class="search-bar-container">
    <form action="/searchBooks" method="get">
        <input type="text" name="title" placeholder="Search by Book Name" value="${param.title}">
        <select name="category">
            <option value="">Select Category</option>
            <option value="Fiction" ${param.category == 'Fiction' ? 'selected' : ''}>Fiction</option>
            <option value="Non-Fiction" ${param.category == 'Non-Fiction' ? 'selected' : ''}>Non-Fiction</option>
            <option value="Science" ${param.category == 'Science' ? 'selected' : ''}>Science</option>
            <option value="Biography" ${param.category == 'Biography' ? 'selected' : ''}>Biography</option>
            <option value="Sports" ${param.category == 'Sports' ? 'selected' : ''}>Sports</option>
            <option value="Other" ${param.category == 'Other' ? 'selected' : ''}>Other</option>
        </select>
        <button type="submit">Search</button>
    </form>
</div>

    <p style="color: red; font-weight: bold; text-align: center;">${msg }</p>
	<div class="main">
	<c:forEach var="data" items="${books}">
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
	            <p style="color: red;">Hurry up! Only ${data.stock} books left !</p>
	        </div>
	        <div class="btn">
	        	<a href="/viewSingleBook/${data.id }"><button style="margin-right: 30px;">View</button></a>
	            <a href="/cartReq/${data.id}"><button>Add to cart</button></a>
	        </div>
	    </div>
	</c:forEach>
        
     </div>
</body>
</html>