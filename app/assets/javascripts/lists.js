$('.lists.index').ready(function(){
	$('.list-item').on('click', function(e){
		var me = e.target;
		var id = $(me).attr('id');
		$(me).nextUntil('li').toggle();
		$('span#list-icons'+ id).toggle();
	})
})