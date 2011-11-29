hi and thanks for looking at my class


	 1) First thing to do is copy the dictionary folder into your root directory<br/>
	the class looks for it here.
	

	
	protected $path_to_dictionary= '/dict/dict.dic';//path from \$_SERVER['document_root']

	the class uses $_SERVER['document_root'].$path_to_dictionary 
	so not doing this means either change the code or emailing new passwords will hang the script.

	

	2) then goto the database.inc file and set up your connection

	there is two sets for my own use but i have left them in for any who can use.
	
			$host = "localhost"; //Database host.
			$user = "root"; //Database username. 
			$pass = "password"; //Database password.
			$dbase = "mydatabase"; //Database.
	

3) now create a table in the database you named above with the following structure';


-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `memberID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberName` char(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;




<?php
	$loginController->display_bar();	
	$loginController->display_page();
	echo $loginController->msg;
	echo '<br/>username = '.$loginController->get_username();
	echo '<br />user ID ='.$loginController->get_userId();
?>





Now in your script you wish to include the login bar simply add a link to the css file included with this class.
the html and css for the forms / bars etc is near 100% free from script files for easy modification of the display.


include 'LoginTracker.inc'; BEFORE !!! any session_start() calls

 and then when you want the bar to display add the following line to your script.


$loginController->display_bar();



in order to display any forms associated with the class you need to display them. 
 $loginController->display_page (); This will return true if the user has pressed / entered info or false if no action is required by the class.

so you can simply use 


	 if( !$loginController->display_page ()){
		<i>do something else</i>
 	}


or 

	 $loginController->display_page (); 


and let your script carry on regardless of if the user has asked for say registration. 
The registration form will be rendered followed by anything else in your script.

		