var check = 0;
var app = angular.module("myReport", []); 
app.controller("myCtrl", function($scope) {
  // get report details here 
  $scope.name = [];
  $scope.email = [];
  $scope.topic = [];
  $scope.keywords = [];
  $scope.institutionName = "";
  $scope.reportTitle = "";
  $scope.reportAbstract = "";
  $scope.report = "";
  
  	$.ajax({
		async: false,
		url: 'getReport',
		type: 'POST',
		success: function(response){
			if(response.redirect){
				data = response.data;
				$scope.name = response.data.writer_names.split(",");
				$scope.name.pop();
				
				$scope.email = response.data.emails.split(",");
				$scope.email.pop();
				
				$scope.topic = response.data.report_topics.split(",");
				$scope.topic.pop();
				
				$scope.keywords = response.data.keywords.split(",");
				$scope.keywords.pop();
				
				$scope.institutionName = response.data.institution_name;
				$scope.reportTitle = response.data.report_title;
				$scope.reportAbstract = response.data.report_abstract;
				$scope.report = response.data.report;
			}
		}
	});
  	
  	$.ajax({
  		async: false,
  		url: 'getOpinion',
  		type: 'POST',
  		success: function(response){
  			if(response.redirect){
  				$('#opi_1').val(response.data.user_opinion_1);
  				$('#opi_2').val(response.data.user_opinion_2);
  				var star = response.data.user_rate;
  				check = 1;
  				for(i=0; i<star; i++){
  					$('#star_'+(i+1)).addClass("yellowstar");
  				}
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

function changetoo() {
  if($('#showme').css('display') == 'block'){
      $('#show').attr('title', 'Select To Show');
      $('#show').children().first().text("Click To Show Report's Details");
  }else{
      $('#show').attr('title', 'Select To Hide ');
      $('#show').children().first().text("Click To Hide Report's Details");
  }
}
function changetoo1() {
  if($('#showme1').css('display') == 'block'){
      $('#show1').attr('title', 'Select To Show');
      $('#show1').children().first().text("Click To Rate This Report");
      $("#mar").css("padding-bottom","0px");
  }else{
      $('#show1').attr('title', 'Select To Hide ');
      $('#show1').children().first().text("Click To Close Rating Section");
      $("#mar").css("padding-bottom","16px");
  }
}

var ctrl = 0 ; 

if(check == 1){
	$( ".star" ).hover(
	  function() {
	    var sp = $( this).attr('id').split('_');
	    for(x=1 ; x<=sp[1]; x++){
	        $('#star_'+x).addClass("yellowstar");
	    }
	  }, function() {
	    if(ctrl!=0){
	        for(x=1 ; x<=5; x++){
	        if(x<=ctrl){
	          $('#star_'+x).addClass("yellowstar");
	        }else{
	          $('#star_'+x).removeClass("yellowstar");
	        }
	      }
	    }else{
	      $('.star').removeClass("yellowstar");
	    }
	  }
	);
}

$( ".star" ).click(function() {
  var sp = $( this).attr('id').split('_');
  ctrl=sp[1];
  for(x=1 ; x<=5; x++){
    if(x<=sp[1]){
      $('#star_'+x).addClass("yellowstar");
    }else{
      $('#star_'+x).removeClass("yellowstar");
    }
  }
});
$(".star").dblclick(function(){
  $('.star').removeClass("yellowstar");
  ctrl=0;
});

$( "#send" ).click(function() {
  var opi_1 = $('#opi_1').val();
  var opi_2 = $('#opi_2').val();
  var rate = $('.yellowstar').length ;
  if(opi_1 != "" && opi_2 != "" && rate != 0){
      $.ajax({
    	  url: 'sendRate',
    	  type: 'POST',
    	  data:{user_opinion_1:opi_1, user_opinion_2:opi_2, user_rate:rate},
    	  success: function(response){
    		  alert(response.msg);
    		  window.location.href = 'myReports';
    	  }
      });
  }else{
      alert("Please make sure to fill all the fields!");
  } 
});


