

<div id='loginform'>
	<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
		<p>
			You are logged in as <?php echo $_SESSION['valid_user']; ?>
		</p>
		<input   class="button" type='submit' name="LC_ACTION" value='log out' />
		<input   class="button" type='submit' name="LC_ACTION" value='change your password' />
	</form>
	

	

</div>
