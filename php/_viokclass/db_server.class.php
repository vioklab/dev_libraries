<?php
	class DB_SERVER
	{
		private $host;
		private $username;
		private $password;
		private $data_base;
		private $descriptor;
		
		function __construct($host,$username,$password,$data_base)
		{
			$this->host = $host;
			$this->username = $username;
			$this->password = $password;
			$this->data_base= $data_base;
			$this->DB_connect();
			mysql_query("SET NAMES utf8");
		}
		private function DB_Connect()
		{
			$this->descriptor = mysql_connect($this->host,$this->username,$this->password);
			mysql_select_db($this->data_base,$this->descriptor) or die(mysql_error());
		}
		public function DB_Query($query)
		{
			$this->result = mysql_query($query,$this->descriptor) or die(mysql_error());
			return $this->result;
		}
		public function DB_Extract_Rows()
		{
			if($row = mysql_fetch_array($this->result,MYSQL_ASSOC))
			{
				return $row;
			} else
			{
				return false;
			}
		}
		public function DB_Close()
		{
			// por hacer
		}
	}
?>