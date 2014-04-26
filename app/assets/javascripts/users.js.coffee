# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#userlists').dataTable(
    "oLanguage" :{
      "sLengthMenu": " 每页显示 _MENU_ 条记录"
      "sInfo": "_START_~_END_/_TOTAL_"
    }
  )

