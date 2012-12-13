var numberGame = (function () 
 {
	$(document).ready(function() 
		{
			$("#startgame").click(function()
				{
				$.getJSON('api/v1/start',function(returnMessage)
				{
					$<document.write(returnMessage.message)
				});
				
			
				
				}); 
			
				
		});
 })
(numberGame); //end javascript