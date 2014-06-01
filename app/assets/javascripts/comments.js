

$(document).ready(function(){

	$('.new_comment').on('submit', function(event){
		event.preventDefault();
		// console.log($(this).serialize());

		 // var commentList = $(this).siblings('ul');
		 var commentList = $('.comments'); 
		 // commentList.css ('background','yellow')
		 // var template = $(this).siblings('#new_comment_template').html();


		$.post($(this).attr('action'), $(this).serialize(), function(response){
			
			var rendered = Mustache.render($('#new_comment_template').html(), response);
			commentList.append(rendered);
			
			});
		});
	});