

$(document).ready(function(){

	$('.new_comment').on('submit', function(event){
		event.preventDefault();	
		 var commentList = $('.comments'); 
		 
		 // console.log(this)

		$.post($(this).attr('action'), $(this).serialize(), function(response){
		
			// console.log(this)	
			var targetID = response.post_id;
			var postID = $('.post-parent-container[data-id=' + targetID + ']');
			var rendered = Mustache.render($('#new_comment_template').html(), response);
			
			postID.find('ul').append(rendered);
			
			});
		});
	});



