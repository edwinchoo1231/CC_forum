<?php include('server.php') ?>
<?php include "header.php"; ?>

	<div class="header">
		<h2>Login</h2>
	</div>
	
	<form method="post" action="login.php">

		<?php include('errors.php'); ?>

		<div class="input-group">
			<label>Student_Name</label>
			<input type="text" name="Student_Name" >
		</div>
		<div class="input-group">
			<label>Password</label>
			<input type="password" name="Student_Password">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="login_user">Login</button>
		</div>
		<p>
			Not yet a member? <a href="register.php">Sign up</a>
		</p>
	</form>

<?php include "footer.php"; ?>