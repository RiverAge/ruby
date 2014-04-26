# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#jQuery ->
 # $('#idofTable_length label select').addClass('form-control')
#  $('#idoTable_filter lable input').addClass('form-control')


jQuery ->
  $('#userlists').dataTable(

    "sPaginationType": "bootstrap"
    "oLanguage" :{
      "sLengthMenu": " 每页显示 _MENU_ 条记录"
      "sInfo": "_START_~_END_/_TOTAL_"
    }


  )

