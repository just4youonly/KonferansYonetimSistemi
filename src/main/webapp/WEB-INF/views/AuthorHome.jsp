<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Author</title>
	<link rel="icon" href="<c:url value="/resources/pic/logo.png"/>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	 <style>
		body{
			-webkit-user-select: none; /* Safari 3.1+ */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
			font-family: Verdana,sans-serif !important;
		}  
		.fakeimg {
			height: 200px;
			background: #aaa;
		}
		.img{
			cursor: pointer;
	  		width: 50px;
		}
		.img1{
			width:250px;
		}
		.div{
			cursor:pointer;
			margin-right: 10px;
		}
		.div:hover{
			transform: scale(1.02);
			border-bottom:1px solid rgba(255,255,255,.5);
			color: white;
		}
		.div:hover {
	  		color: white !important;
		}
		.btn:hover span{
			color: white !important;
		}
		.nav-item:hover{
			color: white;
		}
		#myBtn1 {
			position: fixed;
			top: 80px;
			right: -65px;
			z-index: 99;
			font-size: 18px;
			border: none;
			outline: none;
			background-color: #555;
			color: white;
			cursor: pointer;
			padding: 15px;
			border-radius: 4px;
			transition: 0.3s;
		}
		#myBtn1:hover {
			background-color: rgb(95, 93, 93);
			transform: scale(1.02);
			right: -0px;
			border-bottom:1px solid rgba(255,255,255,.5);
		}
		
	</style>
</head>
<body>
<c:if test="${param.act == 'up'}">
	<div class="container alert alert-success">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<p style="text-align: center;">Your Info Updated Successfully!</p>
	</div>
</c:if>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
    <a class="navbar-brand" onclick="goto('home')"><img title="Home" class="img" src="<c:url value="/resources/pic/logoo.png"/>"></img></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar" style="margin-left:15px;">
	    <ul class="navbar-nav ">
	     <li class="nav-item .div">
	        <div class="div nav-item" style="margin-right:15px;color:rgba(255,255,255,.5)">
	         <i class="	fa fa-plus-square-o"  style="font-size:20px;"></i> 
	         <a onclick="goto('addReport')" style="font-size: 20px;">Report</a>
	        </div>
	     </li>
	     <li class="nav-item .div">
	         <div class="div nav-item" style="margin-right:15px;color:rgba(255,255,255,.5)">
	          <i class="fa fa-list"  style="font-size:20px ;" ></i> 
	          <a onclick="goto('myReports')" style="font-size:20px;">Reports</a>
	         </div>
	     </li>
	    </ul>
    </div>  
    <div class="navbar .div" >
        <div class="div" style="margin-right:15px;color:rgba(255,255,255,.5)">
	        <a onclick="goto('editProfile')" style="margin-right:5px; font-size:20px;" >
	        	<c:if test="${sessionScope.user!=null}">
	        		${sessionScope.user.getUser_name()} ${sessionScope.user.getUser_surname()}
	        	</c:if>
	        </a>
	        <i class="fa fa-user" style="font-size:20px;"></i>
        </div>
    </div>
    <div class="navbar" >
        <div class="div .div" style="margin-right:15px; color:rgba(255,255,255,.5)">
	        <a onclick="goto('../logout')" style="margin-right:5px;font-size:20px;" >Sign Out</a>
	        <i class="fa fa-sign-out" style="font-size:20px;"></i>
        </div>
    </div>
</nav>

<div class="container text-center" style="margin-top:100px;">
	<p class="navbar-brand" style="color:#212529"><Strong>${sessionScope.user.getUser_name()}</Strong> Welcome again </p><br>
	<p class="navbar-brand" style="color:#212529"> On behalf of our team and management</p><br>
	<p class="navbar-brand" style="color:#212529"> We would like you to know that we are so grateful of having you </p><br>
	<p class="navbar-brand" style="color:#212529">Please select option from menu</p><br>
</div>

<div class="jumbotron text-center" style="margin-top:150px;margin-bottom:0px">
    	<p><a onclick="goto('home')" class="navbar-brand"><img class="img1" src="<c:url value="/resources/pic/logo.png"/>"></img></a></p>
    	<p style="color:black">All &copy;rights reserved 2019</p>
</div>
<c:if test="${sessionScope.role!=null}">
	<button  id="myBtn1" title="Change Mode To Judge" style="display:block" > <i class="fa fa-refresh" style="margin-right:10px;"></i> Mode</button>
</c:if>
<script type="text/javascript" src="<c:url value="/resources/js/GoTo.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/Message.js"/>"></script>
</body>
</html>
