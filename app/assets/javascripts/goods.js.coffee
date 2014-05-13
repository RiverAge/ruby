# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	oTable = $('.dataTable').dataTable
		"oLanguage": 
			"sSearch":"检索:",
			"sLengthMenu":"每页显示 _MENU_ 条记录",
			"sZeroRecords":"空",
			"sInfoEmpty":"无记录",
			"sInfoFiltered":"(从 _MAX_ 条记录检索)",
			"sInfo": "_START_ 到 _END_ 条（共 _TOTAL_ 条）",
			"oPaginate": 
		     	"sFirst":"<<",
		     	"sLast":">>",
		     	"sNext":"",
		     	"sPrevious":""
	 
	$('.dataTables_filter label input').unbind();
	$('.dataTables_filter label input').bind 'keyup', (e) =>
		oTable.fnFilter(this.value)	if (e.keyCode == 13) 
  
	$('.dataTables_length label select').addClass('form-control')
	$('.dataTables_filter label input').addClass('form-control') 
