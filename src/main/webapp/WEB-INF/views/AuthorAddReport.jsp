<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
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
		.div2 {
		  height: 200px;
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
		#myBtn {
		  display: none;
		  position: fixed;
		  bottom: 50px;
		  right: 30px;
		  z-index: 99;
		  font-size: 18px;
		  border: none;
		  outline: none;
		  background-color: #555;
		  color: white;
		  cursor: pointer;
		  padding: 15px;
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
<body id="body">


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


<div class="container" style="margin-top:30px" id="container">
<div class="container" id="alert" style="display:none">
  <div class="alert alert-success alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong id="alerttxt"></strong>
  </div>
</div>

    <h2>Write Report</h2>
    <div class="row" style=" margin-left: 0px;">
    <div class="col-sm-12" style="margin: 0px!important;margin-top: 16px!important;padding: 0px;">
        <div ng-app="myReport" ng-cloak ng-controller="myCtrl"  class="w3-card-2 w3-margin" style="max-width:100%;margin-left: 5%px;background-color: #f1f1f1">
            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
              <h5>Authors names and emails</h5>
            </header>
            <ul class="w3-ul " ng-repeat="x in name">
              <li   class="w3-padding-1 name">Name: {{x}}<span ng-click="removeItem($index)" style="cursor:pointer;" class="w3-right w3-margin-right">×</span></li>
              <li  style="border-bottom:1px solid grey" class="w3-padding-1 email">Email: {{email[$index]}}</li>
            </ul>
            <div class="w3-container w3-light-grey w3-padding-1">
              <div class="w3-row w3-margin-top">
                <div class="w3-col s12">
                  <input placeholder="Write Name here" ng-model="wName" class="w3-input w3-border w3-padding">
                  <input type="email" placeholder="Write Email here" ng-model="wEmail" class="w3-input w3-border w3-padding" >
                </div>
                <div class="w3-col s2">
                  <button ng-click="addItem()" class="w3-btn w3-padding w3-grey" style="background-color:#343a40 !important ;color:white !important ">Add</button>
                </div>
              </div>
              <p class="w3-text-red">{{errorTextItem}}</p>
            </div>

            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                <h5>Report Topics</h5>
            </header>
            <ul class="w3-ul " ng-repeat="x in topic">
                <li  class="w3-padding-1 topic" style="border-bottom:1px solid grey">{{$index+1}}- {{x}}<span ng-click="removeTopic($index)" style="cursor:pointer;" class="w3-right w3-margin-right">×</span></li>
            </ul>
            <div class="w3-container w3-light-grey w3-padding-1">
              <div class="w3-row w3-margin-top">
                <div class="w3-col s12">
                  <input placeholder="Write Topic Here" ng-model="rTopic" class="w3-input w3-border w3-padding">
                </div>
                <div class="w3-col s2">
                  <button ng-click="addTopic()" class="w3-btn w3-padding w3-grey" style="background-color:#343a40 !important ;color:white !important ">Add</button>
                </div>
              </div>
              <p class="w3-text-red">{{errorTextTopic}}</p>
           </div>
            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                <h5>Report keywords</h5>
            </header>
            <ul class="w3-ul " ng-repeat="x in keyword"  >
                <li  class="w3-padding-1 keyword" style="border-bottom:1px solid grey">{{$index+1}}- {{x}}<span ng-click="removeKeyword($index)" style="cursor:pointer;" class="w3-right w3-margin-right">×</span></li>
            </ul>
            <div class="w3-container w3-light-grey w3-padding-1">
              <div class="w3-row w3-margin-top">
                <div class="w3-col s12">
                  <input placeholder="Write Keyword Here" ng-model="rKeyword" class="w3-input w3-border w3-padding">
                </div>
                <div class="w3-col s2">
                  <button ng-click="addKeyword()" class="w3-btn w3-padding w3-grey" style="background-color:#343a40 !important ;color:white !important ">Add</button>
                </div>
              </div>
              <p class="w3-text-red">{{errorTextKeyword}}</p>
            </div>

                <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                    <h5>Institution Name :</h5>
                </header>
                <div class="w3-container w3-light-grey w3-padding-1">
                  <div class="w3-row w3-margin-top">
                    <div class="w3-col s12">
                      <input id="instName" name="instName" placeholder="Write Institution Name Here" class="w3-input w3-border w3-padding req">
                    </div>
                  </div>
                </div>

                <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                    <h5>Report Title :</h5>
                </header>
                <div class="w3-container w3-light-grey w3-padding-1">
                  <div class="w3-row w3-margin-top">
                    <div class="w3-col s12">
                      <input  id="reportTitle" name="reportTitle"  placeholder="Write Report Title  Here"class="w3-input w3-border w3-padding req">
                    </div>
                  </div>
                </div>

                <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                    <h5>Report Abstract :</h5>
                </header>
                <div class="w3-container w3-light-grey w3-padding-1">
                  <div class="w3-row w3-margin-top">
                    <div class="w3-col s12">
                        <textarea id="reportAbstract" name="reportAbstract" maxlength="1000" rows="15" placeholder="Write Report Abstract Here" contenteditable="true" class="w3-input w3-border w3-padding req" style="background-color:#ffffff"></textarea>
                    </div>
                  </div>
                </div>

                <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                    <h5>Report  :</h5>
                </header>
                <div class="w3-container w3-light-grey w3-padding-1" style="padding-bottom:16px;">
                  <div class="w3-row w3-margin-top">
                    <div class="w3-col s12" style="overflow:auto;">
                      <textarea  id="report" name="report" maxlength="5000" rows="15" placeholder="Write Report  Here" contenteditable="true"  class="w3-input w3-border w3-padding req" style="background-color:#ffffff"></textarea>
                    </div>
                  </div>
                </div>
                <div class="w3-container w3-light-grey w3-padding-1" style="padding-bottom:16px;">
                  <div class="w3-row w3-margin-top">
                    <div class="w3-col s12" style="overflow:auto;">
                      <input id="u_id" type="hidden" value="${sessionScope.user.getUser_id()}">
                      <button id="send" class="w3-btn w3-padding w3-grey" style="background-color:#343a40 !important ;color:white !important;max-resolution: right 45% !important;float:right; width: 20%">Send</button>
                    </div>
                  </div>
                </div>
        </div>
    </div>
 </div>     
</div>

<div class="jumbotron text-center" style="margin-top:150px;margin-bottom:0px">
    	<p><a onclick="goto('home')" class="navbar-brand"><img class="img1" src="<c:url value="/resources/pic/logo.png"/>"></img></a></p>
    	<p style="color:black">All &copy;rights reserved 2019</p>
</div>
<c:if test="${sessionScope.role!=null}">
	<button  id="myBtn1" title="Change Mode To Judge" style="display:block;" > <i class="fa fa-refresh" style="margin-right:10px;"></i> Mode</button>
</c:if>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<script type="text/javascript" src="<c:url value="/resources/js/GoTo.js"/>"></script>
<script src="<c:url value="/resources/js/AuthorAdd.js"/>" ></script>
</body>
</html>