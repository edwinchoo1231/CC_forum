<?php 
	session_start(); 
	
	echo "testing 123";
	if (!isset($_SESSION['Student_Name'])) {
		$_SESSION['msg'] = "You must log in first";
		header('location: login.php');
	}
	
	if (isset($_GET['logout'])) {
		session_destroy();
		unset($_SESSION['Student_Name']);
		header("location: login.php");
	}
	
?>
<?php include "header.php"; ?>

	<div class="header">
		<h2>Home Page</h2>
	</div>
	<div class="content">

		<!-- notification message -->
		<?php if (isset($_SESSION['success'])) : ?>
			<div class="error success" >
				<h3>
					<?php 
						echo $_SESSION['success']; 
						unset($_SESSION['success']);
					?>
				</h3>
			</div>
		<?php endif ?>

		<!-- logged in user information -->
		<?php  if (isset($_SESSION['Student_Name'])) : ?>
			<p>Welcome <strong><?php echo $_SESSION['Student_Name']; ?></strong></p>
			<p> <a href="index.php?logout='1'" style="color: red;">logout</a> </p>
		<?php endif ?>
	</div>

<?php include "footer.php"; ?>