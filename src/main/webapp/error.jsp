<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<h1>An Error Occurred</h1>
	<p>
		<strong>Exception Type:</strong>
		<%=exception.getClass().getName()%></p>
	<p>
		<strong>Exception Message:</strong>
		<%=exception.getMessage()%></p>

	<h2>Stack Trace:</h2>
	<pre>
<%
exception.printStackTrace(new java.io.PrintWriter(out));
%>
</pre>
</body>
</html>
