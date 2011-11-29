<?php

include_once('includes/constants.php');

/**
* class ConnectionManager
*
* { Description :- 
*	Class to establish connection and select database with a database server. This is the Base Class
* }
*/

class ConnectionManager
{
	var $hostName;
	var $userName;
	var $passWord;
	var $conHandle;
	
	/**
	* Method ConnectionManager::getConnectionHandle()
	*
	* { Description :- 
	*	This method returns the connection handle.
	* }
	*/
	
	function getConnectionHandle()
	{
		return $this->conHandle;
	}
}

/**
* class ConnectionManager
*
* { Description :- 
*	Class to establish connection and select database with a database server. This is the sub class of ConnectionManager class
* }
*/

class MySqlConnectionManager extends ConnectionManager
{
	/**
	* Method MySqlConnectionManager::MySqlConnectionManager()
	*
	* { Description :- 
	*	Constructor
	* }
	*/
	
	function MySqlConnectionManager()
	{
		$this->hostName = MYSQL_SERVER_NAME;
		$this->userName = MYSQL_DB_USERID;
		$this->passWord = MYSQL_DB_PASSWORD;
	}
	
	/**
	* Method ConnectionManager::doConnection()
	*
	* { Description :- 
	*	This method connects to the MySQL Database Server
	* }
	*/
	
	function doConnection()
	{
		if(!($this->conHandle = mysql_connect($this->hostName, $this->userName, $this->passWord)))
		{			
				die("Cannot Connect to Host");
		}
	}
	
	/**
	* Method ConnectionManager::selectDatabase()
	*
	* { Description :- 
	*	This method selects MySQL Database
	* }
	*/
	
	function selectDatabase()
	{
		mysql_select_db(DATABASE_NAME, $this->conHandle);		
	}	
}

class MSSqlConnectionManager extends ConnectionManager
{
	function MSSqlConnectionManager()
	{
		$this->hostName = MSSQL_SERVER_NAME;
		$this->userName = MSSQL_DB_USERID;
		$this->passWord = MSSQL_DB_PASSWORD;
	}
	
	function doConnection()
	{
		if(!($this->conHandle = mssql_connect($this->hostName, $this->userName, $this->passWord)))
		{			
				die("Cannot Connect to Host");
		}				
	}
	
	function selectDatabase()
	{
		mssql_select_db(DATABASE_NAME, $this->conHandle);
	}	
}
?>