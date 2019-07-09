var data = "";
var selected_data = "";
var wNames = "";
var wEmails= "";
var rTopics = "";
var rKeywords = "";


var app = angular.module("myReport", []);
app.controller("myCtrl", function($scope) {
    $scope.name =[];
    $scope.email =[];
    $scope.topic =[];
    $scope.keyword =[];
    
    $scope.addItem = function () {
        $scope.errorTextItem = "";
        if (!$scope.wName) {return;}
        if (!$scope.wEmail) {return;}
          
        if ($scope.name.indexOf($scope.wName) == -1 && $scope.email.indexOf($scope.wEmail) == -1) {
            $scope.name.push($scope.wName );
            $scope.email.push( $scope.wEmail);
            $scope.wName = "";
            $scope.wEmail = "";
        } else {
            $scope.errorTextItem = "An Author with this info is already exist.";
        }
    }

    $scope.addTopic = function () {
        $scope.errorTextTopic = "";
        if (!$scope.rTopic) {return;}
        
        if ($scope.topic.indexOf($scope.rTopic) == -1) {
            $scope.topic.push( $scope.rTopic );
            $scope.rTopic = "";
        } else {
            $scope.errorTextTopic = "This Topic is already exist.";
        }
    }

    $scope.addKeyword = function () {
        $scope.errorTextKeyword = "";
        if (!$scope.rKeyword) {return;}
          
        if ($scope.keyword.indexOf($scope.rKeyword) == -1) {
            $scope.keyword.push( $scope.rKeyword);
            $scope.rKeyword = "";
        } else {
            $scope.errorTextKeyword = "This Keyword is already exist.";
        }
    }

    $scope.removeItem = function (x) {
        $scope.errorTextItem = "";    
        $scope.name.splice(x, 1);
        $scope.email.splice(x, 1);
    }
    $scope.removeTopic = function (x) {
        $scope.errorTextTopic = "";    
        $scope.topic.splice(x, 1);
    }
    $scope.removeKeyword = function (x) {
        $scope.errorTextKeyword = "";    
        $scope.keyword.splice(x, 1);
    }
    
    $("#send").click(function() {
      var ctrl ;
      $("#container").find('.req').each(function(){
          if($(this).val()==""){
            ctrl=0;
          } 
      });
      
      if(ctrl != 0 && $scope.topic.length != 0 && $scope.keyword.length != 0 && $scope.name.length != 0 && $scope.email.length != 0){
    	  for(var x in $scope.name){
        	  wNames += $scope.name[x] + ",";
          }
    	  for(var x in $scope.email){
    		  wEmails += $scope.email[x] + ",";
    	  }
    	  for(var x in $scope.topic){
    		  rTopics += $scope.topic[x] + ",";
    	  }
    	  for(var x in $scope.keyword){
    		  rKeywords += $scope.keyword[x] + ",";
    	  }
    	
    	  selected_data = {writer_names:wNames, emails:wEmails, keywords:rKeywords, report_topics:rTopics, institution_name:$('#instName').val(), report_title:$('#reportTitle').val(), report_abstract:$('#reportAbstract').val(), report:$('#report').val()};
    	  $.ajax({
    		  url:'saveReport',
    		  type:'POST',
    		  data:selected_data,
    		  success: function(response){
    			  if(response.redirect){
    				  alert(response.msg);
    				  window.location.href = 'home';
    			  }else{
    				  alert(response.msg);
    				  window.location.href = 'addReport';
    			  }
    		  }
    	  });
      }else{
          alert("Please make sure to fill all fields!");
      }
    });
});

window.onscroll = function() {scrollFunction()};
function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

$( document ).ready(function() { 
	$( "#myBtn1" ).click(function() {
	    window.location.href = "../Judge/home";
	 });
});

