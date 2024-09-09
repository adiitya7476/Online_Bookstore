<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users</title>
<link rel="stylesheet" type="text/css" href="css/users.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>
    <jsp:include page="adminHeader.jsp"></jsp:include>
    
    <div class="main">
        <h1>Registered Users</h1>
        <div class="tab">
            <table>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="data" items="${userData}">
                    <tr>
                    	<td>${data.id}</td>
                    	<td>${data.first}</td>
                    	<td>${data.last}</td>
                    	<td>${data.email}</td>
                    	<td>${data.username}</td>
                    	<td>${data.password}</td>
                    	<td>${data.number}</td>
                    	<td>${data.address}</td>
                    	<td><a href = "<c:url value = '/${data.id}'/>" ><i class="fa fa-edit" style="font-size:24px; color: blue; margin-left: 30px;"></i></a>
                    	<td><a href="#" onclick="confirmDelete('${data.id}'); return false;"><i class="fa fa-trash-o" style="font-size:24px;color:red;margin-left: 20px;"></i></a></td>
                    	
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
 </body>
 <script type="text/javascript">
 	function confirmDelete(id)
 	{
 		if (confirm("Do you want to delete this user ?")) {
 	        window.location.href = '/delete/' + id;
 	    }
 	}
 </script>
</html>