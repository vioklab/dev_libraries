

<div class="formPanel">

<div class="fieldnames" > 
<label>Username</label>
<label>Email</label>
<label>confirm Email</label>
<label>Password</label>
<label>confirm Password</label>
</div>

<div class="fieldanswers">
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
<input type="text" name="username" value="<?php echo $_POST['username']; ?>">
<input type="text" name="email" value="<?php echo $_POST['email']; ?>">
<input type="text" name="emailconfirm" value="<?php echo $_POST['emailconfirm']; ?>">
<input type="password" name="password" value="<?php echo $_POST['password']; ?>">
<input type="password" name="passwordconfirm" value="<?php echo $_POST['passwordconfirm']; ?>">
<div class="loginbuttons">
<input  type="submit" value="process registration" name="LC_ACTION" />
</form>
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method='post'>
<input type="submit" value="cancel" name="LC_ACTION" >
</form>
</div></div>
</div>

