<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Books</title>
<link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>
	<div class="main-form" style="margin-top: 10%;">
        <h2>Add Books</h2>
        <form action="/addBook" method="post" id="add" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text"  name="title">
            </div>
            <div class="form-group">
                <label for="last">Author</label>
                <input type="text"  name="author">
            </div>
             <div class="form-group">
                <label for="category">Category</label>
                <select name="category" required>
                    <option value="Fiction">Fiction</option>
                    <option value="Non-Fiction">Non-Fiction</option>
                    <option value="Science">Science</option>
                    <option value="Biography">Biography</option>
                    <option value="Sports">Sports</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="email">Publisher</label>
                <input type="text" name="publisher">
            </div>
            <div class="form-group">
                <label for="username">Year</label>
                <input type="number"  name="year">
            </div>
            <div class="form-group">
                <label for="number">Price</label>
                <input type="number"  name="price">
            </div>
            <div class="form-group">
                <label for="address">Description</label>
                <textarea name="description" rows="5" cols="50"></textarea>
            </div>
            <div class="form-group">
                <label for="password">Stock</label>
                <input type="number" name="stock">
            </div>
            <div class="form-group">
		        <label for="imageUrl">Image</label>
		        <input type="file" name="imageUrl" required>
    		</div>
            
            <button type="button" onclick="check()">Add</button>
            
        </form>
    </div>
</body>
<script type="text/javascript">
	function check(){
		if(confirm('Verify you entered data is correct ?')){
			document.getElementById("add").submit();
		}
	}
</script>
</html>