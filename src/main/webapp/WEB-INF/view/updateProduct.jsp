<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="springForm"
	uri="http://www.springframework.org/tags/form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	body
	{
	
background-image: url("https://www.transparenttextures.com/patterns/pool-table.png");

	}
	</style>
	<c:set var="contextRoot" value="${pagecontext.request.contextPath}"> </c:set>
	<c:url value="/all/product/updateproduct" var="url"></c:url>
</head>

<body>
	
	<div class="container">
		<h2 style="text-align:center; color:purple;"> Update Product </h2>
		<br>
		<springForm:form  action="${url}"	modelAttribute="products">
			<div class="form-group">
				<springForm:label class="control-label col-sm-4" style="text-align:right;color:maroon;" path="pname">Product Name:</springForm:label> 
					<div class="control-label col-sm-4 col-sm-4">
					<springForm:input  path="pname" class="form-control"  value="${products.pname}"
						placeholder="Enter product name"/>
				</div>
				</div>
				<br><br><br>
				
					<springForm:input type="hidden"  path="pid" class="form-control"/>
				
				
			<div class="form-group">
				<springForm:label class="control-label col-sm-4" style="text-align:right; color:maroon;" path="brandname">Brandname:</springForm:label> 
					<div class="control-label col-sm-4 col-sm-4">
					<springForm:input   path="brandname" class="form-control" value="${products.brandname}"
						placeholder="Enter brandname"/>
				</div>
				</div>
				<br>	<br>
			<div class="form-group">
				<springForm:label class="control-label col-sm-4" style="text-align:right; color:maroon;" path="stock">Stock:</springForm:label> 
					<div class="control-label col-sm-4 col-sm-4">
					<springForm:input  path="stock" class="form-control" value="${products.stock}"
						placeholder="Enter stock"/>
				</div>
				</div>
			<br>	<br>
				<div class="form-group">
				<springForm:label class="control-label col-sm-4" style="text-align:right; color:maroon;" path="price">price:</springForm:label> 
					<div class="control-label col-sm-4 col-sm-4">
					<springForm:input  path="price" class="form-control" value="${products.price}"
						placeholder="Enter price"/>
				</div>
				</div>
			<br><br>
			<div class="form-group">
				<springForm:label class="control-label col-sm-4"
					style="text-align:right; color:maroon;" path="category.cid">Select category:</springForm:label>
				<div class="control-label col-sm-4 col-sm-4">
					<springForm:select class="form-control" path="category.cid">
						<springForm:option value="0" label="----select category----" />
						<c:forEach var="c" items="${cat}">
							<springForm:option value="${c.cid}" label="${c.catname}" />
						</c:forEach>
					</springForm:select>

				</div>
			</div>
			<br>
			<br>
			
			<%-- <div class="form-group">
			<springForm:label class="control-label col-sm-4"
					style="text-align:right; color:maroon;" path="image"> Upload Image:</springForm:label>
					<div class="control-label col-sm-4 col-sm-4">
			 <springForm:input type="file" path="image" class="form-control"
						placeholder="upload image" />
			</div>
			</div>
			<br><br><br>  --%>
			
			<div class="form-group">
			<div class="col-sm-12">
			<div class= "text-center">
			<input type="submit" class="btn btn-info btn-lg" value="submit"/>
			</div>
			</div>
			</div>
	

	</springForm:form>
	</div>
</body>
</html>