
  var app = angular.module("myReportList", []); 
  app.controller("myCtrl", function($scope) {
      
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
		url:'getReport',
		type:'POST',
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
    
    $scope.userOpinion = [];
    $.ajax({
    	async: false,
    	url: 'getOpinion',
    	type: 'POST',
    	success: function(response){
    		data = response.data;
    		for(i=0; i<response.data.length; i++){
    			var fullName = response.data[i].user_name + " " + response.data[i].user_surname;
    			$scope.userOpinion.push({name:fullName, opinion1:response.data[i].user_opinion_1, opinion2:response.data[i].user_opinion_2, result:response.data[i].user_rate});
    		}
    	}
    });

    $( "#send" ).click(function() {
    	var occ_result = 0;
    	if($('#yes').hasClass('ok')==true){
    		occ_result = 1;
    	}
    	$.ajax({
    		url: 'doRate',
    		type: 'POST',
    		data:{occ_rate:occ_result},
    		success: function(response){
    			alert(response.msg);
    			window.location.href = "sentReports";
    		}
    	});
         
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
        $('#show1').children().first().text("Click To Show Result");
        $("#mar").css("padding-bottom","0px");
    }else{
        $('#show1').attr('title', 'Select To Hide ');
        $('#show1').children().first().text("Click To Hide Result");
        $("#mar").css("padding-bottom","16px");
    }
  }

  
  $( document ).ready(function() {
    var reffnum =0 ; 
    var starnum =0 ; 
    
    $( ".setstar" ).each(function(  ) {
        var sp = $( this).attr('id').split('_');
        var i = sp[1];
        reffnum +=1;
        for(x=0 ; x<5; x++){
          
          if(x>=i){
            $( this ).append( "<i class='fa fa-star' style='font-size:19px;color:white;margin-left:10px'></i>" );
          }else{
            starnum +=1;
            $( this ).append( "<i class='fa fa-star' style='font-size:19px;color:#efde10;margin-left:10px'></i>" );
          }
           
        }
    });
    $( ".seetstar" ).each(function(  ) {
        var sp = $( this).attr('id').split('_');
        var i = sp[1];
        for(x=0 ; x<5 ; x++){
          if(x>=i){
            $( this ).append( "<i class='fa fa-star' style='font-size:19px;color:white;margin-left:10px'></i>" );
          }else{
            $( this ).append( "<i class='fa fa-star' style='font-size:19px;color:#efde10;margin-left:10px'></i>" );
          }
        }
    });
    
    var sum = starnum/reffnum;
    $("#rate").append("<strong style='font-size:19px;color:red;margin-left:10px'>"+sum.toFixed(1)+"</strong>" );
    for(x=0 ; x< Math.ceil(sum); x++){
        $("#rate").append( "<i class='fa fa-star' style='font-size:19px;color:#efde10;margin-left:10px'></i>" );
    }
      
      
  
  });

$("#yes" ).click(function(  ) {
    $("#yes" ).addClass("ok");
    $("#yes" ).removeClass("notok");
    $("#no" ).removeClass("ok");
    $("#no" ).addClass("notok");
});
$("#no" ).click(function(  ) {
    $("#yes" ).addClass("notok");
    $("#yes" ).removeClass("ok");
    $("#no" ).removeClass("notok");
    $("#no" ).addClass("ok");
});