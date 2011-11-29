<?php
include_once "../class/GoogleSiteMap.php";
// Create the GoogleSiteMap XML String
$map=new GoogleSiteMap();
//Add  simple URL
$map->Add("http://www.test.com/index.php?cat=boutique&id=5");
$map->Add("http://www.test.com/index.php?cat=boutique&id=6");
//close the XML String
$map->Close();
//Output the XML String
$map->View();
?>