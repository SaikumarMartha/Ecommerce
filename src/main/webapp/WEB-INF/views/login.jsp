<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
<style type="text/css">
body {
	background-color: #e3e7ed;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	font-weight: 300;
}

#iosBlurBg {
	resize: horizontal;
	position: relative;
	/*width: 100%;
	height: 100vh;*/
	border-top: 450px solid transparent;
	border-left: 550px solid rgba(0,0,0,0.04);
	border-bottom: 450px solid transparent;
	background: linear-gradient(rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.1));
	/*box-shadow: 1px 1px 25px #999;*/
}

#whiteBg {
	resize: horizontal;
	position: absolute;
	top: -410px;
	right: 0;
	border-top: 410px solid transparent;
	border-left: 505px solid rgba(255,255,255,1);
	border-bottom: 410px solid transparent;
	border-right: 30px solid transparent;
	background: linear-gradient(rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 1));
}

#bottomEnter{
	position: absolute;
	top: 500px;
	left: 150px;
	z-index: -2;
	border-top: 200px solid transparent;
	border-right: 300px solid #15224a;
	border-bottom: 150px solid transparent;
	transform: rotate(-2deg);
}

#bottomBlurBg{
	position: absolute;
	top: 490px;
	left: 110px;
	z-index: -1;
	border-top: 200px solid transparent;
	border-right: 260px solid rgba(69,138,182,0.4);
	border-bottom: 120px solid transparent;
	transform: rotate(10deg);
}

.enterButton{
	position: absolute;
	top: 660px; 
	left: 330px;
	width: 70px;
	height: 70px;
	text-align: center;
}

.text-white{
	color: #fff;
}

.enterText{
	text-transform: uppercase;
	font-size: 20px;
	font-weight: 300;
	font-family: 'Open Sans', sans-serif;
}

.loginForm{
	position: absolute;
	top: 300px;
	left: 70px;
}

.title{
	 font-weight: 300;
	 font-size: 24px;
	 line-height: 1;
}

.title span{
	font-weight: 800;
	/*letter-spacing: 3px;*/
}

.title hr{
	width: 150px;
	border-width: 2px;
	border-color: #67e2fb; 
	margin: 0;

}

hr.short{
	width: 50px;
	border-width: 2px;
	border-color: #67e2fb; 
	float: left;
	margin: 0;

}


/*= input focus effects css
=========================== */
:focus{outline: none;}

.col-3{float: left; width: 100%; margin-top: 20px; margin-bottom: 0;} 
input{margin-top: 15px;font: 15px/24px "Open Sans", sans-serif; color: #333; width: 100%; box-sizing: border-box; letter-spacing: 1px; width: 65%;}

input::placeholder{
	text-transform: uppercase;
	letter-spacing: 0;
	font-size: 20px;
	font-weight: 300;
	padding-left: 15px;
}

.effect-2{border: 0; padding: 7px 0; border-bottom: 1px solid #ccc;}

.forget button{
	margin-top: 50px;
	border-radius: 0;
	color: #aaa;
	margin-left: 50px;
	font-weight: 700;
}


</style>
<title>CartPage</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="utf-8">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body><!--  
<body   background="${pageContext.request.contextPath}/resources/back.jpg"  >-->
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
                    
                              <li role="presentation"><a href="registration">Register </a></li>
                           
                            
                        </ul>
                  
               
            </div>
        </div>
    </nav>
</div>
<form  method="post" action="j_spring_security_check" class="form-horizontal" align="center">
	
	<div class="container">
	<div class="row">
		<div class="col-md-6 col-sm-6 col-xs-6 col-md-offset-3">
  			<div id="iosBlurBg">
  				<div id="whiteBg"></div>
  			</div>
  			<div id="bottomEnter"></div>
  			<div id="bottomBlurBg"></div>
  			<!-- Login Form -->
  			<div class="loginForm">
  				<div class="title">
  					<p>LOG INTO<br><span>SYSTEM</span></p>
  					<hr>
  					<hr class="short">
  				</div>
  				<form>
  					<div class="col-3">
			        	<input class="effect-2"  name="j_username" type="text" placeholder="Login...">
			            <span class="focus-border"></span>

			            <input class="effect-2" name="j_password" type="password" placeholder="Password...">
			            <span class="focus-border"></span>
			        </div>

			        

  				</form>
  			</div>
  			
  				
	  			<div class="enterButton">
	  			<i class="fa fa-lock fa-2x text-white"></i><br>
	  				<input type="submit" value="Enter"class="enterText"></input>
	  			</div>
  			
  			<!--	<div class="enterButton">
	  				<i class="fa fa-lock fa-2x text-white"></i><br>
	  				<input type="submit"  id="btn-add" class="enterText text-white" value="Enter">Enter
	  				<span class="enterText text-white" id="btn-add">Enter</span> --> 
	  			</div>
  			
		</div>
	</div>
</div>
	<!--  <div class="container">
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
			    	<form accept-charset="UTF-8" role="dialog">
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
		
	</div></fieldset>-->
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
<br>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

</form></body></head><jsp:include page="footer.jsp" />
</html>