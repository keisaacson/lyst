$('.lists.show').ready(function(){
	$('.non-edit-item').dblclick(function(e){
		var me = e.target;
		var id = $(me).attr('id');
		$('span#list-icons'+ id).show();
		$(me).hide();
		$('li#edit'+ id).show();
	});
	$('.list-title').dblclick(function(){
		if($('.edit-title').length > 0) {
			$('.edit-title form').show();
			$('.list-title').hide();
	    }
	});
	$('.share-item').click(function(){
		$('.add-share').toggle();
		$('.shares-list').toggle($('.add-share').is(":visible"));
	});
	$('.shares-expand').dblclick(function(){
		$('.shares-list').toggle();
	});
	$('.share-email').dblclick(function(e){
		var me = e.target; 
		var id = $(me).attr('id');
		$('#' + id + ' .share-item').toggle();
	});
})