<?php
/***
File name : showresult.php -- an example file
Description : Shows the result in page wise
Author : Shijith. M
Date : 6th August 2008
***/
include_once("pagination.class.php");  // include main class filw which creates pages
$pagination	=	new pagination();
$query	=	"SELECT * FROM `student` WHERE 1"; // write the database query
/*
Call function that creates the pages
@param - database query
@param - Total number of records per page
*/
$pagination->createPaging($query,10);
echo '<table border="1" width="400" align="center">';
while($row=mysql_fetch_object($pagination->resultpage)) {
	echo '<tr><td>'.$row->name.'</td><td>'.$row->age.'</td></tr>'; // display name and age from database
}
echo '</table>';
echo '<table border="1" width="400" align="center">';
echo '<tr><td>';
$pagination->displayPaging();
echo '</td></tr>';
echo '</table>';
?>