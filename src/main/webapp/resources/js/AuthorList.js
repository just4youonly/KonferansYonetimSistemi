
var app = angular.module("myReportList", []); 
app.controller("myCtrl", function($scope) {
	$scope.Reports =[];
	$.ajax({
		async: false,
		url:'listReports',
		type:'POST',
		success: function(response){
			data = response.data;
			for(i=0; i<response.data.length; i++){
				$scope.Reports.push({id:response.data[i].report_id, title:response.data[i].report_title, sendDate:response.data[i].send_date, resultDate:response.data[i].result_date});
			}
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