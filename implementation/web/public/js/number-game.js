
var numberGame = (function () 
 {
	$(document).ready(function ()
	{
		$("#submit").hide();
		$("#startgame").click(function()
			{
				$.getJSON('api/v1/start');
				$("#startgame").hide();
				
				$("#submit").show("slow");
				
	    	});
	}); 
})
(numberGame); //end javascript