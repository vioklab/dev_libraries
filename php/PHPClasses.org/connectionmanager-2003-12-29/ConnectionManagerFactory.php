<?php
include_once("phpClasses/ConnectionManager/ConnectionManager.php");
include_once("includes/DBTypes.php");

/**
* class DatabaseQueriesFactory
*
* { Description :- 
*	This class is a factory returning an connection Manager object for the specified database(MySQL/MSSQL).
* }
*/

class ConnectionManagerFactory
{
	function getInstanceOf($DBType="")
	{
		switch($DBType)
		{
			case MYSQL:
			{
				return new MySqlConnectionManager();
				break;
			}
			
			case MSSQL:
			{
				return new MSSqlConnectionManager();
				break;
			}
			
			default:
				return new MySqlConnectionManager();
		}
	}
}
?>
