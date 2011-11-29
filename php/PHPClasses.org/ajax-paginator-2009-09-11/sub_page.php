<?php
error_reporting(E_ALL^E_NOTICE);

include('paginator.class.php');

// instantiate mysqli connection
$conn = new mysqli('host', 'databaseUser', 'databasePassword','databaseName') ;

//$query = "SELECT * FROM customers WHERE id > 1";
$query = "SELECT * FROM customers";

// set the searching query
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

//number of records per page
$recPerPage = 5;
$paginator = new Paginator($pageId,$recPerPage,$query,$conn);

// fields to search in
// string or array of fields
$paginator->fields = 'name';
$paginator->searchQuery = $searchQuery;



$rows = $paginator->paginate();
?>
    <table border="0" cellpadding="2" cellspacing="0" class="listing">
	<tr>
		<th nowrap="nowrap" width="40" align='left'> ID</th>
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
echo "</div>";
