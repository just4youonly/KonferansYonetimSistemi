<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	  <title>Judge</title>
	  <link rel="icon" href="<c:url value="/resources/pic/logo.png"/>">
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>
	  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
	
	  .tr:hover{
	    transform: scale(1.02);
	    box-shadow: 4px 4px 16px 4px rgba(0, 0, 0, 0.19), 4px 4px 16px 4px rgba(0, 0, 0, 0.19);
	
	  }
	  #myBtn {
	    display: none;
	    position: fixed;
	    bottom: 50px;
	    right: 0px;
	    z-index: 99;
	    font-size: 18px;
	    border: none;
	    outline: none;
	    background-color: #555;
	    color: white;
	    cursor: pointer;
	    padding: 5px;
	    border-radius: 4px;
	  }
	
	  #myBtn:hover {
	    background-color: rgb(95, 93, 93);
	    transform: scale(1.02);
	    border-bottom:1px solid rgba(255,255,255,.5);
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
<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
    <a class="navbar-brand" onclick="goto('home')"><img title="Home" class="img" src="<c:url value="/resources/pic/logoo.png"/>"></img></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar" style="margin-left:15px;">
      <ul class="navbar-nav ">
        <li class="nav-item .div">
           <div onclick="goto('myReports')" title="Incoming Reports"  class="div nav-item" style="margin-right:15px;color:rgba(255,255,255,.5)">
	           <i class="	fa fa-download"  style="font-size:20px ;" ></i> 
	           <a style="font-size:20px ;" >Reports</a>
           </div>
        </li>
        <li class="nav-item .div">
            <div onclick="goto('myFields')" title="List My Fields" class="div nav-item" style="margin-right:15px;color:rgba(255,255,255,.5)">
	            <i class="fa fa-list"  style="font-size:20px ;" ></i> 
	            <a style="font-size:20px ;" >Fields</a>
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
        <div  onclick="goto('../logout')" class="div .div" title="Sign Out " style="margin-right:15px;color:rgba(255,255,255,.5)">
	        <a style="margin-right:5px;font-size:20px ;" >Sign Out</a>
	        <i class="fa fa-sign-out"  style="font-size:20px ;" ></i>
        </div>
    </div>
</nav>

<div class="container " style="margin-top:30px;">
<div class="container" >
  <h2 style="margin-bottom: 25px;">Reports Sent By OCC</h2>
  <h5 style="margin-bottom: 15px;" >Select For More Details</h5>
  <table class="table table-striped text-center"  >
    <thead>
      <tr style="border-bottom:3px solid grey" >
        <th>Report Id</th>
        <th>Report Title</th>
        <th>Sender Author</th>
        <th>Result Date</th>
      </tr>
    </thead>
    <tbody style="	cursor:pointer" ng-app="myReports" ng-cloak ng-controller="myCtrl">
      <tr ng-repeat="x in Reports" onclick="send(this)" data-toggle="tooltip" title="Select For More Detiles" class="tr" style="background-color:rgba(0,0,0,.05)">
        <td id="rep_{{x.id}}">{{x.id}}</td>
        <td>{{x.title}}</td>
        <td>{{x.userName}}</td>
        <td>{{x.resultDate}}</td>
      </tr>
    </tbody>
  </table>
</div>
</div>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<div class="jumbotron text-center" style="margin-top:150px;margin-bottom:0px">
    	<p><a onclick="goto('home')" class="navbar-brand"><img class="img1" src="<c:url value="/resources/pic/logo.png"/>"></img></a></p>
    	<p style="color:black">All&copy;rights reserved 2019</p>
</div>
<c:if test="${sessionScope.role!=null}">
	<a href="../Author/home" id="myBtn1" title="Change Mode To Author" style="display:block; text-decoration: none;" > <i class="fa fa-refresh" style="margin-right:10px;"></i> Mode</a>
</c:if>
<script type="text/javascript" src="<c:url value="/resources/js/JudgeMyReports.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/GoTo.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/Message.js"/>"></script>
</body>
</html>