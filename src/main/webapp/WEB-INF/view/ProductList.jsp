<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resource/css/datatable.min.css" />"
	rel="stylesheet">

<script src="<c:url value="/resource/javascipt/datatable.min.js" />"></script>

<title>Product List</title>
<style>
h2{
    text-align:center;
    color:orange;
}
th{
   text-align:center; 
   color:maroon;
   font-size:125%;
}
</style>

</head>
<body>
<%@include file="header.jsp"%>
	<h2> Product List</h2>
	<table  class="table table-responsive">
		<tr>
			<th>Product ID</th>
			<th>Product Name</th>
			<th>Category</th>
			<th>Brand name</th>
			<th>Product Price</th>
			<th>Stock</th>
			<th>Actions</th>
		</tr>

		<c:forEach items="${product}" var="pro">
			<tr>
				<td><c:out value="${pro.pid}" /></td>
				<td><c:out value="${pro.pname}" /></td>
				<td><c:out value="${pro.category.catname}" /></td>
				<td><c:out value="${pro.brandname}" /></td>
				<td><c:out value="${pro.price}" /></td>
				<td><c:out value="${pro.stock}" /></td>

				<td align="center">
				<a href=<c:url value="/all/product/viewProduct/${pro.pid}"/>><span class="glyphicon glyphicon-info-sign">| |</span></a>
				
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<a	href=<c:url value="/admin/product/editform/${pro.pid}"/>><span class="glyphicon glyphicon-pencil">| |</span></a> 
								<a  href=<c:url value="/admin/deleteProduct/${pro.pid}"/>><span class="glyphicon glyphicon-trash">| |</span></a>
					</security:authorize></td>
			</tr>
		</c:forEach>
	</table>
	<script>
	$(document).ready(function() {
		var searchCondition = '${searchCondition}';
		$('.table').DataTable({
			"lengthMenu" : [ [ 3, 5, 7, -1 ], [ 3, 5, 7, "All" ] ],
			"oSearch" : {
				"sSearch" : searchCondition
			}
		})
	});

</script>
	
</body>
</html>