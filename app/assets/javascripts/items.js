$('.lists.show').ready(function(){
	$('.edit-title').hide();
	$('.non-edit-item').dblclick(function(e){
		var me = e.target;
		var id = $(me).attr('id');
		$('span#list-icons'+ id).show();
		$(me).hide();
		$('li#edit'+ id).show();
	});
	$('.list-title').dblclick(function(){
		$('.edit-title').show();
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