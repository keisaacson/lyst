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
	});
})