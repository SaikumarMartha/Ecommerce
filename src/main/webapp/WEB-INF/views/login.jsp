<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<style type="text/css">
.img-rounded
{
    border-radius: 8500px;
    background: #73AD21;
    padding: 200px; 
    width: 800px;
    height: 900px;    
}

</style>
<title>Cakes</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="utf-8">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<form  method="post" action="j_spring_security_check" class="form-horizontal" align="center">

	<div class="container">
    <div class="row vertical-offset-100"><br>
    <br>
    <br>
    <br>
    <br>
    
    
    	<div class="col-md-8 col-md-offset-2">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Please sign in</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
	

	<div class="form-group">
		<label for="User Email" class="col-xs-4 control-label">Email</label>
		<div class="col-xs-4">
			<input name="j_username" type="email"  placeholder="Email" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Password</label>
		<div class="col-xs-4">
			<input name="j_password"  type="password" placeholder="Password" class="form-control" />
		</div>
	</div>



	<div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
	
		<input type="submit" value="Login" id="btn-add" class="btn btn-primary" >

		</div>
		
	</div></fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
</form></head></html>