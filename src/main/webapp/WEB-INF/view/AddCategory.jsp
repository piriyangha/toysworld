<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="springForm"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Add Category</title>
</head>
<body>
<div class="container">
		<h2 style="text-align: center; color:purple;"> Add Category </h2>
		<br>
		<springForm:form action="savecat" method="POST" modelAttribute="category">
			<div class="form-group">
				<springForm:label class="control-label col-sm-4" style="text-align:right;color:maroon;" path="catname">Category Name:</springForm:label> 
					<div class="control-label col-sm-4 col-sm-4">
					<springForm:input  path="catname" class="form-control"
						placeholder="Enter category name" />
				</div>
				</div>
				<br><br><br>
				<springForm:input type="hidden"  path="cid" class="form-control"/>
			<div class="form-group">
			<div class="col-sm-12">
			<div class= "text-center">
			<input type="submit" class="btn btn-info btn-lg" value="submit"/>
			</div>
			</div>
			</div>
			</springForm:form>
				

</body>
</html>