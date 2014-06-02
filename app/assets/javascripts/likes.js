

$(document).ready(function(){

	$('.like').on('click', function(event){
		
		$.post($(this).attr('href'),$(this).serialize(),function(response){
			
			// console.log(response);
			var targetID = response.post_id
			var postID = $('.post-parent-container[data-id=' + targetID + ']');
			
			var rendered = Mustache.render($('#new_like').html(),response);
			// console.log(postID)
			postID.find('ul[class="like-list"]').prepend(rendered);

		});

		return false;
	});

});