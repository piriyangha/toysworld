<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="springForm"
	uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
   </style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<h1 style="text-align: center">Welcome to Registration Page</h1>
		<br>
		<springForm:form action="./register/Login" method="post"
			modelAttribute="user">
			<div class="form-group">
				<springForm:label class="control-label col-sm-4" path="username">USERNAME:</springForm:label> 
					<div class="control-label col-sm-8">
					<springForm:input  path="username" class="form-control"
						placeholder="Enter username" />
				</div>
				</div>
				<br><br>
			
			<div class="form-group">
				<springForm:label class="control-label col-sm-4" path="password">PASSWORD:</springForm:label> 
					<div class="control-label col-sm-8">
					<springForm:input type="password"  path="password" class="form-control"
						placeholder="Enter password" />
				</div>
				</div>
			<br><br>
			<div class="form-group">
				<springForm:label class="control-label col-sm-4" path="email">Email:</springForm:label> 
					<div class="control-label col-sm-8">
					<springForm:input  path="email" class="form-control"
						placeholder="Enter email" />
				</div>
				</div>
			<br><br>
				<div class="form-group">
				<springForm:label class="control-label col-sm-4" path="address">ADDRESS:</springForm:label> 
					<div class="control-label col-sm-8">
					<springForm:textarea  path="address" class="form-control"
						placeholder="Enter address" rows="6" columns="25"/>
				</div>
				</div>
			<br><br><br><br>
			<div class="form-group">
			<div class="col-sm-10">
			<div class= "text-center">
			<input type="submit" class="btn btn-success btn-sm" value="submit"/>
			</div>
			</div>
			</div>
	

	</springForm:form>
	</div>
</body>
</html>