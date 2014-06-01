

$(document).ready(function(){

	$('.like').on('click', function(event){
		
		// console.log(event)

		$.post($(this).attr('href'),$(this).serialize(),function(response){
			console.log(response);


		});

		return false;
	});

});