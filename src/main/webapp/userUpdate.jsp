<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Udpate</title>
<link rel="stylesheet" type="text/css" href="css/register.css">

</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>
	<div class="main-form">
        <h2>Update Details</h2>
        <form method="post" action="/update" id="updateForm">
            <div class="form-group">
            	<input type="hidden" name="id" value="${udata.id}">
                <label for="first">First Name</label>
                <input type="text" name="first" value="${udata.first}">
            </div>
            <div class="form-group">
                <label for="last">Last Name</label>
                <input type="text" value="${udata.last}" name="last">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" value="${udata.email}" name="email">
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" value="${udata.username}" name="username">
            </div>
            <div class="form-group">
                <label for="number">Phone No</label>
                <input type="text" value="${udata.number}" name="number">
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" value="${udata.address}" name="address">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="text" value="${udata.password}" name="password">
            </div>
            <button type="button" onclick="sure()">Update</button>
        </form>
    </div>
</body>
<script type="text/javascript">
function sure() {
	if (confirm("Are you sure?")) {
        document.getElementById("updateForm").submit();
    }
		
}</script>
</html>