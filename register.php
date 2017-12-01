<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
	<title>Registration system PHP and MySQL</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="header">
		<h2>Register</h2>
	</div>
	
	<form method="post" action="register.php">

		<?php include('errors.php'); ?>

		<div class="input-group">
			<label>Student_Name</label>
			<input type="text" name="Student_Name" value="<?php echo $Student_Name; ?>">
		</div>
		<div class="input-group">
			<label>Email</label>
			<input type="email" name="Student_Email" value="<?php echo $Student_Email; ?>">
		</div>
		<div class="input-group">
			<label>Password</label>
			<input type="Student_Password" name="Student_Password">
		</div>
		<div class="input-group">
			<label>Confirm password</label>
			<input type="password" name="password_2">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="reg_user">Register</button>
		</div>
		<p>
			Already a member? <a href="login.php">Sign in</a>
		</p>
	</form>
</body>
</html>