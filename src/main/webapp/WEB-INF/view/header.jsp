
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
	
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<meta charset="utf-8">

<title>Header</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="<c:url value="/resource/jquery/jquery-1.12.4.min.js" />"></script>
<script src="<c:url value="/resource/js/bootstrap.min.js" />"></script>
<link href="<c:url value="/resource/css/bootstrap.min.css" />"
	rel="stylesheet">
	
	<link rel="stylesheet" href=https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css>
	<c:set var="contextRoot" value="${pageContext.request.contextPath}"> </c:set>
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
			<li><a href="index"> Home <span class="glyphicon glyphicon-home"></span></a></li>
			
			
			
			 <li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Shop All Catagories<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><c:forEach items="${cat}" var="c">
								<a href="contextRoot/categorydropdown/${c.cid}">${c.catname}</a>
							</c:forEach> </li></ul>
					</li> 
			
			
			
			
			<%-- 
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Shop All Catagories <span
					class="glyphicon glyphicon-list"></span></a>
					<ul class="dropdown-menu">
					<li class="dropdown-header"> Toys For Kids(2 yrs+)</li>
      					<c:forEach items="${cat}" var="c">
      					<li> <a href="contextRoot/categorydropdown/${c.cid}"> "${c.catname}"</a></li>
                                   					
      					</c:forEach>
     				    
     				    
   					 </ul>
			  --%>
			
					
					<c:url value="/admin/addproduct" var="url1"></c:url>
					<li><c:if
						test="${pageContext.request.userPrincipal.name!=null }">
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<a href="${url1}">Add Product</a>

						</security:authorize></c:if></li>
						<c:url value="/admin/addcategory" var="url2"></c:url>
						<li><c:if
						test="${pageContext.request.userPrincipal.name!=null }">
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<a href="${url2}">Add category</a>

						</security:authorize></c:if></li>
					
			
			
			<li><a href="ProductList"> ProductList <span class="glyphicon glyphicon-menu-hamburger"></span></a></li>
		</ul>
		<c:if test="${pageContext.request.userPrincipal.name==null }">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="register"><span class="glyphicon glyphicon-user"></span>
					Register</a></li>
			<li><a href="login?Login=true"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li></ul></c:if>
					
			<c:url value="/j_spring_security_logout" var="logout"/>		
			<c:if test="${pageContext.request.userPrincipal.name !=null }">	
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${logout}"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>	</ul>						
	        </c:if>
	        <c:url value="/cart/getcart" var="carturl"></c:url>
	        <ul class="nav navbar-nav navbar-right">
				<li><a href="${carturl}"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i> Cart </a></li>	</ul>	
	</div>
	</nav>
	
</body>
</html>