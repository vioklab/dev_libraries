<?php


include_once 'scripts/validate_fns.inc';
include_once 'classes/database/database.inc';


/* including this file LoginTracker.inc in you script will 
* 1) create a session 
* 2) create an instance of + LoginTracker
* 3) pre process any actions relating to login
* to display the login bar add 	$loginController->display_bar();
* where you want it to occur in your document flow. 
* to display any required pages (register / password reminder etc)
* add $loginController->display_page (); where you want it to occur in you document flow */

	
/* if you want to start session or delay creation of class instance copy the code at
the END of this file into you scripts.	
*/



class loginController extends database {
	var $loggedin_name="";
	var $loggedin_ID="";
	var $msg ="";
	var $log = TRUE;
	var $log_file = 'tracefile.txt';
	var $HTML_Page ="";
	var $HTML_Panel = "loginForm.inc";
	var $show_HTML_Page = FALSE;
	// form field name=action from html pages
	var $action_required="";
 	/*directory paths*/
	//path from logintracker folder - where ever this file is
	protected $path_to_html = 'html/'; 
	protected $path_to_dictionary= '/dict/dict.dic';//path from $_SERVER['document_root'].

	/*email smtp*/
	// eg $smtp ="mail.username.com"
	private $smtp = "mail.host.com";
	private $smtp_port = "80";
	private $from = 'user@host.com';

	
	function __construct() {

		$this->log ( "loginController() called" );
		return true;
	}
	
	function get_username() {
		if (!empty($this->loggedin_name) ){
			return $this->loggedin_name;
		}
		else return false;

	}

	function get_userId() {
		if (!empty($this->loggedin_ID))
			return $this->loggedin_ID;
		else return false;

	}

	function __set($name, $value) {
		$this->$name = $value;
		$this->log ( "change -> $name <- $value" );
	}
	
	function display_bar($page='') {
		if ($page == '')
			$page = $this->HTML_Panel;
		include $this->path_to_html.$page;
	
	}
	
	function display_page($page = '') {
		if ($page == '')
			$page = $this->HTML_Page;
		if ($page== '')
			return false;
		
		include $this->path_to_html.$page;
		return true;
	
	}
	function process_action($action_required='') {
		echo $action_required;
		if (isset ( $_POST ['LC_ACTION'] )) {
			$this->action_required = $_POST ['LC_ACTION'];
			unset ( $this->msg );
		unset ( $this->HTML_Page );
				$this->show_HTML_Page = FALSE;
				


		$this->log ( "TL_ACTION >> " . $this->action_required ." <<");
		switch ($this->action_required) {
			case 'register' :
				
				$this->show_HTML_Page = TRUE;
				$this->HTML_Page = 'user_registrationForm.inc';
				header ( "location: " . $_SERVER ["REQUEST_URI"] );
				break;
			case 'cancel' :
				
				
				$_POST = array ();
				header ( "location: " . $_SERVER ["REQUEST_URI"] );
				break;
			case 'forgot password?' :
				
				$this->show_HTML_Page = TRUE;
				$this->HTML_Page = 'forgot_password_form.inc';
				header ( "location: " . $_SERVER ["REQUEST_URI"] );
				break;
			case 'log in' :
				
				if ($this->check_login_request ())
					{
						$this->HTML_Panel = 'loggedinpanel.inc';
						unset($_SESSION['fid']);
						unset($_SESSION['tid']);
					}
				
				header ( "location: " . $_SERVER ["REQUEST_URI"] );
				break;
			case 'log out' :
				$_SESSION = array ();
				session_destroy ();
				header ( "location: " . $_SERVER ["REQUEST_URI"] );
				break;
			case 'process registration' :
				
				if (! $this->validate_registration_form ()) {
					$this->show_HTML_Page = TRUE;
					$this->HTML_Page = 'user_registrationForm.inc';
					break;
				} else {
					//if valid submit to database (add public forum privs)
					if (! $this->add_user_to_db ()) {
						$this->msg = "<p id='lt_msg'>There was an error adding you to the members list. Please try again or contact forum admin if the problem persists.</p>";
						header ( "location: " . $_SERVER ["REQUEST_URI"] );
						break;
					}
					
					$this->msg = "<p id='lt_msg'>Registration Complete</p>";
					$this->HTML_Panel = 'loggedinpanel.inc';
					header ( "location: " . $_SERVER ["REQUEST_URI"] );
					break;
				}
				break;
			case 'change your password' :
				$this->show_HTML_Page = TRUE;
				$this->HTML_Page = 'change_PasswordForm.inc';
				header ( "location: " . $_SERVER ["REQUEST_URI"] );
				break;
			case 'change password' :
				if (! $this->validate_password_form ()) {
					$this->show_HTML_Page = TRUE;
					$this->HTML_Page = 'change_PasswordForm.inc';
				break;
					} 
				else 	{
					//if valid submit to database
					if (! $this->change_password_in__db ()) {
						$this->msg = "<p id='lt_msg'>Your Password was entered wrong. Try again.</p>";
						$this->show_HTML_Page = TRUE;
						$this->HTML_Page = 'change_PasswordForm.inc';
						header ( "location: " . $_SERVER ["REQUEST_URI"] );
				break;
					}
					
					$this->msg = "<p id='lt_msg'>Password Changed</p>";
					header ( "location: " . $_SERVER ["REQUEST_URI"] );
					break;
				}
				
			case 'Email My Password' :
				if (!$this->reset_password ()) {
					$this->show_HTML_Page = TRUE;
					$this->HTML_Page = 'forgot_password_form.inc';
					break;
				}
				$this->msg ="<p id='lt_msg'>New password Mailed</p>";
				header ( "location: " . $_SERVER ["REQUEST_URI"] );
				break;
		}
	}
	
	}
	
	function reset_password() {
		$newPassword = '';
		$dict = $_SERVER['DOCUMENT_ROOT'].$this->path_to_dictionary;

		if (is_file($dict))
			$fp = fopen ( $dict, 'r' );
		if ( ! $fp  ) {
			$this->msg = "<p id='lt_msg'>could not generate a new random password.</p>";
			return false;
		}
		$size = filesize ( $dict );
		
		srand ( ( double ) microtime () * 1000000 );
		$rand_location = rand ( 0, $size );
		fseek ( $fp, $rand_location );
		
		while ( strlen ( $newPassword ) < 6 || strlen ( $newPassword ) > 12 || strstr ( $newPassword, "'" ) ) {
			if (feof ( $fp ))
				fseek ( $fp, 0 );
			$newPassword = fgets ( $fp, 80 );
			$newPassword = fgets ( $fp, 80 );
		}
		;
		$newPassword = trim ( $newPassword );
		
		srand ( ( double ) microtime () * 1000000 );
		$rn = rand ( 0, 999 );
		$newPassword .= $rn;
		$db = $this->connect_to_database ();
		
		$query = "update members set password ='" . sha1 ( $newPassword ) . "' where memberName='" . $_POST ['username'] . "'";
		
		$result = $db->query ( $query );
		if (! $result) {
			$this->msg = "<p id='lt_msg'>could not change your password</p>";
			return false;
		}
		
		$query = "select email from members where memberName='" . $this->cleantext($_POST ['username']) . "'";
		$result = $db->query ( $query );
		if (! $result) {
			$this->msg = "<p id='lt_msg'>not changed as could not email your new password</p>";
			return false;
		} else if ($result->num_rows == 0) {
			$this->msg = "<p id='lt_msg'>could not find this member</p>";
			return false;
		}
		
	

		ini_set ( "SMTP", $this->smtp );
		ini_set ( "smtp_port", $this->smtp_port );
		ini_set ( 'sendmail_from', $this->from );
		
		$row = $result->fetch_object ();
		$email = $row->email;

		$from = "From: ". $this->from ."\r\n";
		$msg = "<p id='lt_msg'>Your new password is " . $newPassword . ". Please change it at www.davejlhale.com/myforum/\r\n</p>";
		
		if (mail ( $email, 'dForum login info', $msg, $from ))
			return true;
		else
			return false;
	
	}
	
	function validate_password_form() {
		
		foreach ( $_POST as $key => $value ) {
			
			if (! isset ( $key ) || ($value == '')) {
				$this->msg = "<p id='lt_msg'>You need to supply all answers</p>";
				return false;
			}
		}
		
		$oldpass = $_POST ['oldpassword'];
		$newpass1 = $_POST ['newpassone'];
		$newpass2 = $_POST ['newpasstwo'];
		
		if ($newpass1 != $newpass2) {
			
			$this->msg = "<p id='lt_msg'>Passwords were not the same</p>";
			return false;
		}
		if (strlen ( $newpass1 ) < 6) {
			$this->msg = "<p id='lt_msg'>Password needs to be at least 6 characters long</p>";
			return false;
		}
		if ($newpass1 == $oldpass)
		{
			$this->msg = "<p id='lt_msg'>Your old password is the same as your new choice</p>";
			return false;
		}
		return true;
	}
	
	function change_password_in__db() {
		$db = $this->connect_to_database ();
		$query = "update members set password ='" . sha1 ( $_POST ['newpassone'] ) . "' where memberName ='" . $this->loggedin_name . "' and password='" . sha1 ( $_POST ['oldpassword'] ) . "'";
		
		
		$result = $db->query ( $query );
		$result = mysqli_affected_rows ( $db );
		$this->log ( $query.' '.$result );
		if ($result == 1)
			return true;
		else {
			return false;
		}
	
	}
	
	function validate_registration_form() {
		
		foreach ( $_POST as $key => $value ) {
			
			if (! isset ( $key ) || ($value == '')) {
				$this->msg = "<p id='lt_msg'>You need to supply all answers</p>";
				return false;
			}
		}
		$db = $this->connect_to_database ();
		
		$query = "select * from members where membername = '" . $this->cleantext($_POST ['username']) . "'";
		
		$result = $db->query ( $query );
		$num_results = $result->num_rows;
		
		//if user validates
		if ($num_results) {
			$row = $result->fetch_assoc ();
			
			$this->msg = "<p id='lt_msg'>That username is allready in use. Please try a different name.</p>";
			$db->close ();
			return false;
		}
		$db->close ();
		if ( strip_tags($_POST ['username']) != $_POST ['username']) {
			$this->msg = "<p id='lt_msg'>That name contains illegal HTML. Please try a different name.</p>";
			return false;
		}
			
		
		//valid_email function outside of class for ease of modifying the reg string for pattern match
		if (! valid_email ( $_POST ['email'] )) {
			$this->msg = "<p id='lt_msg'>the email you supplied does not appear to be valid</p>";
			return false;
		}
		if (! (trim ( $_POST ['email'] ) == trim ( $_POST ['emailconfirm'] ))) {
			$this->msg = "<p id='lt_msg'>the emails you supplied are different</p>";
			return false;
		}
		if (! (trim ( $_POST ['password'] ) == trim ( $_POST ['passwordconfirm'] ))) {
			$this->msg = "<p id='lt_msg'>the passwords you supplied are different</p>";
			return false;
		}
		if (strlen($_POST['password'])<6) {
			$this->msg = "<p id='lt_msg'>the password needs to be at least 6 characters/numbers long</p>";
			return false;
		}
		return true;
	
	}
	
	function log($msg = "<p id='lt_msg'>Unspecified log entry</p>") {
		if (isset ( $this->log ) && isset ( $this->log_file )) {
			//log entrye
			

			@file_put_contents ( "logs/".$this->log_file, $msg . "  (" . date ( 'c' ) . " )\r\n", FILE_APPEND );
		}
	}
	
	function check_login_request() {
		if (($_POST ['username']) != '' && ($_POST ['password']) != '') {
			$username = $this->cleantext($_POST ['username']);
			$password = $this->cleantext($_POST ['password']);
		
			$db = $this->connect_to_database ();
			$query = 'select * from members where membername = ' . "'$username'" . ' and password="' . sha1 ( $password ) . '"';
			$this->log ( $query );
			
			$result = $db->query ( $query );
			$num_results = $result->num_rows;
			$this->log ( "found " . $num_results );
			
			//if user validates
			if ($num_results) {
				$row = $result->fetch_assoc ();
				$this->loggedin_name = stripslashes($username);
				$this->loggedin_ID = $memberID;
				$_SESSION ['valid_user'] = stripslashes($username);
				$_SESSION ['memberID'] = $row ['memberID'];
				unset ( $this->msg );
				$this->log ( "logged in " . $_SESSION ['valid_user'] . " with id " . $_SESSION ['memberID'] );
				return true;
			} else {
				$query = 'select membername from members where membername ="' . $username . '"';
				$result = $db->query ( $query );
				$num_results = $result->num_rows;
				$this->log ( $num_results . " result from > " . $query );
				if ($num_results != 1) {
					$this->msg = "<p id='lt_msg'>Unknown Member Name</p>";
				} else {
					$this->msg = "<p id='lt_msg'>Wrong Password Given</p>";
				}
				$this->log ( $this->msg );
				return false;
			}
		
		}
		if ($_POST ['username'] == '')
			$this->msg = "<p id='lt_msg'>No Member Name</p>";
		else {
			if ($_POST ['password'] == '')
				$this->msg = "<p id='lt_msg'>No Password Given</p>";
		}
		$this->log ( $this->msg );
		return false;
	}
	
	function add_user_to_db() {
		$db = $this->connect_to_database ();
		$password = $_POST ['password'];
		$username = $_POST ['username'];
		$email = $_POST ['email'];
		$query = "insert into members values (NULL, '" . $this->cleantext($_POST ['username']) . "','" . sha1 ( $password ) . "','" . $this->cleantext($_POST ['email']) . "')";
		$this->log ( $query );
		$result = $db->query ( $query );
		$memberID = $db->insert_id;
		
		if ($result) {
			$this->loggedin_name = $username;
			$this->loggedin_ID = $row ['memberID'];
			$_SESSION ['memberID'] = $memberID;
			$_SESSION ['valid_user'] = $_POST ['username'];

		}
		
		if ($result) {
			return true;
		} else
			return false;
	}

}

	/* move this code to your script if you want to control when this class / session start */
	//start session
	session_start();

	/*** start or recall any instance of loginController held by active session
	the object $loginController is availiable to your script. */
	if (! isset ( $_SESSION ['loginController'] )) {
		$_SESSION ['loginController'] = new loginController ( );
	} 
	$loginController= $_SESSION ['loginController'];
	//pre process any class actions
	$loginController->process_action();

	
?>

