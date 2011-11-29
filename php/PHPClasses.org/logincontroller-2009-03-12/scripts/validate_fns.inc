<?php


function valid_email($email)
{
if (ereg ('^[a-zA-z0-9 \._\-]+@([a-zA-Z0-9][a-zA-z0-9\-]*\.)+[a-zA-Z]+$',$email))
	return true;
else
	return false;


}

?>