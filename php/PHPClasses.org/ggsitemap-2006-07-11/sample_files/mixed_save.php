<?php
include_once "class/GoogleSiteMap.php";
// Create the GoogleSiteMap XML String
$map=new GoogleSiteMap();
//now we add mixed data !
//Add  simple URL
$map->Add("http://www.test.com/index.php?cat=boutique&id=5");
$map->Add("http://www.test.com/index.php?cat=boutique&id=6");
//Add array of URL
$a=array("http://www.test.com/index.php?cat=boutique&id=6","http://www.test.com/index.php?cat=boutique&id=7");
$map->Add($a);
//Add associative array of URL
$a=array(
		array(loc=>"http://www.test.com/index.php?cat=boutique&id=6"),
		array(loc=>"http://www.test.com/index.php?cat=boutique&id=60")
	);
$map->Add($a);
//Add associative array of URL with full arguments
$a=array(
	array(loc=>"http://www.test.com/index.php?cat=boutique&id=7",lastmod=>"",changefreq=>"always",priority=>"0.2"),
	//Add another url with full option
 	array(loc=>"http://www.test.com/index.php?cat=boutique&id=8",lastmod=>"2006-07-11T11:39:38+02:00",changefreq=>"never",priority=>"0.9")
);
$map->Add($a);
//Add a folder to parse
$option=array(url=>"http://www.test.com/",hidden=>".htaccess,.txt,.xml",recursive=>true);
$map->Add("../sample_files",$option);
DBConnect();
$req="SELECT path as loc ,  freq as changefreg ,priority as priority FROM map";
$res=mysql_query($req);
$map->Add($res);
DBClose();

//close the XML String
$map->Close();
//write the XML file to a specified file
$map->Write("sitemap.xml");
?>

<?php
//connect to mysql database
function DBConnect(){
	mysql_connect('localhost','root','');
	mysql_select_db("test_ggmap");
}
function DBClose(){
	@mysql_close();
}
?>