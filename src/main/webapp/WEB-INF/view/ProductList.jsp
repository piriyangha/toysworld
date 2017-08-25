<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%-- <c:set var="contextRoot" value="${pagecontext.request.contextRoot}"> </c:set> --%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
</head>
<body>

  <h2>List product</h2>
 <table align="left" border="1" style="border-collapse:collapse">
  <tr>
   <th> Product ID </th>
   <th> Product Name </th>
   <th> Category </th>
   <th> Brandname  </th>
   <!-- <th> Image </th> -->
   <th> Product Price </th>
   <th> Stock </th>
   <th> Actions </th>
  </tr>

  <c:forEach items="${product}" var="pro">
   <tr>
    <td><c:out value="${pro.pid}"/></td>
    <td><c:out value="${pro.pname}"/></td>
    <td><c:out value="${pro.category.catname}"/></td>
    <td><c:out value="${pro.brandname}"/></td>
    <c:url value="/resource/image/${pro.pid}.jpg" var="url"/>
    <td><img src="${url}" height="100" width="80"></td> 
    <td><c:out value="${pro.price}"/></td>
    <td><c:out value="${pro.stock}"/></td>
    
    <td align="center"><a href=<c:url value="/all/product/editform/${pro.pid}"/>>Update</a>  <a href=<c:url value="/viewProduct/${pro.pid}"/>>view</a><a href=<c:url value="/deleteProduct/${pro.pid}"/>>Delete</a></td>
  </tr>
  </c:forEach>
 </table>
  
</body>
</html>