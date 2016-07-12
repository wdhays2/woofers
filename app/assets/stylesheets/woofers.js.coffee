jQuery ->
  $('#manufacturers').dataTable
    sPaginationType: "full_numbers"
    bJqueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#manufacturers').data('source')