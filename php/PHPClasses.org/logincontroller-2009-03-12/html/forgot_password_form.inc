
<div class="formPanel">

<div class="fieldnames" > 
<label>enter your username</label>

</div>

<div class="fieldanswers">
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
<input type="text" name="username" value="<?php echo $_POST['username'];?>">
<input type='hidden' name='form' value='sent' >
<div class="loginbuttons">
<input  type="submit" value="Email My Password" name="LC_ACTION" />
</form>
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
<input  type="submit" value="cancel" name="LC_ACTION" />
</form>
</div>
</div>
</div>

