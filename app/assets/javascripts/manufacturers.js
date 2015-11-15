function drivers_table(manufacturers) {
  console.log(manufacturers)
  $('#woofers').DataTable({
    'dom' : 'l<"#manufacturers_area">frtip',
    'serverSide' : true,
    'ajax' : '/manufacturers/list.json'
  });
  $('#manufacturers_area').html( select_manufacturer_options(manufacturers) );  
}


function select_manufacturer_options(manufacturers) {
  var s = 'Manufacturer: ';
  s += '<select id="manufacturer">';
  //manufacturers.each .....
  s += ' <option value="100-200">100 to 200</option>';
  s += ' <option value="300-500">300 to 500</option>';
  s += '</select>';
  return s
}