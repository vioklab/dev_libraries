

<div class="formPanel">

<div class="fieldnames" > 
<label>Old Password</label>
<label>New Password</label>
<label>Confirm Password</label>
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
</form>
</div>

<div class="fieldanswers">
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
<input type="password" name="oldpassword" value="<?php echo $_POST['oldpassword']; ?>">
<input type="password" name="newpassone" value="<?php echo $_POST['newpassone']; ?>">
<input type="password" name="newpasstwo" value="<?php echo $_POST['newpasstwo']; ?>">
<div class="loginbuttons">
<input   type="submit" value="change password" name="LC_ACTION" />
</form>
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
<input  type="submit" value="cancel" name="LC_ACTION" />
</form>
</div>
</div>
</div>

