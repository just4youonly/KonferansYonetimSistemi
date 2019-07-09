<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>Author</title>
	<link rel="icon" href="<c:url value="/resources/pic/logo.png"/>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<style>
	  body{
	    -webkit-user-select: none; /* Safari 3.1+ */
	    -moz-user-select: none; /* Firefox 2+ */
	    -ms-user-select: none; /* IE 10+ */
	    user-select: none; /* Standard syntax */
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
	  .mycont{
	    margin-top:100px;
	    width: 50%;
	    margin-left: 25%;
	  }
	  a{
	    margin-left: 20x;
	  }
	  button{
	    background-color: #5f5f5f !important;
	  }
	  .jumbotron1{
		position: fixed;
		left: 0;
		bottom: 0;
		width: 100%;
		background-color: #e9ecef;
		color: white;
		text-align: center;
		padding:30px;
	  }
    </style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	    <a class="navbar-brand" onclick="goto('home')"><img title="Home" class="img" src="<c:url value="/resources/pic/logoo.png"/>"></img></a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	        <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="collapsibleNavbar" style="margin-left:15px;">
	      <ul class="navbar-nav ">
	        <li class="nav-item .div">
	           <div onclick="goto('incomingReports')" title="Incoming Reports"  class="div nav-item" style="margin-right:15px;color:rgba(255,255,255,.5)">
		           <i class="	fa fa-download"  style="font-size:20px ;" ></i> 
		           <a style="font-size:20px ;" >Reports</a>
	           </div>
	        </li>
	        <li class="nav-item .div">
	            <div onclick="goto('sentReports')" title="Sent Reports" class="div nav-item" style="margin-right:15px;color:rgba(255,255,255,.5)">
		            <i class="fa fa-upload"  style="font-size:20px ;" ></i> 
		            <a style="font-size:20px ;" >Reports</a>
	            </div>
	        </li>
	      </ul>
	    </div>  
	    <div class="navbar .div" >
	        <div onclick="goto('editProfile')" class="div " title="Edit Profile" style="margin-right:15px;color:rgba(255,255,255,.5)">
		        <a style="margin-right:5px;font-size:20px ;" >
		        	<c:if test="${sessionScope.user!=null}">
	        			${sessionScope.user.getUser_name()} ${sessionScope.user.getUser_surname()}
	        		</c:if>
		        </a>
		        <i class="fa fa-user"  style="font-size:20px ;" ></i>
	        </div>
	    </div>
	    <div class="navbar" >
	    	<div class="div .div" style="margin-right:15px; color:rgba(255,255,255,.5)">
	        <a onclick="goto('../logout')" style="margin-right:5px;font-size:20px;" >Sign Out</a>
	        <i class="fa fa-sign-out" style="font-size:20px;"></i>
        	</div>    
        </div>
	</nav>
	
	<div class="mycont" >
	    <div class="container" >
	      <f:form action="${pageContext.request.contextPath}/OCC/updateProfile" class="was-validated" modelAttribute="commandEdit">
	          <div class="form-group">
	          <label for="name">Name:</label>
	          <f:input path="user_name" type="text" class="form-control" id="name" placeholder="Enter name" name="name" required="required" value="${sessionScope.user.getUser_name()}"/>
	          </div>
	          <div class="form-group">
	            <label for="surname">Surname:</label>
	            <f:input path="user_surname" type="text" class="form-control" id="surname" placeholder="Enter surname" name="surname" required="required" value="${sessionScope.user.getUser_surname()}"/>
	          </div>
	          <div class="form-group">
	            <label for="useremail">Email:</label>
	            <f:input path="user_email" type="text" class="form-control" id="useremail" placeholder="Enter email" name="useremail" required="required" value="${sessionScope.user.getUser_email()}"/>
	          </div>
	          <div class="form-group">
	          <label for="pwd">Password:</label>
	          <f:input path="user_password" type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required="required"/>
	          </div>
	          <br>
	          <button type="submit" class="btn btn-primary" style="padding-left:25px;padding-right:25px;float: right">Edit</button>
	          <br>
	          <br><br>
	      </f:form>
	    </div>
	</div>
	<div class="jumbotron text-center" style="margin-top:150px;margin-bottom:0px">
    	<p><a onclick="goto('home')" class="navbar-brand"><img class="img1" src="<c:url value="/resources/pic/logo.png"/>"></img></a></p>
    	<p style="color:black">All&copy;rights reserved 2019</p>
	</div>
	<script type="text/javascript" src="<c:url value="/resources/js/GoTo.js"/>"></script>
</body>
</html>