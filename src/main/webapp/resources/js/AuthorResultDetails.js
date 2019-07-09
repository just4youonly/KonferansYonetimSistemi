
var names = "";
var intResult = 0;
var rStatus = "";
var app = angular.module("myResult", []);
app.controller("myCtrl", function($scope) {
    $scope.userOpinion = [];
    
    $.ajax({
    	async: false,
    	url: 'getOpinion',
    	type: 'POST',
    	success: function(response){
    		data = response.data;
    		if(data[0] != undefined){
        		for(i=0; i<response.data.length; i++){
        			var rName = "Judge " + (i + 1);
        			$scope.userOpinion.push({name:rName,opinion1:response.data[i].user_opinion_1, opinion2:response.data[i].user_opinion_2});
        		}
        		intResult = response.data[0].occ_rate;
        		rStatus = response.data[0].status;
    		}
    	}
    });
    
    $scope.Result = function() {
    	if(intResult == 1 && rStatus == "Author"){
    		return "Your Report Has Been Approved";
    	}else if (intResult == 0 && rStatus == "Author"){
    		return "Your Report Has Been Disapproved";
    	}else{
    		return "The Final Result Has Not Been Announced Yet";
    	}
    };
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
