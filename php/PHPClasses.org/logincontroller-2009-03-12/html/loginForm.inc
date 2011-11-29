

<div id='loginform'>
	<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
		<p>Username <input type='text' name='username' /></p>
		<p>Password <input type='password'    name='password' /></p>
		<p><input class="button" type="submit" name="LC_ACTION" value='log in' /></p>
		<p><input class="button" type='submit' name="LC_ACTION" value='register' /></p>
		<p><input class="button" type='submit' name="LC_ACTION" value='forgot password?' /></p>
	</form>
</div>
