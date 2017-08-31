
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<meta charset="utf-8">
<c:set var="contextRoot" value="${pagecontext.request.contextRoot}"> </c:set>
<title>Header</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">
.navbar li a {
	color: white;
}

.navbar li a hover {
	color: red;
}

body {
	background-color: background-color: #e38dd6;
	background-image:url("https://www.transparenttextures.com/patterns/45-degree-fabric-light.png");
}
</style>
</head>
<body>
	<nav class="navbar navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><img
			src="resource\image\logo3.png"> </a>
	</div>
	<div class="container">
		<ul class="nav navbar-nav" style="color: white">
			<li><a href="#"> Home <span class="glyphicon glyphicon-home"></span></a></li>
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Shop All Catagories <span
					class="glyphicon glyphicon-list"></span></a>
					<ul class="dropdown-menu">
					<li class="dropdown-header"> Toys For Kids(2 yrs+)</li>
      					<c:forEach items="${cat}" var="c">
      					<li><a href="contextRoot/${c.cid}"/>>"${c.catname}"</li>
                                   					
      					</c:forEach>
     				    
     				    
   					 </ul>
			 
			<li><a href="#"> Contact <span
					class="glyphicon glyphicon-chevron-down"></span></a></li>
			<li><a href="addproduct"> Addproduct </a></li>
			<li><a href="addcategory"> Addcategory </a></li>
			<li><a href="ProductList"> ProductList </a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="register"><span class="glyphicon glyphicon-user"></span>
					Register</a></li>
			<li><a href="Login"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>
	</div>
	</nav>
	
</body>
</html>