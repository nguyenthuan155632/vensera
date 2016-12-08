$(document).ready(function() {

	function update_radio_button(element) {
		if($(element).is(':checked')) {
			$(element).parents('label').addClass('active focus');
		} else {
			$(element).parents('label').removeClass('active focus');
		}
	}

	update_radio_button('#shop_category_category_type_product');
	update_radio_button('#shop_category_category_type_post');
	update_radio_button('#shop_post_active_publish');
	update_radio_button('#shop_post_active_pending');
	update_radio_button('#shop_product_active_publish');
	update_radio_button('#shop_product_active_pending');

	function delete_selected(ids, url) {
    	var defer = $.Deferred(); 
		var data = {
			ids: ids
		};

		$.ajax({
			type:"post",
			url: url,
			contentType: 'application/x-www-form-urlencoded;json',
			dataType: "json",
			data:$.param(data),
			success: function(data) {
				defer.resolve(data);
			},
			error: function(xhr, textStatus, errorThrown) {
				defer.reject();
			}
		});
		return defer.promise();
    }

    $('.delete_selected').on('click', function() {
    	var ids = [];
    	$('input[name="table_records"]:checked').each(function(i){
    		ids.push($(this).val());
        });

    	delete_selected(ids, $(this).attr('href')).done(function() {});
    });

    $(function() {
	  	$('.froalaEditor').froalaEditor({
	  		height: 400
	  	});
	});

	$('.tagcloud').tagcloud();

	$('#compose, .compose-close').on('click', function() {
		var id = $('#id_hidden_selected').val();
		if(id != "0") {
			$('.compose').slideToggle();
		}
	});

	function request_comment(id, url) {
    	var defer = $.Deferred(); 
		var data = {
			id: id
		};

		$.ajax({
			type:"post",
			url: url,
			contentType: 'application/x-www-form-urlencoded;json',
			dataType: "json",
			data:$.param(data),
			success: function(data) {
				defer.resolve(data);
			},
			error: function(xhr, textStatus, errorThrown) {
				defer.reject();
			}
		});
		return defer.promise();
    }

    function reply_comment(id_cm, id_type, comment, type, url) {
    	var defer = $.Deferred(); 
		var data = {
			id_cm: id_cm, 
			id_type: id_type,
			comment: comment, 
			type: type
		};

		$.ajax({
			type:"post",
			url: url,
			contentType: 'application/x-www-form-urlencoded;json',
			dataType: "json",
			data:$.param(data),
			success: function(data) {
				defer.resolve(data);
			},
			error: function(xhr, textStatus, errorThrown) {
				defer.reject();
			}
		});
		return defer.promise();
    }

	$('.mail_list').on('click', function() {
		$('.mail_list').each(function() {
			$(this).removeClass('mail-selected');
		});
		$(this).addClass('mail-selected');
		$('.mail_list .left i').each(function() {
			$(this).hide();
		});
		$('.left i', this).show();
		$('.right h3', this).addClass('font-normal');

		var id = $('.comment-id', this).val();
		request_comment(id, '/operators/comments/get').done(function(data) {
			name = (data.name != "") ? data.name : "Anonymous";
			email = (data.email != "") ? data.email : "No Email";
			phone = (data.phone != "") ? data.phone : "No Phone";
			$('#post-comment-title').text(data.title);
			$('#post-comment-name strong').text(name + " - " + email + " - " + phone);
			$('#post-comment-content').text(data.content);
			$('#post-comment-time').text(data.time_created);
			$('#post-comment-date').text(" " + data.date_created);
			$('#id_hidden_selected').val(data.id);
			$('#id_hidden_selected_type').val(data.commentable_id);
			$('#id_hidden_selected_type_2').val(data.commentable_type);
		});
	});

	$('#delete_comment').on('click', function() {
		var id = $('#id_hidden_selected').val();
		if(id != "0") {
			var r = confirm("Are you sure!");
			if (r) {
			    request_comment(id, '/operators/comments/delete').done(function(data) { 
			    	$('.mail-selected').remove();
			    });
			}
		}
	});

	$('.reply_comment').on('click', function() { 
		var comment = $('.editor-wrapper').text();
		var id_cm = $('#id_hidden_selected').val();
		var id_type = $('#id_hidden_selected_type').val();
		var type = $('#id_hidden_selected_type_2').val();
		if (comment) {
			reply_comment(id_cm, id_type, comment, type, '/operators/comments/reply').done(function(data) { 
		    	$('.compose').slideToggle();
		    	$('.editor-wrapper').text();
		    });
		}
	});
});