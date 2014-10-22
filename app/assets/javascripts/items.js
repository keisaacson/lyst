$('.lists.show').ready(function(){
	$('.non-edit-item').dblclick(function(e){
		var me = e.target;
		var id = $(me).attr('id');
		$('span#list-icons'+ id).show();
		$(me).hide();
		$('li#edit'+ id).show();
	})
})