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
  @manufacturers.each do |manufacturer|
    s += ' <option value='"#{manufacturer.name}"'>"#{manufacturer.name}"</option>';
    // s += ' <option value="B&C Speakers">B&C Speakers</option>';
    // s += ' <option value="Celestion">Celestion</option>';
    // s += ' <option value="Dayton Audio">Dayton Audio</option>';
    // s += ' <option value="Dynavox">Dynavox</option>';
    // s += ' <option value="Eminence Speaker">Eminence Speaker</option>';
    // s += ' <option value="ESS">ESS</option>';
    // s += ' <option value="Factory Buyouts">Factory Buyouts</option>';
    // s += ' <option value="FaitalPRO">FaitalPRO</option>';
    // s += ' <option value="Fountek">Fountek</option>';
    // s += ' <option value="Goldwood">Goldwood</option>';
    // s += ' <option value="GRS">GRS</option>';
    // s += ' <option value="HiVi">HiVi</option>';
    // s += ' <option value="HiWave">HiWave</option>';
    // s += ' <option value="JBL">JBL</option>';
    // s += ' <option value="Kenwood">Kenwood</option>';
    // s += ' <option value="Kicker">Kicker</option>';
    // s += ' <option value="Lanzar">Lanzar</option>';
    // s += ' <option value="Morel">Morel</option>';
    // s += ' <option value="PE">Parts Express</option>';
    // s += ' <option value="Peavey">Peavey</option>';
    // s += ' <option value="Peerless">Peerless</option>';
    // s += ' <option value="Pioneer Electronics">Pioneer Electronics</option>';
    // s += ' <option value="PRV Audio">PRV Audio</option>';
    // s += ' <option value="Pyle Audio">Pyle Audio</option>';
    // s += ' <option value="Pyramid">Pyramid</option>';
    // s += ' <option value="RCF USA">RCF USA</option>';
    // s += ' <option value="RE Audio">RE Audio</option>';
    // s += ' <option value="Selenium">Selenium</option>';
    // s += ' <option value="Tang Band">Tang Band</option>';
    // s += ' <option value="TC Sounds">TC Sounds</option>';
    // s += ' <option value="Usher">Usher</option>';
    // s += ' <option value="Vifa">Vifa</option>';
    // s += ' <option value="Visaton">Visaton</option>';
  end
  s += '</select>';
  return s
}