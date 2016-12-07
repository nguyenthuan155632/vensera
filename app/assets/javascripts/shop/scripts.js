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
	            data: { id: $('.post-show-id').val(), rate: currentRating }
	        });
	    }
    });

    $('.posts-show-rating-2').starRating({
    	initialRating: $('.post-show-likes').val(),
		strokeColor: '#894A00',
		strokeWidth: 0,
		starSize: 15,
		readOnly: true
    });

    $('#send-comment').on('click', function() {
    	var name = $('#post_comment_name').val();
    	var email = $('#post_comment_email').val();
    	var phone = $('#post_comment_phone').val();
    	var comment = $('#post_comment').val();
    	if(comment == "" || comment == undefined) {
    		$('#post_comment').addClass('border-alert');
    		return false;
    	} else {
    		$('#post_comment').removeClass('border-alert');
    	}
    	$.ajax({
            url: "/shop/posts/comments",
            type: "post",
            data: { 
            	id: $('.post-show-id').val(),
            	name: name,
            	email: email,
            	phone: phone,
            	comment: comment
            },
            success:function(data) {
            	var new_comment = '<li class="media"><div class="media-body"><ul class="sinlge-post-meta"><li><i class="fa fa-user"></i>'+ name +'</li><li><i class="fa fa-envelope"></i>'+ email +'</li><li><i class="fa fa-phone"></i>'+ phone +'</li><li><i class="fa fa-clock-o"></i>05:56PM</li><li><i class="fa fa-calendar"></i>Dec 07, 2016</li></ul><p class="m-b-0 p-l-5 p-r-5 t-justify">'+ comment +'</p></div></li>';
            	$('ul.media-list').append(new_comment);
		    }
        });



    });

});