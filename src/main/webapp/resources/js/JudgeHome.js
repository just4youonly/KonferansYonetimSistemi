

var app = angular.module("myFieldList", []); 
app.controller("myCtrl", function($scope) {
    $scope.Allfields = [];
    $scope.fieldsid =[];
    $scope.fieldsname =[];
    
    $.ajax({
    	async: false,
    	url: 'getAllFields',
    	type: 'POST',
    	success: function(response){
    		data = response.data;
    		for(i=0; i<response.data.length; i++){
    			$scope.Allfields.push({id:response.data[i].field_id, name:response.data[i].field_name});
    		}
    	}
    });
    
    $scope.addfields = function () {
        $scope.errortext2 = "";
        if (!$scope.addkeyword) {return;}
        var info = $scope.addkeyword.split('_');
        
        if ($scope.fieldsid.indexOf(info[0]) == -1) {
            $scope.fieldsid.push( info[0]);
            $scope.fieldsname.push( info[1]);
            $.ajax({
            	async: false,
            	url: 'addField',
            	type: 'POST',
            	data:{field_id:info[0]},
            	success: function(response){
            		alert(response.msg);
            	}
            });
        } else {
            $scope.errortext2 = "The Field is already in your list!";
        }
    }
    
    $scope.removeItem2 = function (x) {
        $scope.errortext2 = "";    
        var id = $scope.fieldsid.splice(x, 1).toString();
        $scope.fieldsname.splice(x, 1);
        $.ajax({
        	async: false,
        	url: 'deleteField',
        	type: 'POST',
        	data:{field_id:id},
        	success: function(response){
        		alert(response.msg);
        	}
        });
    }

    $( "#send" ).click(function() {
        if( $scope.fieldsid.length ){
            $( '#myModal' ).css('display','none');
        }else{
            alert("you left free field");
        }
    });
});

$( "#mode" ).click(function() {
	if($("#mode").is(':checked')){
	     
   	 $.ajax({
        	async: false,
        	url: 'addRole',
        	type: 'POST',
        	success: function(response){
        		alert("Activated successfully");
        		location.reload(true);
        	}
        });
   }else{
       $.ajax({
       	async: false,
       	url: 'deleteRole',
       	type: 'POST',
       	success: function(response){
       		alert("Deactivated successfully");
       		location.reload(true);
       	}
       });
   }
});

