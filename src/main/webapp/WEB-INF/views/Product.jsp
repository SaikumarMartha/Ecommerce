
<%@ page language="java" import="com.model.Product" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>product</title>
<style type="text/css">
@import "compass/css3";



$breakpoint-alpha: 480px; 

.rwd-table {
  margin: 1em 0;
  min-width: 300px; 
  
  tr {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
  }
  
  th {
    display: none;   
  }
  
  td {
    display: block; 
    
    &:first-child {
      padding-top: .5em;
    }
    &:last-child {
      padding-bottom: .5em;
    }

    &:before {
      content: attr(data-th)": ";
      font-weight: bold;

     
      width: 6.5em;
      display: inline-block;
     
      
      @media (min-width: $breakpoint-alpha) {
        display: none;
      }
    }
  }
  
  th, td {
    text-align: left;
    
    @media (min-width: $breakpoint-alpha) {
      display: table-cell;
      padding: .25em .5em;
      
      &:first-child {
        padding-left: 0;
      }
      
      &:last-child {
        padding-right: 0;
      }
    }

  }
  
  
}


// presentational styling

@import 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700';

body {
  padding: 0 2em;
  font-family: Montserrat, sans-serif;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
  color: #444;
  background: #eee;
}

h1 {
  font-weight: normal;
  letter-spacing: -1px;
  color: #34495E;
}

.rwd-table {
  background: #34495E;
  color: #fff;
  border-radius: .4em;
  overflow: hidden;
  tr {
    border-color: lighten(#34495E, 10%);
  }
  th, td {
    margin: .5em 1em;
    @media (min-width: $breakpoint-alpha) { 
      padding: 1em !important; 
    }
  }
  th, td:before {
    color: #dd5;
  }
}


</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
		<form:form action="InsertProduct" modelAttribute="product" enctype="multipart/form-data" method="post">








	<div class="form-group">
		<div class="col-xs-4">
	<form:hidden path="productId"/>
	</div>
	</div>
	
	<div class="form-group">
		<label for="Product Name" class="col-xs-4 control-label">Product Name</label>
		<div class="col-xs-4">
			<form:input name="productName" path="productName" placeholder="Product Name" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label for="Product Description" class="col-xs-4 control-label">Product Description</label>
		<div class="col-xs-4">
			<form:input name="productDesc" id="productDesc" path="productDesc" placeholder="Product Description" maxlength="15" class="form-control" />
		</div>
	</div>



	<div class="form-group">
		<label for="Product Price" class="col-xs-4 control-label">Product Price</label>
		<div class="col-xs-4">
			<form:input name="price" path="price" placeholder="Product Price" class="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<label for="Product Stock" class="col-xs-4 control-label">Product Stock</label>
		<div class="col-xs-4">
			<form:input name="stock" path="stock" placeholder="Product Stock" class="form-control" />
		</div>
	</div>
	
	
	<!--  <tr>
		<td>Product Name</td>
		<td><form:textarea path="productName"/></td>
	</tr>
	<tr>
		<td>Product Desc</td>
		<td><form:textarea path="productDesc"/></td>
	</tr>
	<tr>
		<td>Product Stock</td>
		<td><form:input path="stock"/></td>
	</tr>
	<tr>
		<td>Product Price</td>
		<td><form:input path="price"/></td>
	</tr>-->

	<div class="form-group">
		<label for="Product Category" class="col-xs-4 control-label">Product Category</label>
		<div class="col-xs-4">	
			<form:select path="catId">
				<form:option value="0" label="---Select---"/>
				<form:options items="${categoryList}"/>
			</form:select>
	</div>
	</div>

	<div class="form-group">
		<label for="Product Supplier" class="col-xs-4 control-label">Product Supplier</label>
		<div class="col-xs-4">	
			<form:select path="supplierId">
				<form:option value="0" label="---Select---"/>
				<form:options items="${supplierList}"/>
			</form:select>
		</div>
		</div>
		
		
		<div class="form-group">
		<label for="Product Image" class="col-xs-4 control-label">Product Image</label>
		<div class="col-xs-4">
	<input type="file" name="file"/>
		</div>
	</div>
		<div class="form-group">  
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
			<center><input type="submit" value="Insert"/></center>
		</div>
		</div>
	
	

	
		</form:form>


		<table  class="rwd-table" style="width:100%" cellspacing="2" align="center">
				<tr>
					<td>Product ID</td>
					<td>Product Name</td>
					<td>Product Description</td>
					<td>Product Stock</td>
					<td>Product Price</td>
					<td>Category</td>
					<td>Supplier</td>
					<td>Product Image</td>
					<td>Operation</td>
				</tr>
	
	
		<c:forEach items="${productList}" var="product">
			<tr>
				<td>${product.productId}</td>
				<td>${product.productName}</td>
				<td>${product.productDesc}</td>
				<td>${product.stock}</td>
				<td>${product.price}</td>
				<td>${product.catId}</td>
				<td>${product.supplierId}</td>
				<td>${product.image}</td>
				<td>
			
						<a href="<c:url value="deleteProduct/${product.productId}"/>">DELETE</a>
						<a href="<c:url value="updateProduct/${product.productId}"/>">UPDATE</a>
				</td>
			</tr>
		</c:forEach></table>
</br>
</br>
</br>
</br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>