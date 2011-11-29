<?php

class database extends logfile{
	
	private $location = 'dev';



	function connect_to_database($by='') {

		$this->flog('database access','database.txt');
		if ($this->location == 'dev') {
			$host = "localhost"; //Database host.
			$user = "root"; //Database username.
			$pass = "password"; //Database password.
			$dbase = "dbase"; //Database.
		} else {
			$host = "localhost"; //Database host.
			$user = "root"; //Database username.
			$pass = "password"; //Database password.
			$dbase = "dbase"; //Database.
		}
		$db = new mysqli ( $host, $user, $pass, $dbase );
		
		if (mysqli_connect_errno ()) {
			$this->log ( 'error connecting to database' );
			return false;
		} else {
			return $db;
		}
		
	}


	function cleantext ($string) {

   		 $magic_quotes_active = get_magic_quotes_gpc();
   	  $new_enough_php = function_exists("mysql_real_escape_string");
    	// i.e PHP >= v4.3.0
    	if ($new_enough_php) {
        //undo any magic quote effects so mysql_real_escape_string can do the work
        if ($magic_quotes_active) {
            $string = stripslashes($string);
        } $db = $this->connect_to_database();
        $new_string = $db->real_escape_string($string);
        if (empty($new_string) && !empty($string)) {
            die("mysql_real_escape_string failed."); //insert your error handling here
        }
        $string = strip_tags($new_string);
    } else { // before PHP v4.3.0
        // if magic quotes aren't already on this add slashes manually
        if (!$magic_quotes_active) {
            $string = addslashes($string);
        } //if magic quotes are active, then the slashes already exist
    }
    return $string;
}


}
class logfile {
	private 	$index=0;
	private		$tracearray =array ();


	function flog($msg='default message',$file='log') {
	try 	{
			$from = get_class ($this);	
			$raw =debug_backtrace(); 
			$this->index =0;
			foreach($raw as $entry){ 
                
				$output=$entry['class'].$entry['type'].$entry['function']; 
				$this->tracearray[$this->index++] = $output;
       		 	} 
		}catch (Exception $e){}

		
	
	file_put_contents ( "logs/".$file, 'access '.$this->tracearray[2]. "  message ".$msg."  (" . date ( 'c' ) . " )\r\n", FILE_APPEND );
 	}

 

}



    



	
?>