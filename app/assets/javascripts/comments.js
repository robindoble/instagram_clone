$(document).ready(function(){

	$('.new_comment').on('submit', function(event){
		event.preventDefault();
		console.log($(this).serialize());

		$.post($(this).attr('action'), $(this).serialize(), function(response){
			console.log(response);

			});
		});
	});