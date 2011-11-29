<?php
include_once "../class/GoogleSiteMap.php";
// Create the GoogleSiteMap XML String
$map=new GoogleSiteMap();
//Add a mysql_recordset
DBConnect();
$req="SELECT path as loc ,  freq as changefreg ,priority as priority FROM map";
$res=mysql_query($req);
$map->Add($res);
DBClose();
//close the XML String
$map->Close();
//Output the XML String
$map->View();
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