$('.lists.show').ready(function(){
	$('.list-item').on('click', function(e){
		var me = e.target;
		var id = $(me).attr('id');
		$('span#list-icons'+ id).toggle();
	})
	$('.list-item').dblclick(function(e){
		var me = e.target;
		var id = $(me).attr('id');
		$(me).hide();
		$('li#edit'+ id).show();
	})
})