<?php 
/* GEO CODE */
				$geocode=
file_get_contents('http://maps.googleapis.com/maps/api/geocode/json?latlng=48.283273,14.295041&sensor=false');
 $output= json_decode($geocode);
 for($j=0;$j<count($output->results[0]->address_components);$j++){ echo
'<b>'.$output->results[0]->address_components[$j]->types[0].': </b>
'.$output->results[0]->address_components[$j]->long_name.'<br/>'; } 
?>