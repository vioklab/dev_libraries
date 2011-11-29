<?php
include_once "../class/GoogleSiteMap.php";
// Create the GoogleSiteMap XML String
$map=new GoogleSiteMap();
//Add associative array of URL with full arguments
$a=array(
	array(loc=>"http://www.test.com/index.php?cat=boutique&id=7",lastmod=>"",changefreq=>"always",priority=>"0.2"),
	//Add another url with full option
 	array(loc=>"http://www.test.com/index.php?cat=boutique&id=8",lastmod=>"2006-07-11T11:39:38+02:00",changefreq=>"never",priority=>"0.9")
);
$map->Add($a);
//close the XML String
$map->Close();
//Output the XML String
$map->View();
?>