<%@ page language="java" contentType="text/html" import="com.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<title>Category-Frontend</title>
</head>
<body>

<form:form action="${pageContext.request.contextPath}/UpdateCategory" modelAttribute="category" method="post">

<table>
	<tr>
		<td colspan="2">Category Module</td>

	</tr>
	<tr>
		<td>Category ID</td>
		<!--<td><input type="text" name="catId"/></td>-->
		<td><form:input path="catId"/></td>
	</tr>
	<tr>
		<td>Category Name</td>
		<!-- <td><input type="text" name="catName"/></td> -->
		<td><form:input path="catName"/></td>
	</tr>
	<tr>
		<td>Category Desc</td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="catDesc"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<center><input type="submit" value="UpdateCategory"/></center>
		</td>
	</tr>
</table>

</form:form>


<table cellspacing="2" align="center">
<tr bgcolor="gray">
	<td>Category ID</td>
	<td>Category Name</td>
	<td>Category Description</td>
	<td>Operation</td>
</tr>
<c:forEach items="${categoryList}" var="category">
	<tr bgcolor="cyan">
		<td>${category.catId}</td>
		<td>${category.catName}</td>
		<td>${category.catDesc}</td>
		<td>
			<a href="<c:url value="deleteCategory/${category.catId}"/>">DELETE</a>/
			<a href="<c:url value="updateCategory/${category.catId}"/>">UPDATE</a>
		</td>
	</tr>
</c:forEach>

</table>

</body>
</html>