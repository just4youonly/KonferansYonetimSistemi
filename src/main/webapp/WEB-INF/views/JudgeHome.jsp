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
	  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>
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
		
		  .modal {
		    background-color: rgba(131, 131, 131, 0.418);
		    position: fixed;
		    top: 0;
		    left: 0;
		    z-index: 1050;
		    display: block;
		    width: 100%;
		    height: 100%;
		    overflow: hidden;
		    outline: 0;
		  }
		  .modal-dialog{
		    width:70% !important;
		    margin-top: 150px !important;
		    margin-left: 15%!important;
		  }
		  @media (min-width: 576px){
		    .modal-dialog {
		      max-width: none!important;
		      margin:  none!important;
		      margin-left: 15%!important;
		    }
		  }
		  li{
		    margin-bottom: 5px!important;
		  }
		  li:hover{
		    box-shadow: 1px 4px   7px #40464d73!important;
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
<c:if test="${param.act == 'up'}">
	<div class="container alert alert-success">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<p style="text-align: center;">Your Info Updated Successfully!</p>
	</div>
</c:if>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
    <a class="navbar-brand" onclick="goto('home')"><img  title="Home" class="img" src="<c:url value="/resources/pic/logoo.png"/>"></img></a>
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


<div class="container text-center" style="margin-top:100px;">
  <p class="navbar-brand" style="color:#212529"><Strong>${sessionScope.user.getUser_name()}</Strong> Welcome again </p><br>
  <p class="navbar-brand" style="color:#212529"> On behalf of our team and management</p><br>
  <p class="navbar-brand" style="color:#212529"> We would like you to know that we are so grateful of having you </p><br>
  <p class="navbar-brand" style="color:#212529">Please select option from menu</p><br>
</div>

<div class="jumbotron text-center" style="margin-top:150px;margin-bottom:0px">
    	<p><a onclick="goto('home')" class="navbar-brand"><img class="img1" src="<c:url value="/resources/pic/logo.png"/>"></img></a></p>
    	<p style="color:black">All&copy;rights reserved 2019</p>
</div>

<c:if test="${sessionScope.role!=null}">
	<a  href="../Author/home" id="myBtn1" title="Change Mode To Author" style="display:block; text-decoration: none;" > <i class="fa fa-refresh" style="margin-right:10px;"></i> Mode</a>
</c:if>

<c:if test="${sessionScope.ctrl == true}">
	<div class="modal"  style="overflow: auto;padding-bottom: 200px" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
	  
	    		<!-- Modal Header -->
				<div class="modal-header">
				  <a class="modal-title" id="headmodal"><Strong style="color:red;">*</Strong> Before Continue Select The Fields You Are Interested In </a>
				</div>
	
				<!-- Modal body -->
				<div class="modal-body" ng-app="myFieldList" ng-cloak ng-controller="myCtrl"  >
				  <ul class="w3-ul " ng-repeat="x in fieldsname"  >
				      <li  class="w3-padding-1 keyword w3-light-grey " style="border-bottom:1px solid grey">{{x}}<span ng-click="removeItem2($index)" style="cursor:pointer;" class="w3-right w3-margin-right">×</span></li>
				</ul>
				<div class="w3-container  w3-padding-1">
				  <div class="w3-row w3-margin-top">
				    <div class="w3-col s12">
				      <select placeholder="Select Keyword Here"   ng-model="addkeyword" class="w3-input w3-border w3-padding" >
				        <option  ng-repeat="x in Allfields"  value="{{x.id}}_{{x.name}}" >{{x.name}}</option>
				      </select>
				      
				    </div>
				    <div class="w3-col s2">
				      <button ng-click="addfields()" type="button" class="w3-btn w3-padding w3-grey " id="add"  style="color:white !important ;; background-color:#343a40 !important ;border:#343a40;" >Add</button>
				    </div>
				    </div>
				    <p class="w3-text-red">{{errortext2}}</p>
				  </div>
				</div>
				<div class="w3-container  w3-padding-1">
				    <a class="modal-title" >
				      <Strong style="color:red;">*</Strong  > 
		              <c:choose>
		              	<c:when test="${sessionScope.role!=null}">
		              		<a class="modal-title" id="modetext" > Press To Deactivate Author Mode  </a>
		              		<input type="checkbox" id="mode" checked>
		              	</c:when>
		              	<c:otherwise>
	              			<a class="modal-title" id="modetext" > Press To Activate Author Mode  </a>
		              		<input type="checkbox" id="mode" >
		              	</c:otherwise>
		              </c:choose>
				    </a>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="w3-btn w3-padding w3-grey " id="send"  style="color:white !important ;;background-color:#343a40 !important ;border:#343a40;" data-dismiss="modal">Send</button>
				</div>
	  		</div>
		</div>
	</div>
</c:if>

<script type="text/javascript" src="<c:url value="/resources/js/JudgeHome.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/GoTo.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/Message.js"/>"></script>
</body>
</html>
