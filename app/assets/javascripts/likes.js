

$(document).ready(function(){

		$('.like').on('click', function(event){
			// console.log(this);
			event.preventDefault();
			$.post(this.href);

		// $.post($(this).attr('href'),$(this).serialize(),function(response){	
			// console.log(response);
			// var targetID = response.post_id
			// var postID = $('.post-parent-container[data-id=' + targetID + ']');
			
			var rendered = Mustache.render($('#new_like').html(),response);
			// // console.log(postID)
			// postID.find('ul[class="like-list"]').prepend(rendered);

		});

		var connection = new WebSocketRails(window.location.host + '/websocket');
		channel = connection.subscribe('likes');
		channel.bind('new',function(like){
			console.log(like)

			// $('.like_list').append('<li> resp.new_like_count </li>');		
			var postID = $('.post-parent-container[data-id=' + like.id + ']');
			var rendered = Mustache.render($('#new_like').html(),like);
			postID.find('ul[class="like-list"]').prepend(rendered);
			// postID.find('ul[class="like-list"]').append('<li>' + like.new_like_user + ' likes' + ' </li>' );
			// append('<li>'+ like.user +'</li>');
			// console.log('a new like registered');
		});
		
		// return false;

	// });

});