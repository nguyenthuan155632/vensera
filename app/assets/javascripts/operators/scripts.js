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
});