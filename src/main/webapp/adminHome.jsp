<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/adminHome.css">
</head>
<script type="text/javascript">
	function getData() {
		window.location.href = '/data';
	}
</script>
<body onload="getData()">
<jsp:include page="adminHeader.jsp"></jsp:include>
    <div class="main">
        <div class="books">
            <div class="data">
                <h3>Total Books</h3>
                <h2>${books}</h2>
            </div>
        </div>
        <div class="users">
            <div class="data">
                <h3>Total Users</h3>
                <h2>${users}</h2>
                <a href="/users"><button>View all</button></a>
            </div>
        </div>
        <div class="orders">
            <div class="data">
                <h3>Total Orders</h3>

            </div>
        </div>
        <div class="feedback">
            <div class="data">
                <h3>Messages</h3>
            </div>
        </div>
    </div>
</body>
</html>