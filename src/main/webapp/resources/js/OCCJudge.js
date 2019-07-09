
var author_id;
var ctrl = 0;
  var app = angular.module("myReport", []); 
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
				author_id = response.data.user_id;
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
    $("#warning").hide();
    $("#warning1").hide();
    var rTopics = "";
    for(var x in $scope.topic){
    	rTopics += $scope.topic[x] + ","; 
    }
    $.ajax({
    	async: false,
    	url: 'getJudge',
    	type: 'POST',
    	data: {report_topics:rTopics, user_id:author_id},
    	success: function(response){
    		//Todo terminate the report
    		if(response.redirect)
    		{
	    		data = response.data;
	    		for(i=0; i<response.data.length;i++){
	    			var fullName = response.data[i].user_name + " " + response.data[i].user_surname; 
	    			if(author_id != response.data[i].user_id){
	    				$("#referre").append("<a id='ref_"+response.data[i].user_id+"' onclick='changeselect(this)' class='w3-btn w3-padding w3-grey judge' style='margin:3px;float:left !important;'>"+fullName+"</a>");
	    			} // If the one who sent the report is also a judge.
	    		}
    		}else{
    			$("#warning").show();
    			$("#warning1").show();
    			ctrl = 1;
    		}
    	}
    });

    $( "#send" ).click(function() {
    	if(ctrl == 0){
    		var selected_date = $("#date").val();
        	var today = new Date();
        	var dd = today.getDate();
        	var mm = today.getMonth()+1;
        	var yyyy = today.getFullYear();
        	if(dd < 10){
        		dd='0'+dd;
        	}
        	if(mm < 10){
        		mm='0'+mm;
        	}
        	today = yyyy + '-' + mm + '-' + dd;
        	
        	var judges_id = [];
        	$('.judge').each(function() {
        		if($(this).attr('title') == 'Selected'){
    				var judge = $(this).attr('id').split('_');
    	    		judges_id.push(judge[1]);
        		}
        	});
        	if(selected_date != "" && selected_date > today){
        		$.ajax({
        			url: 'sendToJudge',
        			type: 'POST',
        			data: {judges:judges_id, result_date:selected_date},
        			success: function(response){
        				alert(response.msg);
        				window.location.href = 'incomingReports';
        			}
        		});
        	}else{
        		alert("Please make sure to select a valid date!");
        	}
    	}else{
    		$.ajax({
    			url: 'terminateReport',
    			type: 'POST',
    			success: function(response){
    				alert("The report has been disapproved!");
    				window.location.href = 'incomingReports';
    			}
    		});
    	}
    });

  });
  
  
  function changeselect(x) {
    if($(x).hasClass("selected")){
      $(x).removeClass("selected");
      $(x).attr('title', 'Not Selected');
    }else{
    	$(x).attr('title', 'Selected');
    	$(x).addClass("selected")
    }
  }
 
  $(document).ready(function() {
    var elmnt= $("#referre").children(); 
    // random secmek
    $("#referre>a").removeClass("selected");
    var count = elmnt.length;
    var random1 = 0;
    if(count<=2){
      $("#referre>a").addClass("selected");
      $("#referre>a").attr('title', 'Selected');
    }else{
      random1= Math.floor(Math.random() * (count-2)) + 3;
      var arr = [];
      var i = 1 ;
      $("#referre>a").attr('title', 'Not Selected');
      for (i; i<=random1; i++) {
        var a =Math.floor( Math.random() * count) + 1; 
        if(arr.includes(a)){
          i--;
        }else{
          arr.push(a);
          $("#referre").children().eq(a-1).addClass("selected");
          $("#referre").children().eq(a-1).attr('title', 'Selected');
        }
      }
    }
    var reffnum =0 ; 
    var starnum =0 ; 
    
    $( ".setstar" ).each(function() {
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




