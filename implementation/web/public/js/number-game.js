var numberGame = (function() {
	$(document).ready(function() {
		$("#startbutton").click(function(){
		$.getJSON('api/v1/start'); // this will initialize the game
	});
});
})
(numberGame); //end javascript