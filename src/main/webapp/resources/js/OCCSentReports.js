
var r_ids = [];
var app = angular.module("myReportList", []); 
app.controller("myCtrl", function($scope) {
	$scope.Reports =[];
	$.ajax({
		async: false,
		url:'judgeReports',
		type:'POST',
		success: function(response){
			data = response.data;
			for(i=0; i<response.data.length; i++){
				var name = response.data[i].user_name + " " + response.data[i].user_surname;
				r_ids.push(response.data[i].report_id);
				$scope.Reports.push({id:response.data[i].report_id, title:response.data[i].report_title, userName:name, resultDate:response.data[i].result_date});
			}
		}
	});
	
	
	
});


$( document ).ready(function() {
	for(i=0; i<r_ids.length; i++){
		$.ajax({
			async: false,
			url: 'getJudgesRate',
			type: 'POST',
			data: {report_id:r_ids[i]},
			success: function(response){
				data = response.data;
				var average = 0;
				for(j=0; j<response.data.length; j++){
					average += response.data[j].user_rate;
				}
				average/=response.data.length;
				
				$('#rateR_'+r_ids[i]).children().eq(4).attr('id', 'set_'+average);
			}
		});
	}
	
	
    $(".setstar").each(function() {
        var sp = $( this).attr('id').split('_');
        var i2 = sp[1];
        i  = Math.ceil( i2 );
        var num = Number(i2)
        $(this).append("<strong style='font-size:17px;color:red;margin-left:10px'>"+num.toFixed(1)+"</strong>" );
        for(x=0 ; x<5; x++){
          if(x>=i){
            $( this ).append( "<i class='fa fa-star' style='font-size:17px;color:white;margin-left:5px'></i>" );
          }else{
            $( this ).append( "<i class='fa fa-star' style='font-size:17px;color:#efde10;margin-left:5px'></i>" );
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

