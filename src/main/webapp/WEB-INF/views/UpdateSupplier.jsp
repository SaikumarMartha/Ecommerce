<%@ page language="java" contentType="text/html" import="com.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<title>Supplier-Frontend</title>
</head>
<body>

<form:form action="${pageContext.request.contextPath}/UpdateSupplier" modelAttribute="supplier" method="post">

<table>
	<tr>
		<td colspan="2">Supplier Module</td>

	</tr>
	<tr>
		<td>Supplier ID</td>
		<!--<td><input type="text" name="supplierId"/></td>-->
		<td><form:input path="supplierId"/></td>
	</tr>
	<tr>
		<td>Supplier Name</td>
		<!-- <td><input type="text" name="supplierName"/></td> -->
		<td><form:input path="supplierName"/></td>
	</tr>
	<tr>
		<td>Supplier Desc</td>
		<!-- <td><input type="text" name="supplierDesc"/></td> -->
		<td><form:input path="supplierDesc"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<center><input type="submit" value="UpdateSupplier"/></center>
		</td>
	</tr>
</table>

</form:form>


<table cellspacing="2" align="center">
<tr bgcolor="gray">
	<td>Supplier ID</td>
	<td>Supplier Name</td>
	<td>Supplier Description</td>
	<td>Operation</td>
</tr>
<c:forEach items="${supplierList}" var="supplier">
	<tr bgcolor="cyan">
		<td>${supplier.supplierId}</td>
		<td>${supplier.supplierName}</td>
		<td>${supplier.supplierDesc}</td>
		<td>
			<a href="<c:url value="deletesupplier/${supplier.supplierId}"/>">DELETE</a>/
			<a href="<c:url value="updatesupplier/${supplier.supplierId}"/>">UPDATE</a>
		</td>
	</tr>
</c:forEach>

</table>

</body>
</html>