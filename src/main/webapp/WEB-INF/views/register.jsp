
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="sp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>


<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<h1>Customer Signup form</h1>
<div class="Col-lg-12">
<div class="row">
<sp:form modelAttribute="user" action="saveRegister" method="post">
<div class="col-lg-10">


<div class="form_group">
<label>Name</label>
<sp:input path="name" placeholder="enter name" class="form-control"/>
</div>




<div class="form_group">
<label>Email</label>
<sp:input path="email" placeholder="enter email id" class="form-control"/>



<div class="form_group">
<label>password</label>
<sp:input path="password" placeholder="enter password" class="form-control"/>
</div>

<div class="form_group">
<label>Contact</label>
<sp:input path="contact" placeholder="enter phone no" class="form-control"/>
</div>

<div class="form_group">
<label>Address</label>
<sp:input path="Address" placeholder="address" class="form-control"/>
</div>



<button type="submit" class="btn btn-lg btn-info">submit</button>

<button type="reset" class="btn btn-lg btn-info">reset</button>
</sp:form>
</div>
</div>
</div>
</div>
</div>



</body>
</html>
