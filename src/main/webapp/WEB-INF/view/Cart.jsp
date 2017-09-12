<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="springForm"
	uri="http://www.springframework.org/tags/form"%>
	<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cart page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<c:set var="contextRoot" value="${pagecontext.request.contextPath}"> </c:set>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="img-thumbnail">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Images</th>
					<th>Product Name</th>
					<th>QTY</th>
					<th>Total Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cart.cartItems}" var="c">
					<tr>
						<td></td>
						<td>${c.product.pname}</td>
						<td>${c.subquantity}</td>
						<td>${c.subtotal}</td>
						<td><a href="#" class="btn btn-default">Remove</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<pre>
			Total Cost : Rs. ${cart.grandTotal}           <a href="#" class="btn btn-danger">Check out</a>
		</pre>
		
	</div>

</body>
</html>