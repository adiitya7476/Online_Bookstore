<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Book</title>
<link rel="stylesheet" type="text/css" href="css/register.css">

</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>
	<div class="main-form" style="margin-top: 5%;">
    <h2>Update Book</h2>
    <form action="/confirmUpdate" id="updateBook" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">Title</label>
            <input type="hidden" name="id" value="${books.id}">
            <input type="text" name="title" value="${books.title}">
        </div>
        <div class="form-group">
            <label for="author">Author</label>
            <input type="text" name="author" value="${books.author}">
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <select name="category" required>
                <option value="Fiction" ${books.category == 'Fiction' ? 'selected' : ''}>Fiction</option>
                <option value="Non-Fiction" ${books.category == 'Non-Fiction' ? 'selected' : ''}>Non-Fiction</option>
                <option value="Science" ${books.category == 'Science' ? 'selected' : ''}>Science</option>
                <option value="Biography" ${books.category == 'Biography' ? 'selected' : ''}>Biography</option>
                <option value="Sports" ${books.category == 'Sports' ? 'selected' : ''}>Sports</option>
                <option value="Other" ${books.category == 'Other' ? 'selected' : ''}>Other</option>
            </select>
        </div>
        <div class="form-group">
            <label for="publisher">Publisher</label>
            <input type="text" name="publisher" value="${books.publisher}">
        </div>
        <div class="form-group">
            <label for="year">Year</label>
            <input type="number" name="year" value="${books.year}">
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" name="price" value="${books.price}">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea name="description" rows="5" cols="50">${books.description}</textarea>
        </div>
        <div class="form-group">
            <label for="stock">Stock</label>
            <input type="number" name="stock" value="${books.stock}">
        </div>
        <div class="form-group">
            <label for="image">Image</label>
            <input type="file" name="imageUrl">
        </div>
            
            <button type="button" onclick="check()">Update</button>
            
        </form>
    </div>
</body>
<script type="text/javascript">
function check(){
    if(confirm('Are you sure ?')){
        document.getElementById("updateBook").submit();
    }
}
</script>
</html>