
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

var app = angular.module("myReports", []); 
app.controller("myCtrl", function($scope) {
    $scope.Reports = [];
    
    $.ajax({
    	async: false,
    	url: 'listReports',
    	type: 'POST',
    	success: function(response){
    		data = response.data;
    		for(i=0; i<response.data.length; i++){
    			var name = response.data[i].user_name + " " + response.data[i].user_surname;
    			$scope.Reports.push({id:response.data[i].report_id, title:response.data[i].report_title, userName:name, resultDate:response.data[i].result_date});
    		}
    	}
    });
});

function send(element){
	var info = $(element).children().first().attr('id').split('_');
	var id = info[1];
	window.location.href = "setOpinion?id="+id;
}

