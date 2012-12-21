var numberGame = (function () 
 var responseData // Increased variable scope for the guess
 {
	$(document).ready(function ()
	{
		$("#submit").hide();
		$("#startgame").click(function()
			{
				$.getJSON('api/v1/start',responseData ###);
				$("#startgame").hide(); //hide button HTML
				
				$("#submit").show("slow"); //submit form HTML
				//playerGuess = prompt("Enter your guess");
				//console.log(playerGuess); //testing the variable
		});
	}); 
})

	//$.getJSON('api/v1/play')
(numberGame); //end javascript