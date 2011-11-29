<?php
// this is only used in debugging,
// use error_reporting(0) in production environment
error_reporting(E_ALL || E_STRICT);

include('paginator.class.php');
// instantiate mysqli connection
$conn = new mysqli('host', 'databaseUser', 'databasePassword','databaseName') ;

$query = "SELECT * FROM customers";
//$query = "SELECT * FROM customers WHERE id > 1";

// Number of records per page
$recordsPerPage = 5;
if(!empty($_GET['search'])){
	$searchQuery = $_GET['search'];
}

$pageId= intval($_GET['page']);
if (empty($pageId)) {
	$pageId = 1;
}else{
	$pageId = intval($pageId); 
}
// if you are testing it locally uncomment the following line
// to see how it is going to look like
//sleep(2);

$paginator = new Paginator($pageId,$recordsPerPage,$query,$conn);

$paginator->debug = FALSE;

// field(s) to search in
// string or array of fields
$paginator->fields = 'name';
//$paginator->fields = array('name','id');

$paginator->searchQuery = $searchQuery;

// call the core function that paginates
$rows = $paginator->paginate();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/ajaxUpdater.js"></script> 
<script type="text/javascript" src="js/paginate.js"></script>
</head>

<body>
<div id="wrapper">
<div id='search-box' class="search-box">
<form action="<?=$_SERVER['PHP_SELF']?>" onsubmit='paginate();return false;'>
<?php 
parse_str($_SERVER['QUERY_STRING'],$getArray);

foreach($getArray as $key=>$value){

	echo "<input type='hidden' name='{$key}' id='{$key}' value='{$value}' />";
}
?>

<input id="search" type="text" class="search" />
<input type="submit" value="search" class="button" />
</form>
</div>

<div id="listing_container">
    <table border="0" cellpadding="2" cellspacing="0" class="listing">
	<tr>
		<th nowrap="nowrap" width="40"  align='left'> ID</th>
		<th nowrap="nowrap" width="450" align='left'>Name</th>
	</tr>
<?php

foreach($rows as $row){
	echo "<tr>";
	echo "<td nowrap='nowrap' align='center'>{$row['id']}</td>";
	echo "<td nowrap='nowrap' align='left'>{$row['name']}</td>";
	echo "</tr>";
}

echo "</table><br />";
$links = $paginator->getLinks ();
echo "<div class='paginator'> " . $links ;

echo "<p>Page " . $paginator->pageId . " of " . $paginator->totalPages . "</p>";

?>
		</div><!--end of paginator-->
	</div><!--end of listing_container-->
</div><!--end of wrapper-->
</body>
</html>