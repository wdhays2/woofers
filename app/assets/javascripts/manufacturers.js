function drivers_table(manufacturers) {
  console.log(manufacturers)
  $('#woofers').DataTable({
    'dom' : 'l<"#manufacturers_area">frtip',
    'serverSide' : true,
    'language': {
      'search': 'Search model number:'
    },
    'ajax': {
      'url': '/manufacturers/list.json',
      'data': function ( d ) {
        d.manufacturer_id = $('#manufacturer_id').val();
      }
    },
    'preDrawCallback': function( settings ) {
      if( $('#manufacturer_id').length == 0 ) {
        var select_field = select_manufacturer_options(manufacturers);
        $('#manufacturers_area').html(select_field);
      }
    }
  });

}

function woofers_table_reload() {
  var table = $('#woofers').DataTable();
  table.draw();
}

function select_manufacturer_options(manufacturers) {
  var s = 'Manufacturer: ';
  s += '<select id="manufacturer_id" onchange="woofers_table_reload()">';
  s += '<option value="">All Manufacturers</option>';
  $.each(manufacturers, function( index, manufacturer ) {
    s += '<option value="' + manufacturer.id + '">' + manufacturer.name + '</option>';
  });
  s += '</select>';
  return s
}