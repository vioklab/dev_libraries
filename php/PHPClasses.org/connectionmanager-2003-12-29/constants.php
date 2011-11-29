<?php
// MySQL Database Constants
define(MYSQL_SERVER_NAME, "your_mysql_host_name");
define(MYSQL_DB_USERID, "your_mysql_userid");
define(MYSQL_DB_PASSWORD, "your_mysql_password");
define(MYSQL_DATABASE_NAME, "your_mysql_databasename");

// MSSql Database Constants
define(MSSQL_SERVER_NAME, "your_mssql_host_name");
define(MSSQL_DB_USERID, "your_mssql_userid");
define(MSSQL_DB_PASSWORD, "your_mssql_password");
define(MSSQL_DATABASE_NAME, "your_mssql_databasename");


// DATABASE_NAME = MYSQL_DATABASE_NAME if MySQL database
// DATABASE_NAME = MSSQL_DATABASE_NAME if MSSQL database
define(DATABASE_NAME, MYSQL_DATABASE_NAME);
?>