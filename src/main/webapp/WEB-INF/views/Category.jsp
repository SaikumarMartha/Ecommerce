<%@ page language="java" contentType="text/html" import="com.model.Category"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<title>Category-Frontend</title>
<style type="text/css">
.colorgraph {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}

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
<script type="text/javascript">


</script>
</head>

<jsp:include page="header.jsp"></jsp:include>
<!-- <form action="AddCategory" method="post">-->
<body>

<form:form action="AddCategory" modelAttribute="category">

<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form">
			<h2>Category <small>Module</small></h2>
			<hr class="colorgraph">
			
			<div class="form-group">
				<input type="text" name="catName" id="catName" class="form-control input-lg" placeholder="Category Name" tabindex="3">
			</div>
			<div class="form-group">
				<input type="text" name="catDesc" id="catDesc" class="form-control input-lg" placeholder="Category Desc" tabindex="4">
			</div>
			
			
			
			<hr class="colorgraph">
			<div class="row">
				
				<input class="btn btn-success btn-block btn-lg" type="submit" value="Insert"/>
			</div>
		</form>
	</div>
</div>
</div>

<!--  <div class="col-md-8 col-md-offset-2">
<table align="center" cellspacing="2">
	<tr>
		<td colspan="2">Category Module</td>
	</tr>
	<tr>
		
		
		<form:input type="hidden" name="catId" path="catId" class="form-control" />
		
		
	</tr>
	
	<tr>
		<td>Category Name</td>
		<!-- <td><input type="text" name="catName"/></td> -->
	<!--	<td><form:input path="catName"/></td>
	</tr>
	<tr>
		<td>Category Desc</td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
	<!--	<td><form:input path="catDesc"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<center><input type="submit" value="Insert"/>
			
			</center>
		</td>
	</tr>
</table>
</div>-->

</form:form>

<table class="rwd-table" style="width:70%" cellspacing="10" align="center">
<tr>
	<td>Category ID</td>
	<td>Category Name</td>
	<td>Category Description</td>
	<td>Operation</td>
</tr>
<br>
<c:forEach items="${categoryList}" var="category">
	<tr >
		<td>${category.catId}</td>
		<td>${category.catName}</td>
		<td>${category.catDesc}</td>
		<td>
			<a href="<c:url  value="deleteCategory/${category.catId}"/>">DELETE</a>/
			<a href="<c:url  value="updateCategory/${category.catId}"/>">UPDATE</a>
		</td>
	</tr>
</c:forEach>

</table>
</br>
</br>
</br>
</br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>