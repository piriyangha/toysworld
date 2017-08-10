<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> viewProduct page</title>
</head>
<body>

  <h2>view product</h2>
 <table align="left" border="1">
  <tr>
   <th>Product ID</th>
   <th>Product Name</th>
   <th>Product Price</th>
   <th>Product Brandname</th>
   <th> stock</th>
   
  </tr>

  <c:forEach items="${products}" var="prod">
   <tr>
    <td><c:out value="${prod.pid}"/></td>
    <td><c:out value="${prod.pname}"/></td>
    <td><c:out value="${prod.price}"/></td>
    <td><c:out value="${prod.brandname}"/></td>
    <td><c:out value="${prod.stock}"/></td>
  </tr>
  </c:forEach>
 </table>
  
</body>
</html>