/**
 * Created by river on 14-5-13.
 */

var ready;
ready = function () {

    var oTable = $('.dataTable').dataTable({
        "bPaginate": true,
        "bLengthChange": true,
        "bFilter": true,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": true,
        "oLanguage": {
            "sSearch": "检索:",
            "sLengthMenu": "每页显示 _MENU_ 条记录",
            "sZeroRecords": "空",
            "sInfoEmpty": "无记录",
            "sInfoFiltered": "(从 _MAX_ 条记录检索)",
            "sInfo": "_START_ 到 _END_ 条（共 _TOTAL_ 条）",
            "oPaginate": {
                "sFirst": "<<",
                "sLast": ">>",
                "sNext": "",
                "sPrevious": ""
            }

        }
    });

    $('.dataTables_length label select').addClass('form-control');
    $('.dataTables_filter label input').addClass('form-control');
    /* $('.dataTables_filter label input').unbind();
     $('.dataTables_filter label input').bind('keyup', function(e) {
     if (e.keyCode == 13) {
     oTable.fnFilter(this.value);
     }
     }); */
};
$(document).ready(ready);
$(document).on('page:load', ready);