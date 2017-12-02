<?php 
	session_start();	

	if (isset($_GET['logout'])) {
		session_destroy();
		unset($_SESSION['Student_Name']);
		header("location: index.php");
	}
?>	
<?php include "header.php"; ?>

	<div class="header">
		<h2>Home Page</h2>
	</div>
	<div class="content">
		<!-- logged in user information -->
		<?php  if (isset($_SESSION['Student_Name'])) : ?>
			<p>Welcome <strong><?php echo $_SESSION['Student_Name']; ?></strong></p>
			<p> <a href="index.php?logout='1'" style="color: red;">logout</a> </p>
		<?php endif ?>
	</div>

<?php include "footer.php"; ?>