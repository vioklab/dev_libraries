<?php
/****
File name : pagination.class.php
Description : Class file which creates the pagination .
Author : Shijith. M
Date : 6th August 2008
****/
class pagination {

	var $fullresult;    // record set that contains whole result from database
	var $totalresult;   // Total number records in database
	var $query;         // User passed query
	var $resultPerPage; //Total records in each pages
	var $resultpage;	// Record set from each page
	var $pages;			// Total number of pages required
	var $openPage;		// currently opened page
	
/*
@param - User query
@param - Total number of result per page
*/
	function createPaging($query,$resultPerPage) 
	{
		$this->query		=	$query;
		$this->resultPerPage=	$resultPerPage;
		$this->fullresult	=	mysql_query($this->query);
		$this->totalresult	=	mysql_num_rows($this->fullresult);
		$this->pages		=	$this->findPages($this->totalresult,$this->resultPerPage);
		if(isset($_GET['page']) && $_GET['page']>0) {
			$this->openPage	=	$_GET['page'];
			if($this->openPage > $this->pages) {
				$this->openPage	=	1;
			}
			$start	=	$this->openPage*$this->resultPerPage-$this->resultPerPage;
			$end	=	$this->resultPerPage;
			$this->query.=	" LIMIT $start,$end";
		}
		elseif($_GET['page']>$this->pages) {
			$start	=	$this->pages;
			$end	=	$this->resultPerPage;
			$this->query.=	" LIMIT $start,$end";
		}
		else {
			$this->openPage	=	1;
			$this->query .=	" LIMIT 0,$this->resultPerPage";
		}
		$this->resultpage =	mysql_query($this->query);
	}
/*
function to calculate the total number of pages required
@param - Total number of records available
@param - Result per page
*/
	function findPages($total,$perpage) 
	{
		$pages	=	intval($total/$perpage);
		if($total%$perpage > 0) $pages++;
		return $pages;
	}
	
/*
function to display the pagination
*/
	function displayPaging() 
	{
		$self	=	$_SERVER['PHP_SELF'];
		if($this->openPage<=0) {
			$next	=	2;
		}

		else {
			$next	=	$this->openPage+1;
		}
		$prev	=	$this->openPage-1;
		$last	=	$this->pages;

		if($this->openPage > 1) {
			echo "<a href=$self?page=1>First</a>&nbsp&nbsp;";
			echo "<a href=$self?page=$prev>Prev</a>&nbsp&nbsp;";
		}
		else {
			echo "First&nbsp&nbsp;";
			echo "Prev&nbsp&nbsp;";
		}
		for($i=1;$i<=$this->pages;$i++) {
			if($i == $this->openPage) 
				echo "$i&nbsp&nbsp;";
			else
				echo "<a href=$self?page=$i>$i</a>&nbsp&nbsp;";
		}
		if($this->openPage < $this->pages) {
			echo "<a href=$self?page=$next>Next</a>&nbsp&nbsp;";
			echo "<a href=$self?page=$last>Last</a>&nbsp&nbsp;";
		}
		else {
			echo "Next&nbsp&nbsp;";
			echo "Last&nbsp&nbsp;";
		}	
	}
}
?>