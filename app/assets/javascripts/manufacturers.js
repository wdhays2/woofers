function drivers_table(manufacturers) {
  console.log(manufacturers)
  $('#woofers').DataTable({
    'dom' : 'l<"#manufacturers_area">frtip',
    'serverSide' : true,
    'ajax' : '/manufacturers/list.json',
    'language': {
      'search': 'Search model number:'
    }
  });
  var select_field = select_manufacturer_options(manufacturers);
  $('#manufacturers_area').html(select_field);
}


function select_manufacturer_options(manufacturers) {
  var s = 'Manufacturer: ';
  s += '<select id="manufacturer">';
  s += '<option value="">All Manufacturers</option>';
  $.each(manufacturers, function( index, manufacturer ) {
    s += '<option value="' + manufacturer.name + '">' + manufacturer.name + '</option>';
  });
  s += '</select>';
  return s
}