var numberGame = (function () 
 {
	$(document).ready(function (){
		$("#game").hide();
		$("#startgame").click(function(){
				$.getJSON('api/v1/start', function(start_response){
						$('#messages').html(start_response);
						$("#startgame").hide(); //hide button HTML
						$("#game").show("slow"); //submit form HTML
				});
				
				$("#guess_submission").click(function(){
					$.getJSON('api/v1/play', function(guess_response){
						$('#messages').html(guess_response.message);
					})
				})
				
		});
	}); 
 })

	
(numberGame); //end javascript