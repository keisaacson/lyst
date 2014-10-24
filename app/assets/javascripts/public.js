$('.lists.index_public').ready(function(){
	$('.list-item').dblclick(function(e){
		var me = e.target;
		$(me).nextUntil('li').toggle();
	});
})