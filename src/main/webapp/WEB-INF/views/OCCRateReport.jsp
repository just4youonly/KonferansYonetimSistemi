<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	 <title>OCC</title>
	 <link rel="icon" href="<c:url value="/resources/pic/logo.png"/>">
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	    font-family: Verdana,sans-serif !important;
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
	
	  #show:hover {
	    background-color:#343a40!important;
	    color:white!important;
	    transform: scale(1.02);
	    border-bottom:2px solid black!important;
	  }
	  #show1:hover {
	    background-color:#343a40!important;
	    color:white!important;
	    transform: scale(1.02);
	    border-bottom:2px solid black!important;
	  }
	
	  .ok{
	    background-color:#343a40 !important ;
	    color:white !important;
	  }
	  .notok{
	    background-color:#989a9c !important ;
	    color:black !important;
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
	<div class="container" style="margin-top:30px" id="container" ng-app="myReportList" ng-cloak ng-controller="myCtrl">
    
	    <div class="row" style=" margin-left: 0px;">
	   
	    <div class="col-sm-12" style="margin: 0px!important;margin-top: 16px!important;padding: 0px;" >
	        <div   class="w3-card-2 w3-margin" style="max-width:100%;margin-left: 5%px;background-color: #f1f1f1">
	            <header ng-click="showme = !showme" onclick="changetoo()" id="show" class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
	              <h2 >Click To Show Report's Details </h2>
	            </header>
	            
	            
        <div ng-show="showme" id="showme">
            <br>
            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
              <h5>Authors names and emails :</h5>
            </header>
            <ul class="w3-ul " ng-repeat="x in name"  >
              <li   class="w3-padding-1 name">-Name :{{x}}</li>
              <li  style="border-bottom:1px solid grey" class="w3-padding-1 email">-Email :{{email[$index]}}</li>
            </ul>
            <br>
            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                <h5>Report Topics :</h5>
            </header>
            <ul class="w3-ul " ng-repeat="x in topic track by $index"  >
                <li  class="w3-padding-1 topic" style="border-bottom:1px solid grey">-{{x}}</li>
            </ul>
            <br>
            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                <h5>Report keywords :</h5>
            </header>
            <ul class="w3-ul " ng-repeat="x in keywords track by $index"  >
                <li  class="w3-padding-1 keyword" style="border-bottom:1px solid grey">-{{x}}</li>
            </ul>
            <br>

            <header  class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey" >
                <h5>Institution Name :</h5>
            </header>
            <ul class="w3-ul " ng-model="institutionName" >
              <li  id="InstitutionName" class="w3-padding-1 keyword" style="border-bottom:1px solid grey">-{{institutionName}}</li>
            </ul>
            <br>

            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                <h5>Report Title :</h5>
            </header>
            <ul class="w3-ul " ng-model="reportTitle" >
              <li  id="ReportTitle" class="w3-padding-1 keyword" style="border-bottom:1px solid grey">-{{reportTitle}}</li>
            </ul>
            <br>

            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                <h5>Report Abstract :</h5>
            </header>
            <div class="w3-container w3-light-grey w3-padding-1">
              <div class="w3-row w3-margin-top">
                <div class="w3-col s12" ng-model="reportAbstract">
                    <textarea name="ReportAbstract" rows="15"  readonly placeholder="Write Report Abstract Here" class="w3-input w3-border w3-padding req" style="background-color:#ffffff">{{reportAbstract}}</textarea>
                </div>
              </div>
            </div>

            <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey">
                <h5>Report  :</h5>
            </header>
              <div class="w3-container w3-light-grey w3-padding-1" style="padding-bottom:16px;">
                <div class="w3-row w3-margin-top" ng-model="report">
                  <div class="w3-col s12" style="overflow:auto;">
                    <textarea  name="Report"  rows="15" readonly placeholder="Write Report  Here"   class="w3-input w3-border w3-padding req" style="background-color:#ffffff">{{report}}</textarea>
                  </div>
                </div>
              </div>
        </div>
	        
	    </div>
	    
	    <div class="col-sm-12" style="margin: 0px!important;margin-top: 16px!important;padding: 0px;">
	        <div  class="w3-card-2 w3-margin" id="mar" style="max-width:100%;margin-left: 5%px;background-color: #f1f1f1;">
	            <header ng-click="showme1 = !showme1" onclick="changetoo1()" id="show1" class="w3-container w3-light-grey w3-padding-1" style="border-bottom:3px solid grey;margin-bottom: 10px;">
	                <h3  >Click To Show Result :</h3>
	            </header>
	            <h3 ng-show="!showme1" id="rate"  style="margin-left:15px" >Referees's Rating : </h3>  
	            <header ng-show="!showme1" ng-repeat="x in userOpinion" class="w3-container w3-light-grey w3-padding-1" style="border-bottom:1px solid grey">
	              <h5 class="seetstar" id="seet_{{x.result}}" >-{{x.name}} :  </h5>
	            </header>
	            
	            <ul ng-show="showme1" id="showme1" class="w3-ul " ng-repeat="x in userOpinion" style="border:1px solid grey;margin: 10px;" >
	              <li  class="w3-padding-1" >
	                <header class="w3-container w3-light-grey w3-padding-1" style="border-bottom:1px solid grey">
	                    <h5 class="setstar" id="set_{{x.result}}" >-{{x.name}} : </h5>
	                </header>
	                <h6>opinion1 :</h6>
	                <textarea readonly  rows="3"   class="w3-input w3-border w3-padding" style="background-color:#ffffff">{{x.opinion1}}</textarea>
	                <h6>opinion2 :</h6>
	                <textarea readonly  rows="3"   class="w3-input w3-border w3-padding" style="background-color:#ffffff">{{x.opinion2}}</textarea>
	              </li>
	            </ul>
	            <div class="w3-container w3-light-grey w3-padding-1" style="padding-bottom:16px;">
	                <div class="w3-row w3-margin-top"  >
	                  <div class="w3-col s12" style="overflow:auto;">
	                    <button   id="send" class="w3-btn w3-padding w3-grey" style="background-color:#343a40 !important ;color:white !important;max-resolution: right 45% !important;float:right; width: 150px">Send</button>
	                    <button  value="yes" id="yes" class="w3-btn w3-padding w3-grey notok" style="max-resolution: right 45% !important;float:left; width: 70px ;margin-right:10px;">Yes</button>
	                    <button  value="no" id="no" class="w3-btn w3-padding w3-grey ok" style="max-resolution: right 45% !important;float:left; width: 70px">No</button>
	                  </div>
	                </div>
              	</div>
          	</div>
       	</div>
   		</div>     
 		</div>     
	</div>
	<div class="jumbotron text-center" style="margin-top:150px;margin-bottom:0px">
    	<p><a onclick="goto('home')" class="navbar-brand"><img class="img1" src="<c:url value="/resources/pic/logo.png"/>"></img></a></p>
    	<p style="color:black">All&copy;rights reserved 2019</p>
	</div>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<script type="text/javascript" src="<c:url value="/resources/js/GoTo.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/OCCRateReport.js"/>"></script>
</body>
</html>