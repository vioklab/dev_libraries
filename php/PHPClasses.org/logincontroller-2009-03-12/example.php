<?php
include 'LoginTracker.inc';

	//to display login bar
	$loginController->display_bar();	


	/*to display login forms such as registration / email password etc
	this function can take a form name as paramater and therefore force showing
	a page even if user interction with the login bar doesn't call for one */
	$loginController->display_page();

	/* to display any messages. error messages and form validation all in one. 
	should be two variables both retrieved via function calls but... */
	echo $loginController->msg;


	/* to display forms relating to this class and not run past.
	function returns true if page(form) shown or false if not */
	 if( !$loginController->display_page ()){
		<i>do something else</i>
 	} else {
		<i>stuff to do after reg form etc rendered</i>
	}
	
	//function will return name or false
	echo '<br/>username = '.$loginController->get_username();

	//function will return user ID or false
	echo '<br />user ID ='.$loginController->get_userId();

	 $loginController->display_page (); 
?>