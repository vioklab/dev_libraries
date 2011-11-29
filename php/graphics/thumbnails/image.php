<?php 
if(isset($_FILES["fichero"]))
{
	$fotografia = $_FILES["fichero"]["tmp_name"];
	copy($fotografia,$_FILES["fichero"]["name"]);
	$foto_copia = $_FILES["fichero"]["name"]."&modo=miniatura";
	$original = $_FILES["fichero"]["name"]."&modo=original";
	$url = "IMG_thumbnail.class.php?fotografia=$foto_copia";
	$href = "IMG_thumbnail.class.php?fotografia=$original";
	echo "<html><head><title>lalalala</title></head><body>";
	echo "<a href=\"$href\"><img src=\"$url\"></a>";
	echo "</body></html>";
}
?>