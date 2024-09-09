<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Books</title>
<link rel="stylesheet" type="text/css" href="css/users.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
	.addbooks{
        padding: 10px;
        margin-top:20px;
        border-radius: 10px;
        display: flex;
        justify-content:flex-end;
        width: 94vw;
    }
    .addbooks a{
        text-decoration: none;
        
        
    }

    .addbooks button{
    	
        text-decoration: none;
        border: none;
        padding: 10px;
        justify-content: center;
        background-color:blanchedalmond;
        color: rgb(0, 0, 0);
        border-radius: 20px;
    }

    .addbooks button:hover{
        background-color:burlywood;
        transition: 0.2s;
        cursor: pointer;

    }
</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp"></jsp:include>
    <div class="addbooks">
    	<a href="addBooks.jsp"><button>Add More Books</button></a>
    </div>
    <div class="main">
        <h1>Listed Books</h1>
        <div class="tab">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Category</th>
                    <th>Publisher</th>
                    <th>Year</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Stock</th>
                    <th>Image</th>
                    <th>Discount</th>
                    <th>Add discount</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="data" items="${bdata}">
                    <tr>
                    	<td>${data.id}</td>
                    	<td>${data.title}</td>
                    	<td>${data.author}</td>
                    	<td>${data.category}</td>
                    	<td>${data.publisher}</td>
                    	<td>${data.year}</td>
                    	<td>${data.price}</td>
						<td>${fn:length(data.description) > 100 ? fn:substring(data.description, 0, 100) : data.description}</td>
                    	<td>${data.stock}</td>
                    	<td>
    						<img src="${data.imageUrl}" alt="Book Image" style="width:100px; height:auto;">
						</td>
						<td>${data.discount}</td>
						<td><a href="#" onclick="addDiscount('${data.id}'); return false;" style="text-decoration: none;">add discount</a></td>
                    	<td><a href="<c:url value='/upd'/>?id=${data.id}"><i class="fa fa-edit" style="font-size:24px; color: blue; margin-left: 20px;"></i></a></td>
                    	<td><a href="#" onclick="confirmDelete('${data.id}'); return false;"><i class="fa fa-trash-o" style="font-size:24px;color:red;margin-left: 15px;"></i></a></td>

                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
<script type="text/javascript">
 	function confirmDelete(id)
 	{
 		if (confirm("Do you want to remove this Book ?")) {
 	        window.location.href = '/delBook/' + id;
 	    }
 	}
 	
 	function addDiscount(id) {
 	    var dis = prompt('Enter discount percentage:');
 	    
 	    if (dis !== null && dis !== "") { 
 	        window.location.href = '/addDisc/' + id + '?discount=' + encodeURIComponent(dis);
 	    } else {
 	        alert("Discount percentage is required.");
 	    }
 	}

 	
 </script>
</html>