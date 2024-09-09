<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/login.css">

</head>
<script type="text/javascript">
	function show(){
		var failed = '<%=request.getAttribute("failed")%>';
		var registered = "${done}";
		if(failed === 'true'){
			alert("Username or password is incorrect. Try again!")
		}
		
		if(registered === "yes"){
			alert("Registered successfully! Please login to continue.");
		}
	}
</script>
<body onload="show()">
<jsp:include page="header.jsp"></jsp:include>
	<div class="main-form">
        <form action="login" method="post">
            <label for="">Username</label>
            <input type="text" name="username" >
            <br><br>
            <label for="">Password</label>
            <input type="text" name="password">
            <br><br>
            <button type="submit">Login</button>
            <br><br>
            New here ? <a href="register.jsp">Register now</a>
        </form>
    </div>
</body>
</html>