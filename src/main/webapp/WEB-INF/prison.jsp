<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Prison</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

</head>
<body>
	<div class="container w-50 text-center">
	
		<h1>Prison!</h1>
		<p>Your debt is <span><c:out value="${gold}"/></span> which is too big</p>
	</div>
    
	
</body>

</html>