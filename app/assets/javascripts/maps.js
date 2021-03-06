$(document).ready(function(){

		var postId = $('#map').data('post-id');
		// console.log(postId)

		if(postId) {
			$.get('/posts/'+ postId +'.json', function(post){

				// console.log(post.address);
				console.log(post);

				map = new GMaps({
				  div: '#map',
				  lat: -12.043333,
				  lng: -77.028333
				});

				GMaps.geocode({
				  address: post.address,
				  callback: function(results, status) {
				  	console.log(results);
				  	// console.log(results.count);
				    if (status == 'OK') {
				      var latlng = results[0].geometry.location;
				      map.setCenter(latlng.lat(), latlng.lng());
					      map.addMarker({
					        lat: latlng.lat(),
					        lng: latlng.lng()
				      });
				    }
				  }
				});

			});

		};
});