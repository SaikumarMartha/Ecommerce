<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/Pretty-Footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>

<style type="text/css">


.product_view .modal-dialog{max-width: 800px; width: 100%;}
        .pre-cost{text-decoration: line-through; color: #a5a5a5;}
        .space-ten{padding: 10px 0;}

</style>
</head>
<body>
<!--
<div class="logo">
<a href="#">
<img alt="Smart store" src="/resources/2.PNG"></a> -->

<nav id="navbar-blue" class="navbar-inverse navbar-static-top" role="navigation">
<div class="container">
		<ul class="nav navbar-nav">
			<button type="button"class="nabar-toggle collapse" data-toggle="collapse" data-target="#bs-example-nav">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			
			</button>
		</ul>
</div>
<div class="collapse navbar-collapse" id="bs-example-nav">
 <a class="navbar-brand" href="http://localhost:8080/LEONINES/"><img src="" alt="Smart Hub">
        </a>
   <!--  <a class="navbar-brand" href="#">SmartHub</a>-->
			
				<ul class="nav navbar-nav navbar-right">
					
					  <sec:authorize access="!isAuthenticated()">
                    <li role="presentation"><a href="login"><i class="fa fa-sign-in" aria-hidden="true"></i>Login </a></li>
                    <li role="presentation"><a href="registration">Register </a></li>
                     </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                 <li> <a href="<c:url value="j_spring_security_logout" />"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                 <li role="presentation"><a href="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Cart</a></li>
                  </sec:authorize>
	
				</ul>
</div>
</nav>




<div class="container">
  <h2>Mostly View</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img class="img-rounded" class="img-responsive center-block" src="resources/bretling.jpg"  style="width:100%;">
      </div>

      <div class="item">
        <img class="img-rounded" class="img-responsive center-block" src="resources/mac.jpg"  style="width:100%;">
      </div>
    
      <div class="item">
        <img class="img-rounded" class="img-responsive center-block" src="resources/police.jpg"  style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<br>
<br>

<div class="container-fluid">
    <div class="row">
<font face = "Comic sans MS" size =" 5">List of Products</font><br />
<c:forEach items="${pList}" var="product">


        <div class="col-md-4">
              <div class="thumbnail">
                <img src="/LEONINES/myImage/imageDisplay?id=${product.productId}"  class="img-rounded" alt="" class="img-responsive">
                <div class="caption">
                  <h4 class="pull-right">${product.price}</h4>
                  <h4><a href="#">${product.productName}</a></h4>
                  <p>${product.productDesc}</p>
                </div>
                
                <div class="space-ten"></div>
                <div class="btn-ground text-center">
                    <form:form action="addToCart/${product.productId}" method="POST">
                <button class="btn btn-success" type="submit">Add to cart</button>
                </form:form>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view"><i class="fa fa-search"></i> Quick View</button>
                </div>
                <div class="space-ten"></div>
              </div>
            </div>
            
 
<div class="modal fade product_view" id="product_view">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>
                <h3 class="modal-title">${product.productName}</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6 product_img">
                        <img src="/LEONINES/myImage/imageDisplay?id=${product.productId}"  class="img-rounded"  class="img-responsive">
                    </div>
                    <div class="col-md-6 product_content">
                        <h4>Product Id: <span>${product.productId}</span></h4>
                        
                        <p>${product.productDesc}</p>
                        <h3 class="cost"><span class="glyphicon glyphicon-usd"></span>${product.price} </h3>
                        <div class="row">
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <select class="form-control" name="select">
                                    <option value="" selected="">Color</option>
                                    <option value="black">Black</option>
                                    <option value="white">White</option>
                                    <option value="gold">Gold</option>
                                    <option value="rose gold">Rose Gold</option>
                                </select>
                            </div>
                            <!-- end col -->
                            
                            <!-- end col -->
                            <div class="col-md-4 col-sm-12">
                                <select class="form-control" name="select">
                                    <option value="" selected="">QTY</option>
                                     <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                     <option value="">4</option>
                                    <option value="">5</option>
                                    <option value="">6</option>
                                    
                                </select>
                            </div>
                            <!-- end col -->
                        </div>
                        <div class="space-ten"></div>
                        <form:form action="addToCart/${product.productId}" method="POST">
                <button class="btn btn-success" type="submit">Add to cart</button>
                </form:form>
                    </div>
                    <div class="space-ten"></div>
                </div>
            </div>
           
        </div>
  
  </div></div>
</c:forEach> 
  </div>
</div> 
  </body>
  <jsp:include page="footer.jsp" />
</html>
  
  
  
  
  
  
   <!--  
    <div class="container">
        <div class="row product">
            <div class="col-md-5 col-md-offset-0">
            <img src="/LEONINES/myImage/imageDisplay?id=${product.productId}" class="img-rounded"alt="" width="300" height="200" /></div>
            <div class="col-md-7">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Specifications </th>
                                <th>Details </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> Name</td>
                                <td>${product.productName}</td>
                            </tr>
                            <tr>
                                <td>Price </td>
                                <td>${product.price} </td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td>${product.productDesc} </td>
                            </tr>
                            <tr>
                                <td>colours </td>
                                <td>Black,White </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <form:form action="addToCart/${product.productId}" method="POST">
                <button class="btn btn-default" type="submit">Add to cart</button>
                </form:form>
            </div>
        </div>
        
        <div class="media">
            <div class="media-body"></div>
        </div>
        <div class="media">
            <div class="media-body"></div>
        </div>
    </div>-->
     
	  









