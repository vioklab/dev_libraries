<?php
include_once "../class/GoogleSiteMap.php";
// Create the GoogleSiteMap XML String
$map=new GoogleSiteMap();
//Add a folder to parse
$option=array(url=>"http://www.test.com/",hidden=>".htaccess,.txt,.xml",recursive=>true);
$map->Add("../sample_files",$option);
//close the XML String
$map->Close();
//Output the XML String
$map->View();
?>