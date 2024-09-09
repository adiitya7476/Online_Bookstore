<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bk.title} - Book Details</title>
<link rel="stylesheet" type="text/css" href="css/viewSingle.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    .container {
        max-width: 900px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        display: flex;
    }

    .image-section {
        flex: 1;
        margin-right: 20px;
    }

    .image-section img {
        width: 250px; /* Larger size */
        height: 350px; /* Larger size */
        border-radius: 8px;
        object-fit: cover;
    }

    .info-section {
        flex: 2;
    }

    .info-section h1 {
        font-size: 28px;
        color: #333;
        margin-bottom: 10px;
    }

    .info-section p {
        font-size: 16px;
        color: #666;
        margin: 5px 0;
    }

    .info-section .price {
        color: #28a745; /* Green color for price */
        font-weight: bold;
    }

    .info-section .discount {
        color: #28a745; /* Green color for discount */
        font-weight: bold;
    }

    .buttons {
        margin-top: 20px;
        display: flex;
        justify-content: space-between;
    }

    .buttons a, .buttons button {
        padding: 10px 20px;
        font-size: 16px;
        text-decoration: none;
        border: none;
        border-radius: 4px;
        color: #fff;
        background-color: #007bff;
        cursor: pointer;
    }

    .buttons a {
        background-color: #6c757d;
    }

    .buttons button {
        background-color: #28a745;
    }

    .buttons a:hover, .buttons button:hover {
        opacity: 0.9;
    }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="image-section">
        <img src="${bk.imageUrl}" alt="${bk.title}">
    </div>

    <div class="info-section">
        <h1>${bk.title}</h1>
        <p><strong>Author:</strong> ${bk.author}</p>
        <p><strong>Category:</strong> ${bk.category}</p>
        <p><strong>Description:</strong> ${bk.description}</p>
        <p><strong>Publisher:</strong> ${bk.publisher}</p>
        <p class="price"><strong>Price:</strong> ${bk.price} Rs</p>
        <p class="discount"><strong>Discount:</strong> ${bk.discount} %</p>
        <p class="price"><strong>Final Price:</strong> ${bk.discountedPrice} Rs</p>
        
        <div class="buttons">
            <a href="javascript:history.back()">Back</a>
            <form action="/cartReq/${bk.id}" method="post">
                <input type="hidden" name="bookId" value="${bk.id}">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
