$(document).ready(function() {
	$('.datepicker').datepicker({
      format: 'mm-dd-yyyy'
    });

    $('.posts-index-rating').each(function() {
    	var votes = $('.post-index-rating-hide', this).val();
    	$(this).starRating({
	        initialRating: votes,
			strokeColor: '#894A00',
			strokeWidth: 0,
			starSize: 20,
			readOnly: true
	    });
    });

    $('.posts-show-rating').starRating({
    	initialRating: $('.post-show-likes').val(),
		strokeColor: '#894A00',
		strokeWidth: 0,
		starSize: 20,
		callback: function(currentRating, $el){
	        $.ajax({
	            url: "/shop/posts/likes",
	            type: "post",
	            data: { id: $('.post-show-id').val(), rate: currentRating}
	        });
	    }
    });

});