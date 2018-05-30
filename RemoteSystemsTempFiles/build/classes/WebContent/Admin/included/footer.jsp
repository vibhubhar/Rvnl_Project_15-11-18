<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
<title>Insert title here</title>
<style>
@import url('http://fonts.googleapis.com/css?family=Open+Sans:400,700');


footer{
	position: absolute;
	margin-top:20px;
	bottom: 0;
}

@media (max-height:800px){
	footer { position: static; }
	header { padding-top:10px; }
}

.footer-basic-centered{
	background-color:#8C001A; //#003399;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	width: 100%;
	text-align: center;
	font: normal 18px sans-serif;
	height:40px;
	padding: 10px;
	
}

.footer-basic-centered .footer-company-motto{
	color:  #fff;
	font-size: 24px;
	margin: 0;
}

.footer-basic-centered .footer-company-name{
	color:  #fff;
	font-size: 14px;
	margin: 0;
}

.footer-basic-centered .footer-links{
	list-style: none;
	font-weight: bold;
	color:  #fff;
	padding: 10px 0 10px;
	margin: 0;
}

.footer-basic-centered .footer-links a{
	display:inline-block;
	text-decoration: none;
	color: inherit;
}

/* If you don't want the footer to be responsive, remove these media queries */

@media (max-width: 600px) {

	.footer-basic-centered{
		padding: 10px;
		height:40px;
		//bottom:0;
	}

	.footer-basic-centered .footer-company-motto{
		
		float:right;
	}

	.footer-basic-centered .footer-company-name{
		font-size: 12px;
	}

	.footer-basic-centered .footer-links{
		font-size: 14px;
		
	}

	.footer-basic-centered .footer-links a{
		line-height: 0.8;
	}
}

</style>
</head>
<body>




<!-- 
<footer>
<div class="city">
  <ul class=" nav navbar-nav">
  
    <li class="footerli">Rail Vikas Nigam Limited.</li>
    </ul>
    <ul   class="nav navabar-nav" style="float:right;">
   <li class="footerli">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Design & Developed By<a href="http://www.awcsoftware.net" style="text-decoration:none;">AWC SOFTWARE PVT LTD</a></li>
    
  </ul>
 </div>

</footer> -->

<footer class="footer-basic-centered">

			<p class="footer-company-motto" style="float:left;">Rail Vikas Nigam Limited</p>

			<p class="footer-company-name" style="float:right;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Design & Developed By<a href="http://www.awcsoftware.net">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AWC SOFTWARE PVT LTD</a></p>

		</footer>
</body>