<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CartPage</title>


<link href="resources/lib/bootstrap-3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/lib/bootstrap-3.3.6/css/bootstrap.css" rel="stylesheet" />

<!-- scripts -->
<script src="resources/lib/jquery/jquery-1.10.2.js"></script>
<script src="resources/lib/bootstrap-3.3.6/js/bootstrap.min.js"></script>


<%-- <jsp:include page="showProduct.jsp" /> --%> 

</head>
<body>


<div class="bs-example">
    <nav id="myNavbar" class="navbar navbar-inverse" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">SmartHuB</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="http://localhost:8080/LEONINES/"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                   
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    
                              <li> <a href="<c:url value="j_spring_security_logout" />"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                            
                           
                            
                        </ul>
                  
               
            </div>
        </div>
    </nav>
</div>
<br>
<br>
<br>
<br>
<br>

<div class="container">
    <div class="row">
          <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                     <c:forEach items="${CartList}" var="cart">
                    
                    <tr>
                
                     
                        <td class="col-sm-8 col-md-6">
                        <div class="thumbnail">
                         <a class="thumbnail pull-left" href="#"> <img src="/LEONINES/myImage/imageDisplay?id=${cart.productid}" class="img-rounded" style="height:50px;height: 50px" > </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${cart.productName}</a></h4>
                            <!--     <h5 class="media-heading"> by <a href="#">Brand name</a></h5>--> 
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <form action="editCart/${cart.cartId}">
                        <input type="text" class="form-control" id="exampleInputEmail1" name="quantity" value="${cart.productQuantity }" >
                        
                        </form>
                        
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cart.productPrice}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cart.subTotal}</strong></td>
                        <td class="col-sm-1 col-md-1">
                       <a href="removeCart/${cart.cartId}" class="btn btn-success">
                          <span class="glyphicon glyphicon-trash"></span> Delete
                        </a>
                        
                        </td>
                          </tr>
                          
                    </c:forEach>   
                          
                    
                   
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>${CartPrice}</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="continue_shopping" class="btn btn-info">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                       </a>
                        
                        </td>
                         <td>
                        <a href="checkout" class="btn btn-warning">
                            <span class="glyphicon glyphicon-play"></span> Checkout
                       </a>
                        
                        </td>
                       
                        
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
<jsp:include page="footer.jsp" />
</html>