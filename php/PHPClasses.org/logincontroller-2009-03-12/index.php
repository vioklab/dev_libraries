<?php
include 'LoginTracker.inc';

?>

<html>
	<head>
		<title>LoginController Demo</title>

		<link rel='stylesheet' type='text/css' href='css/loginControl.css' />
	</head>
	<body>


	<h2>hi and thanks for looking at my class</h2>
	 1) First thing to do is copy the dictionary folder into your root directory<br/>
	the class looks for it here.
	<ul><li>
	<b><i>protected $path_to_dictionary= '/dict/dict.dic';//path from \$_SERVER['document_root']</i></b></li></ul>";

	the class uses \$_SERVER['document_root'].$path_to_dictionary <br/>
	so not doing this means either change the code or emailing new passwords will hang the script.

	<br/>2) then goto the database.inc file and set up your connection<br/>

	there is two sets for my own use but i have left them in for any who can use.<br />
	<b><ul>
		<li>			$host = "localhost"; //Database host.</li>
		<li>		$user = "root"; //Database username. </li>
		<li>		$pass = "password"; //Database password.</li>
		<li>		$dbase = "mydatabase"; //Database.</li>
	</ul></b><br/>

3) now create a table in the database you named above with the following structure';

<b>
<br/>-- Table structure for table `members`
<br/>--

<br/>CREATE TABLE IF NOT EXISTS `members` (
<br/>  `memberID` int(10) unsigned NOT NULL AUTO_INCREMENT,
<br/>  `memberName` char(20) NOT NULL,
<br/>  `password` varchar(64) NOT NULL,
<br/>  `email` varchar(128) NOT NULL,
<br/>  PRIMARY KEY (`memberID`)
<br/>) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
<br/></b>



<br/><br/><div> <h3>This will carry on with a demo login bar + forms /msgs once database and directorys set up correctly<br/> it will also explain some simple lines of code to add the bar / funtions to your script</h3>
<?php
	$loginController->display_bar();	
	$loginController->display_page();
	echo $loginController->msg;
	echo '<br/>username = '.$loginController->get_username();
	echo '<br />user ID ='.$loginController->get_userId();
?>
</div>

</body></html>

<br/>
Now in your script you wish to include the login bar simply add a link to the css file included with this class.<br/>
the html and css for the forms / bars etc is near 100% free from script files for easy modification of the display.

<ul><li>
<b>include 'LoginTracker.inc';</li>
</ul></b> BEFORE !!! any session_start() calls

<br/> and then when you want the bar to display add the following line to your script.

<ul><li>
<b>$loginController->display_bar();</li>
</ul></b>
<br>

in order to display any forms associated with the class you need to display them. 
 \$loginController->display_page (); This will return true if the user has pressed / entered info or false if no action is required by the class.

so you can simply use 

<pre>
	 if( !$loginController->display_page ()){
		<i>do something else</i>
 	}
</pre>

or 
<pre>
	 $loginController->display_page (); 
</pre>

and let your script carry on regardless of if the user has asked for say registration. 
The registration form will be rendered followed by anything else in your script.<br />

		