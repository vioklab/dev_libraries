<?php
include_once "../class/GoogleSiteMap.php";
// Create the GoogleSiteMap XML String
$map=new GoogleSiteMap();
//Add array of URL
$a=array("http://www.test.com/index.php?cat=boutique&id=6","http://www.test.com/index.php?cat=boutique&id=7");
$map->Add($a);
//close the XML String
$map->Close();
//Output the XML String
$map->View();
?>